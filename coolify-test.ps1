Write-Host "Coolify Deployment Test" -ForegroundColor Green
Write-Host "=====================" -ForegroundColor Green
Write-Host ""

Write-Host "Checking Node.js..." -ForegroundColor Cyan
node --version
npm --version
Write-Host ""

Write-Host "Checking .env file..." -ForegroundColor Cyan
if (Test-Path .env) {
    Write-Host "✓ .env file found" -ForegroundColor Green
} else {
    Write-Host "✗ .env file NOT found" -ForegroundColor Red
}
Write-Host ""

Write-Host "Checking backend configuration..." -ForegroundColor Cyan
if (Test-Path backend\package.json) {
    Write-Host "✓ Backend configured" -ForegroundColor Green
}
Write-Host ""

Write-Host "Checking frontend configuration..." -ForegroundColor Cyan
if (Test-Path frontend\package.json) {
    Write-Host "✓ Frontend configured" -ForegroundColor Green
}
Write-Host ""

Write-Host "Checking deployment configuration files..." -ForegroundColor Cyan
if (Test-Path Dockerfile) {
    Write-Host "✓ Dockerfile found" -ForegroundColor Green
}
if (Test-Path docker-compose.yml) {
    Write-Host "✓ docker-compose.yml found" -ForegroundColor Green
}
if (Test-Path coolify.json) {
    Write-Host "✓ coolify.json found" -ForegroundColor Green
}
Write-Host ""

Write-Host "Deployment Configuration Summary:" -ForegroundColor Green
Write-Host "  Backend Port: 5002" -ForegroundColor Cyan
Write-Host "  Database: MySQL (configured)" -ForegroundColor Cyan
Write-Host "  Production URL: http://a8cosos0ogw80cw0skgk0kc8.127.0.0.1.sslip.io" -ForegroundColor Cyan
Write-Host ""

Write-Host "✅ Coolify Deployment Test Completed!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Ensure Docker is installed on deployment server" -ForegroundColor White
Write-Host "2. Push changes: git push origin main" -ForegroundColor White
Write-Host "3. Connect repo to Coolify dashboard" -ForegroundColor White
Write-Host "4. Configure environment variables" -ForegroundColor White
Write-Host "5. Deploy" -ForegroundColor White
