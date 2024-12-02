#This PowerShell script will export a list of all users that are currently disabled in your Active Directory enviroment. 
#For more information, please see: https://www.daveherrell.com/powershell-basics-create-list-of-disabled-users

# Import Active Directory module
Import-Module ActiveDirectory

# Function to get the account disable date from the user's lastLogoff attribute
function Get-AccountDisableDate {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DistinguishedName
    )
    $accountExpires = (Get-ADUser -Identity $DistinguishedName -Properties whenChanged).whenChanged
    return $accountExpires
}

# Get all disabled user accounts
$disabledUsers = Get-ADUser -Filter {Enabled -eq $false} -Property DisplayName, sAMAccountName, UserPrincipalName, whenChanged

# Create a custom object to hold the user details and disable date
$results = foreach ($user in $disabledUsers) {
    [PSCustomObject]@{
        DisplayName      = $user.DisplayName
        sAMAccountName   = $user.sAMAccountName
        UserPrincipalName = $user.UserPrincipalName
        DisabledDate     = $user.whenChanged
    }
}

# Display the list of disabled users with disable dates
$results | Format-Table -AutoSize

# Optionally, export the list to a CSV file
$results | Export-csv -path C:\Users\dave\Desktop\DisabledUsers.csv -NoTypeInformation

Write-Output "The list of disabled user accounts with disable dates has been retrieved and saved to DisabledUsersWithDate.csv."

#Here is what this script is doing for you.

#Imports the Active Directory module.
#Defines a function to get the account disable date (using the whenChanged property as a proxy for the disable date, since Active Directory does not store the exact disable date directly).
#Retrieves all disabled user accounts and their DisplayName, sAMAccountName, UserPrincipalName, and whenChanged properties.
#Creates a custom object to hold the user details and the approximate disable date.
#Displays the list of disabled users with disable dates in a table format.
#Optionally, exports the list to a CSV file named DisabledUsersWithDate.csv.
