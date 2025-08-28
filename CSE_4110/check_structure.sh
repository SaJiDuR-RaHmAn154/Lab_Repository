#!/bin/bash
# Simple LaTeX document structure checker

echo "Checking document structure..."

# Count begin and end environments
begin_figure=$(grep -c "\\\\begin{figure}" main.tex)
end_figure=$(grep -c "\\\\end{figure}" main.tex)

begin_table=$(grep -c "\\\\begin{table}" main.tex)
end_table=$(grep -c "\\\\end{table}" main.tex)

begin_tabular=$(grep -c "\\\\begin{tabular}" main.tex)
end_tabular=$(grep -c "\\\\end{tabular}" main.tex)

begin_itemize=$(grep -c "\\\\begin{itemize}" main.tex)
end_itemize=$(grep -c "\\\\end{itemize}" main.tex)

begin_enumerate=$(grep -c "\\\\begin{enumerate}" main.tex)
end_enumerate=$(grep -c "\\\\end{enumerate}" main.tex)

echo "Figure environments: begin=$begin_figure, end=$end_figure"
echo "Table environments: begin=$begin_table, end=$end_table"
echo "Tabular environments: begin=$begin_tabular, end=$end_tabular"
echo "Itemize environments: begin=$begin_itemize, end=$end_itemize"
echo "Enumerate environments: begin=$begin_enumerate, end=$end_enumerate"

# Check for mismatches
if [ $begin_figure -ne $end_figure ]; then
    echo "ERROR: Figure environment mismatch!"
fi
if [ $begin_table -ne $end_table ]; then
    echo "ERROR: Table environment mismatch!"
fi
if [ $begin_tabular -ne $end_tabular ]; then
    echo "ERROR: Tabular environment mismatch!"
fi
if [ $begin_itemize -ne $end_itemize ]; then
    echo "ERROR: Itemize environment mismatch!"
fi
if [ $begin_enumerate -ne $end_enumerate ]; then
    echo "ERROR: Enumerate environment mismatch!"
fi
