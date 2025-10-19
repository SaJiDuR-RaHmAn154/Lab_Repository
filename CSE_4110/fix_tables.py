#!/usr/bin/env python3
import re

# Read the file
with open('tech.tex', 'r', encoding='utf-8') as f:
    content = f.read()

# Define replacement patterns
replacements = [
    (r'\\tableheaderrow\{Characteristics & Candidate System 1 & Candidate System 2\}',
     r'\\rowcolor{headercolor}\n        \\textcolor{white}{\\textbf{Characteristics}} & \\textcolor{white}{\\textbf{Candidate System 1}} & \\textcolor{white}{\\textbf{Candidate System 2}}'),
    
    (r'\\tableheaderrow\{Evaluation Criteria & Candidate System 1 & Candidate System 2\}',
     r'\\rowcolor{headercolor}\n        \\textcolor{white}{\\textbf{Evaluation Criteria}} & \\textcolor{white}{\\textbf{Candidate System 1}} & \\textcolor{white}{\\textbf{Candidate System 2}}'),
    
    (r'\\tableheaderrow\{Phase & Candidate System 1 & Candidate System 2\}',
     r'\\rowcolor{headercolor}\n        \\textcolor{white}{\\textbf{Phase}} & \\textcolor{white}{\\textbf{Candidate System 1}} & \\textcolor{white}{\\textbf{Candidate System 2}}'),
    
    (r'\\tableheaderrow\{Evaluation Criteria & Weighting Factor & Candidate System 1 Score & Candidate System 2 Score\}',
     r'\\rowcolor{headercolor}\n        \\textcolor{white}{\\textbf{Evaluation Criteria}} & \\textcolor{white}{\\textbf{Weighting Factor}} & \\textcolor{white}{\\textbf{Candidate System 1 Score}} & \\textcolor{white}{\\textbf{Candidate System 2 Score}}'),
]

# Apply all replacements
for pattern, replacement in replacements:
    content = re.sub(pattern, replacement, content)

# Write back
with open('tech.tex', 'w', encoding='utf-8') as f:
    f.write(content)

print("✓ Fixed all table headers successfully!")
