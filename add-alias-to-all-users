#This PowerShell Script adds a new domain to all users in your Active Directory.  This is handy if a new domain is purchased or a merger for instance. 
#More information can be found here: https://www.daveherrell.com/powershell-basics-add-email-alias-to-all-users

# Define the new domain
$newDomain = "awesomenewdomain.com"

# Import Active Directory module
Import-Module ActiveDirectory

# Get all users in the Active Directory
$users = Get-ADUser -Filter * -Property sAMAccountName, ProxyAddresses

foreach ($user in $users) {
    # Construct the new smtp alias
    $newAlias = "smtp:" + $user.sAMAccountName + "@" + $newDomain

    # Check if the user already has a ProxyAddresses property, if not, create an empty array
    if (-not $user.ProxyAddresses) {
        $user.ProxyAddresses = @()
    }

    # Add the new alias to the user's proxy addresses
    $updatedProxyAddresses = $user.ProxyAddresses + $newAlias

    # Update the user's proxy addresses in Active Directory
    Set-ADUser -Identity $user -Replace @{ProxyAddresses = $updatedProxyAddresses}
}

Write-Output "SMTP aliases for $newDomain have been added to all user accounts."

#This script does the following:
#Defines the new domain for the SMTP alias.
#Imports the Active Directory module.
#Retrieves all user accounts and their sAMAccountName and ProxyAddresses properties.
#Constructs the new SMTP alias for each user.
#Adds the new alias to the user's ProxyAddresses if it doesn't already exist.
#Updates the user's ProxyAddresses in Active Directory.
