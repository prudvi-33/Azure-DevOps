**Errors and Troubleshooting:**:

**🔒 Error 1: Error acquiring the state lock** <br />
❗ Error:
Error: Error acquiring the state lock
Error message: state blob is already locked
blob metadata "terraformlockid" was empty
🧠 Meaning:
Terraform tried to lock the state file but found it already locked — likely by another process or a previous command that didn't clean up properly.
In this case, the lock is stuck/corrupted and there's no lock ID available (so you can't run terraform force-unlock).
✅ Cause:
A previous terraform plan or apply command crashed or was interrupted.
Someone else is running Terraform on the same state file.
Lock metadata got corrupted (e.g., "terraformlockid" is empty).

🛠️ Solution:
Wait and retry — lock might release after some time.
Else, 
then u should remove it from manually, by giving command,
CMD: **az storage blob lease break  --account-name sadocaistudio01 --container-name tfstate --blob dev  --lease-break-period 0**

--This command breaks the lease immediately, forcing the lock to release.
--Safe to run only when you're sure no one else is running Terraform on the same state file.

**🔓 Error 2: Error releasing the state lock**
❗ Error:

Error: Error releasing the state lock
Error message: ... HTTP response was nil; connection may have been reset
 Lock Info:
│   ID:        cd24335b-1181-d45c-3332-48dff0945500
│   Path:      tfstate/dev
│   Operation: OperationTypeApply
│   Who:       PRUDVI\Prudvi@PRUDVI
│   Version:   1.11.4
│   Created:   2025-05-21 11:46:36.2262448 +0000 UTC
│   Info:
🧠 Meaning:
Terraform finished, but failed to release the state lock on Azure Blob due to a network issue or Azure service hiccup.
✅ Cause:
Temporary network failure or Azure Blob storage unresponsive.

Terraform couldn't send the "release lock" request.

🛠️ Solution:
Retry the command — often resolves on second attempt.

If lock persists, use:
CMD: **terraform force-unlock <lock-id>**
Get the lock ID from the error output.
