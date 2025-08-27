import re
from collections import defaultdict

def parse_policy_facts(text: str):
    atoms = {}
    relations = defaultdict(set)

    # Match lines like "readpost a" or "user s"
    atom_pattern = re.compile(r"(\w+)\s+(\w+)")
    # Match relations like "friendof s s"
    rel_pattern = re.compile(r"(\w+)\s+(.*)")

    lines = [line.strip().lower() for line in text.splitlines() if line.strip()]

    for line in lines:
        parts = line.split()
        if len(parts) == 2:
            # This is an atom declaration
            atom_type, var = parts
            atoms[var] = atom_type
        else:
            # This is a relation
            m = rel_pattern.match(line)
            if m:
                rel = m.group(1)
                args = tuple(m.group(2).split())
                relations[rel].add(args)

    return atoms, relations


def pretty_print(atoms, relations):
    print("Atoms:")
    for var, typ in atoms.items():
        print(f"name: {var}, type: {typ}")
    print()
    print("Relations:")
    for rel, tuples in relations.items():
        print(f"  {rel} = {tuples}")


if __name__ == "__main__":
    sample = """\
readpost a
user s
post r
canviewasfriend
canviewascoworker s r
owns s r
friendof
coworkerof s s
canviewasfamily
familyof s s
"""
    atoms, relations = parse_policy_facts(sample)
    pretty_print(atoms, relations)
