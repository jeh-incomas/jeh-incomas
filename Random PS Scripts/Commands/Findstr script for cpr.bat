# This script will search for the string "CPR" in all files in the Incomas folder and its subfolders.
cd X:\Incomas\Environmental Products\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\EP_cpr_results.txt
cd X:\Incomas\Finance\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\Finance_cpr_results.txt
cd X:\Incomas\General\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\General_cpr_results.txt
cd X:\Incomas\IT\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\IT_cpr_results.txt
cd X:\Incomas\Legal and Market Access\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\LMA_cpr_results.txt
cd X:\Incomas\People & Culture\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\P&C_cpr_results.txt
cd X:\Incomas\Quantitative Solutions\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\QS_cpr_results.txt
cd X:\Incomas\Risk\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\Risk_cpr_results.txt
cd X:\Incomas\Salary\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\Salary_cpr_results.txt
cd X:\Incomas\SBD\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\SBD_cpr_results.txt
cd X:\Incomas\Trading\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\Trading_cpr_results.txt
cd X:\Incomas\US\
findstr /s /i "CPR" *.txt *.docx *.doc *.rtf *.pdf >> C:\users\file_admin\desktop\Exports\US_cpr_results.txt