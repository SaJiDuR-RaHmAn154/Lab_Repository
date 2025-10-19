#!/usr/bin/env python3
import re

# Read the file
with open('tech.tex', 'r', encoding='utf-8') as f:
    content = f.read()

# Fix all \tableheaderrow commands
def fix_tableheader(match):
    inner = match.group(1)
    cells = [cell.strip() for cell in inner.split('&')]
    formatted_cells = [f'\\textbf{{\\textcolor{{white}}{{{cell}}}}}' for cell in cells]
    return '\\rowcolor{headercolor}\n        ' + ' & '.join(formatted_cells)

content = re.sub(r'\\tableheaderrow\{([^}]+)\}', fix_tableheader, content)

# Write back
with open('tech.tex', 'w', encoding='utf-8') as f:
    f.write(content)

print("Fixed all table headers!")
