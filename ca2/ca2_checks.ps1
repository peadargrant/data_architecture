#!/usr/bin/env pwsh
# File check script
Write-Host checks for data architecture ca2

$requiredfiles = @(
@('README.txt'),
@('dataset.txt'),
@('architecture.pdf'),
@('setup.sh','setup.sql','setup.py'),
@('analysis1.sh','analysis1.sql','analysis1.py'),
@('analysis2.sh','analysis2.sql','analysis2.py'),
@('reflection.txt')
)

$issues_found = 0
$question_number = 0
foreach ( $acceptable_files in $requiredfiles ) {
    $question_number = $question_number + 1
    Write-Host ""
    Write-Host checking requirement $question_number
    Write-Host acceptable files $acceptable_files
    $answered=$false
    foreach ( $file in $acceptable_files ) {
        if (Test-Path $file) {
            Write-Host $file found
            $answered=$true
            break
            }
        Else {
            Write-Host $file not found
        }
        }
    if ( $answered ) {
        Write-Host found answer for question $question_number
        }
        Else {
        Write-Host '>>>>> FILE NOT FOUND <<<<<'
        $issues_found = $issues_found + 1
        }
    }

if ( $issues -eq 0 ) {
    Write-Host no issues found, ready to submit
    }
Else {
    Write-Host issues found: $issues_found
    Write-Host fix missing files and re-run again to check
}
