Connect-Okta "00DUBOLF7ebPyp57eAPXDK8kmRlibBNfwQzGx--fyj" https://dev-jakebeadles.okta.com
Get-OktaUser "me"
$params = @{filter = 'status eq "STAGED"'}
do {
    $page = Get-OktaUsers @params
    $users = $page.objects
    foreach ($user in $users) {
        # Add more properties here:
        Write-Host $user.profile.login $user.profile.email
    }
    $params = @{url = $page.nextUrl}
} while ($page.nextUrl)
