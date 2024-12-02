# Active Directory Scripts

Welcome to my **Active Directory Scripts** repository! This collection of scripts is designed to help IT professionals automate and manage various tasks related to Active Directory (AD). From user management to group operations, these scripts aim to simplify and streamline common AD administration tasks.  For more information and how-to-guides please check out https://www.daveherrell.com/category/active-directory/

## Features

- **User Management**: Create, update, delete, and manage user accounts.
- **Group Management**: Add or remove users from groups and create new groups.
- **Password Management**: Reset passwords and enforce password policies.
- **Report Generation**: Generate reports for user accounts, group memberships, and more.
- **Automation**: Automate routine AD tasks for improved efficiency.

## Repository Structure

- **`/Scripts`**: Contains various PowerShell or Python scripts for Active Directory management.
- **`README.md`**: Documentation to help you understand and use the scripts.

## Getting Started

### Prerequisites

1. **Active Directory Environment**:
   - Access to an Active Directory domain controller.
   - Required permissions to execute administrative scripts.
2. **PowerShell Environment**:
   - PowerShell 5.1 or higher.
   - For Python scripts, Python 3.7 or higher installed.
3. **Required Modules**:
   - **PowerShell**: Install the `ActiveDirectory` module.
   - **Python**: Install `pyad` or `ldap3` as necessary.

### Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/it-dherrell/activedirectory.git
   cd activedirectory/Scripts
   ```

2. Configure your environment:
   - For PowerShell scripts, ensure your session is running with appropriate permissions.
   - For Python scripts, create a virtual environment and install dependencies:
     ```bash
     pip install -r requirements.txt
     ```

### Usage

1. Run the desired script:
   - **PowerShell**:
     ```powershell
     .\ScriptName.ps1
     ```
   - **Python**:
     ```bash
     python script_name.py
     ```

2. Follow prompts or review the script output for results.

## Scripts

- **add-alias-to-all-users.ps1**: Script to add an alias to all users in active directory.
- **copy-group-members-to-members.ps1**: Script to copy group members from one group to another group.
- **export-list-disabled-users.ps1**: Export list of AD users. 


## Contributing

Your contributions are welcome! If you have new scripts or improvements, please fork this repository and submit a pull request.


## Support

If you encounter any issues or have questions, please create an issue in this repository or contact me directly.

