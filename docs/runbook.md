# IAM Automation Runbook

## 1. Prerequisites

* Windows environment
* PowerShell 5.x or later
* Repository cloned locally

---

## 2. Scripts and Usage

### 2.1 Joiner

**Purpose:** Provisions accounts for users with `status = Active`.

**Run:**

```powershell
cd scripts
.\joiner.ps1
```

**Expected Output:**

* Simulated account creation
* Group assignments based on role

---

### 2.2 Mover

**Purpose:** Detects staff members in IT and adjusts access accordingly.

**Run:**

```powershell
.\mover.ps1
```

**Expected Output:**

* Removal of non-IT staff access
* Assignment of IT-specific access groups

---

### 2.3 Leaver

**Purpose:** Deprovisions users with `status = Terminated`.

**Run:**

```powershell
.\leaver.ps1
```

**Expected Output:**

* Account disabled
* Group memberships removed
* User record archived

---

### 2.4 Access Review

**Purpose:** Generates a governance report identifying users with elevated or high-risk access.

**Run:**

```powershell
.\access_review.ps1
```

**Expected Output:**

* CSV report generated in `/data` directory (not committed)
* File contains flagged users with high-risk access

**Example CSV (`access_review_report.csv`):**

```csv
User,Role,Department,RiskLevel
Bob Martinez,Staff,IT,High
Marcus Reed,Staff,Security,High
```
