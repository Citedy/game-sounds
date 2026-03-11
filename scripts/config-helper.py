#!/usr/bin/env python3
"""Config helper for game-sounds — keeps JSON logic out of bash."""

import json
import random
import sys


def load(path):
    with open(path) as f:
        return json.load(f)


def save(path, config):
    with open(path, "w") as f:
        json.dump(config, f, indent=2)
        f.write("\n")


def main():
    if len(sys.argv) < 3:
        print("Usage: config-helper.py <config-path> <command> [args...]", file=sys.stderr)
        sys.exit(1)

    config_path = sys.argv[1]
    cmd = sys.argv[2]
    args = sys.argv[3:]
    c = load(config_path)

    if cmd == "get":
        key = args[0]
        default = args[1] if len(args) > 1 else ""
        print(c.get(key, default))

    elif cmd == "set":
        key, value = args[0], json.loads(args[1])
        c[key] = value
        save(config_path, c)

    elif cmd == "event-enabled":
        category = args[0]
        print(c.get("enabled_events", {}).get(category, True))

    elif cmd == "rotation-list":
        r = c.get("pack_rotation", [])
        if r:
            print("\n".join(r))

    elif cmd == "rotation-csv":
        r = c.get("pack_rotation", [])
        if r:
            print(", ".join(r))

    elif cmd == "rotation-add":
        pack = args[0]
        r = c.get("pack_rotation", [])
        if pack not in r:
            r.append(pack)
        c["pack_rotation"] = r
        save(config_path, c)

    elif cmd == "rotation-remove":
        pack = args[0]
        r = c.get("pack_rotation", [])
        if pack in r:
            r.remove(pack)
        c["pack_rotation"] = r
        save(config_path, c)

    elif cmd == "rotation-pick":
        r = c.get("pack_rotation", [])
        if r:
            print(random.choice(r))

    else:
        print(f"Unknown command: {cmd}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
