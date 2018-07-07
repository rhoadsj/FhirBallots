import io

with open("tracker.xml", "r") as f:
    b = f.read()

bad_char = chr(133)
pos = b.find(bad_char)
if pos < 0:
    print("not found")

print(pos)

print(b[pos-30:pos+30])
