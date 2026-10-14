$url = "https://script.googleusercontent.com/macros/echo?user_content_key=Yfxd6XVdPznbBWRkaOl_m1PUW9yuFLY_z5zwSTZXTYYUET2gWKXGfYDxgm8JqLw9-SmUmuRNXAyMeQlUm0P3t3uVNc-NmAK2m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnOS7UG6Xi1WhyjsMg5p96dDFQqB2KQWOGNVFzmCtYNe8liHAOhjgnXMqWHZX4wRtgH6lcNmbNxlPqIaTTdF2Ts_b56pwrBXVvQ&lib=Mn67bigTColvRgHHV4OVGc0OJmxN7WCAt"
# updateJson.ps1
$file = "src/local_data.json"

Write-Host "`n"
Write-Host "Starting the update process for: $file" -ForegroundColor Magenta -BackgroundColor Black
Write-Host "`n"
# Start animation
$spinner = @('|', '/', '-', '\')
$colors = @('Red', 'Green', 'Yellow', 'Magenta', 'White', 'Cyan')
$animationInterval = 100 # milliseconds

try {
    $spinnerIndex = 0
    $colorIndex = 0
    $animationTimer = [System.Diagnostics.Stopwatch]::StartNew()

    while ($animationTimer.ElapsedMilliseconds -lt 5000) { # Run animation for 5 seconds
        $color = $colors[$colorIndex]
        Write-Host -NoNewline "`r$($spinner[$spinnerIndex])" -ForegroundColor $color -BackgroundColor Black
        Start-Sleep -Milliseconds $animationInterval
        $spinnerIndex = ($spinnerIndex + 1) % $spinner.Length
        $colorIndex = ($colorIndex + 1) % $colors.Length
    }

    Invoke-WebRequest -Uri $url -OutFile $file
    Write-Host "`rThe $file has been successfully updated." -ForegroundColor Green -BackgroundColor Black
} catch {
    Write-Host "`rAn error occurred: $_" -ForegroundColor White -BackgroundColor Red
}
Write-Host "`n"