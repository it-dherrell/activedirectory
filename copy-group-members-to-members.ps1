#This is a simple script to copy uses from one Active Directory group membership to another one.  This is better then nesting groups, espcially if you use Azure AD aka Entra ID. 
#For more information check out: https://www.daveherrell.com/powershell-basics-copy-ad-group-members-to-another-group

# Define the groups
$sourceGroup = "Group1"
$destinationGroup = "Group2"

# Import Active Directory module
Import-Module ActiveDirectory

# Get the members of the source group
$sourceGroupMembers = Get-ADGroupMember -Identity $sourceGroup

# Add each member to the destination group
foreach ($member in $sourceGroupMembers) {
    Add-ADGroupMember -Identity $destinationGroup -Members $member
}

Write-Output "All users from $sourceGroup have been copied to $destinationGroup."
