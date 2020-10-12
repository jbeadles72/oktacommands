Connect-Okta "00DUBOLF7ebPyp57eAPXDK8kmRlibBNfwQzGx--fyj" https://dev-jakebeadles.okta.com
Get-OktaUser "me" 
$profile = @{login = "xfreak360@gmail.com"; email = "xfreak360@gmail.com"; firstName = "Jake"; lastName = "Beadles"}
$user = New-OktaUser @{profile = $profile}
$profile = @{name = "TestGroup"; description = "this is a test"}
$group = New-OktaGroup @{profile = $profile}

$user = Get-OktaUser "me"
$group = Get-OktaGroups "TestGroup" 'type eq "OKTA_GROUP"'
Add-OktaGroupMember "TestGroup".id $user.id
$params = @{filter = 'status eq "ACTIVE"'}
do {
    $page = Get-OktaUsers @params
    $users = $page.objects
    foreach ($user in $users) {
        # Add more properties here:
        Write-Host $user.profile.login $user.profile.email
    }
    $params = @{url = $page.nextUrl}
} while ($page.nextUrl)
