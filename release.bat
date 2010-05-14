set FILENAME=NJUthesis
latex %FILENAME%.ins
latex %FILENAME%.dtx
latex %FILENAME%.dtx
dvipdfmx %FILENAME%
move %FILENAME%.cfg %FILENAME%/
move %FILENAME%.cls %FILENAME%/
move %FILENAME%.pdf %FILENAME%/
del /Q *.aux *.dvi *.glo *.idx *.log *.toc *.diff
pause