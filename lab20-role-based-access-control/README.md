# SIEM Lab 20 – Role-Based Access Control (RBAC)

## Lab Objectives

* Understand the concepts of Role-Based Access Control (RBAC).
* Learn how to create and manage different user roles.
* Implement read-only access restrictions for specific roles.
* Test and validate role-based access permissions.
* Demonstrate secure permission management in Linux.

---

## Prerequisites

* Ubuntu Linux Server
* Administrative (sudo) privileges
* Basic Linux command-line knowledge
* Understanding of users, groups, and permissions

---

# Introduction

Role-Based Access Control (RBAC) is a security mechanism that restricts system access based on assigned roles. Instead of assigning permissions directly to individual users, permissions are assigned to roles, and users inherit permissions through role membership.

In this lab, two roles were created:

* Analyst Role (Limited Access)
* Admin Role (Full Access)

The permissions of each role were tested and validated.

---

# Task 1: Setup the Environment

## Step 1.1 – Update System

The operating system was updated to ensure all packages were current.

```bash
sudo apt update && sudo apt upgrade -y
```

---

## Step 1.2 – Install Required Packages

Required packages were installed.

```bash
sudo apt install sudo libpam0g-dev -y
```

Verify commands:

```bash
which useradd
which usermod
which sudo
```

### Result

Required user management tools were available on the system.

---

# Task 2: Create User Roles

## Step 2.1 – Create Analyst Role

A dedicated analyst group was created.

```bash
sudo groupadd analyst
```

Create analyst user:

```bash
sudo useradd -m -s /bin/bash -g analyst analyst_user
```

Set password:

```bash
sudo passwd analyst_user
```

Verify:

```bash
id analyst_user
```

### Result

The analyst role and user account were successfully created.

---

## Step 2.2 – Create Admin Role

Create admin group:

```bash
sudo groupadd admin
```

Create admin user:

```bash
sudo useradd -m -s /bin/bash -g admin admin_user
```

Set password:

```bash
sudo passwd admin_user
```

Verify:

```bash
id admin_user
```

### Result

The admin role and user account were successfully created.

---

# Task 3: Implement Access Controls

## Step 3.1 – Create Restricted Directory

A protected directory was created.

```bash
sudo mkdir /var/restricted
```

Assign ownership:

```bash
sudo chown root:analyst /var/restricted
```

Apply permissions:

```bash
sudo chmod 750 /var/restricted
```

Verify:

```bash
ls -ld /var/restricted
```

Expected output:

```text
drwxr-x--- root analyst
```

### Result

The restricted directory was configured for analyst access.

---

## Step 3.2 – Validate Analyst Permissions

Switch to analyst user:

```bash
su - analyst_user
```

Attempt file creation:

```bash
echo "Test" > /var/restricted/test_file.txt
```

Expected result:

```text
Permission denied
```

Exit:

```bash
exit
```

### Result

The analyst user was prevented from modifying the directory.

---

## Step 3.3 – Grant Admin Full Access

Change ownership:

```bash
sudo chown admin_user:admin /var/restricted
```

Apply permissions:

```bash
sudo chmod 770 /var/restricted
```

Verify:

```bash
ls -ld /var/restricted
```

Expected output:

```text
drwxrwx--- admin_user admin
```

### Result

The admin role received full access permissions.

---

# Task 4: Test Role Switching and Access

## Step 4.1 – Test Admin Access

Switch to admin user:

```bash
su - admin_user
```

Create file:

```bash
echo "Admin Test" > /var/restricted/admin_test.txt
```

Verify:

```bash
ls -l /var/restricted
```

Expected:

```text
admin_test.txt
```

Exit:

```bash
exit
```

### Result

The admin user successfully created files within the restricted directory.

---

## Step 4.2 – Test Analyst Read Access

Switch to analyst user:

```bash
su - analyst_user
```

Read file:

```bash
cat /var/restricted/admin_test.txt
```

Expected output:

```text
Admin Test
```

Attempt modification:

```bash
echo "New Data" >> /var/restricted/admin_test.txt
```

Expected result:

```text
Permission denied
```

### Result

The analyst user could read files but could not modify them.

---

# Verification Results

| Test                                 | Result  |
| ------------------------------------ | ------- |
| Analyst User Created                 | Success |
| Admin User Created                   | Success |
| Restricted Directory Created         | Success |
| Analyst Write Attempt Blocked        | Success |
| Admin Write Access Allowed           | Success |
| Analyst Read Access Allowed          | Success |
| Analyst Modification Attempt Blocked | Success |

---

# Commands Used

## System Update

```bash
sudo apt update && sudo apt upgrade -y
```

## Install Packages

```bash
sudo apt install sudo libpam0g-dev -y
```

## Create Analyst Role

```bash
sudo groupadd analyst

sudo useradd -m -s /bin/bash -g analyst analyst_user

sudo passwd analyst_user
```

## Create Admin Role

```bash
sudo groupadd admin

sudo useradd -m -s /bin/bash -g admin admin_user

sudo passwd admin_user
```

## Create Restricted Directory

```bash
sudo mkdir /var/restricted

sudo chown root:analyst /var/restricted

sudo chmod 750 /var/restricted
```

## Test Analyst Access

```bash
su - analyst_user

echo "Test" > /var/restricted/test_file.txt
```

## Grant Admin Access

```bash
sudo chown admin_user:admin /var/restricted

sudo chmod 770 /var/restricted
```

## Test Admin Access

```bash
su - admin_user

echo "Admin Test" > /var/restricted/admin_test.txt
```

## Test Analyst Read Access

```bash
su - analyst_user

cat /var/restricted/admin_test.txt

echo "New Data" >> /var/restricted/admin_test.txt
```

---

# Screenshots

### Screenshot 1

Creation of Analyst and Admin users and groups.

### Screenshot 2

Analyst user denied write access to the restricted directory.

### Screenshot 3

Admin user successfully creating files and Analyst user reading files.

---

# Key Concepts Learned

## Role-Based Access Control (RBAC)

A security model that assigns permissions based on organizational roles.

## Linux Groups

Used to manage permissions collectively for multiple users.

## File Permissions

Control read, write, and execute access to files and directories.

## Principle of Least Privilege

Users receive only the permissions required to perform their tasks.

## Access Validation

Testing permissions ensures that security controls are functioning correctly.

---

# Conclusion

In this lab, Role-Based Access Control (RBAC) was implemented using Linux users, groups, and file permissions. Separate Analyst and Admin roles were created, and a restricted directory was configured to enforce different access levels. Testing confirmed that Admin users had full access while Analyst users had read-only capabilities. This exercise demonstrated the importance of RBAC in maintaining secure and controlled access to system resources.
