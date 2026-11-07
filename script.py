# ** Code Dumper python script -> RocketGame.dump
# ! Doesn't work without python 3.14
from pathlib import Path

_SEARCHED_FILES = [".cpp",".hpp",".h",".c++"]

root = Path.cwd()
file = Path("output.txt")

fullText = ""




for obs in root.rglob("*"):
    if obs.is_file() and obs.suffix in (_SEARCHED_FILES) and not "build" in obs.parts:
        print(obs)
        fullText += "\n\n"
        fullText += f"FILE: {obs}"
        fullText += obs.read_text()
        fullText += "\n\n"
    else:
        continue


file.write_text(fullText, encoding="utf-8")


