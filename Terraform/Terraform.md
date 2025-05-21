**Errors and Troubleshooting:**:

**🔒 Error 1: Error acquiring the state lock** <br />
❗ Error: <br />
Error: Error acquiring the state lock <br />
Error message: state blob is already locked <br />
blob metadata "terraformlockid" was empty <br />
🧠 Meaning: <br />
Terraform tried to lock the state file but found it already locked — likely by another process or a previous command that didn't clean up properly. <br />
In this case, the lock is stuck/corrupted and there's no lock ID available (so you can't run terraform force-unlock). <br />
✅ Cause: <br />
A previous terraform plan or apply command crashed or was interrupted. <br />
Someone else is running Terraform on the same state file. <br />
Lock metadata got corrupted (e.g., "terraformlockid" is empty). <br />

🛠️ Solution: <br />
Wait and retry — lock might release after some time. <br />
Else, <br />
then u should remove it from manually, by giving command, <br />
CMD: **az storage blob lease break  --account-name sadocaistudio01 --container-name tfstate --blob dev  --lease-break-period 0** <br />

--This command breaks the lease immediately, forcing the lock to release. <br />
--Safe to run only when you're sure no one else is running Terraform on the same state file. <br />

**🔓 Error 2: Error releasing the state lock** <br />
❗ Error: <br />

Error: Error releasing the state lock <br />
Error message: ... HTTP response was nil; connection may have been reset <br />
 Lock Info: <br />
│   ID:        cd24335b-1181-d45c-3332-48dff0945500 <br />
│   Path:      tfstate/dev <br />
│   Operation: OperationTypeApply <br />
│   Who:       PRUDVI\Prudvi@PRUDVI <br />
│   Version:   1.11.4 <br />
│   Created:   2025-05-21 11:46:36.2262448 +0000 UTC <br />
│   Info: <br />
🧠 Meaning: <br />
Terraform finished, but failed to release the state lock on Azure Blob due to a network issue or Azure service hiccup. <br />
✅ Cause: <br />
Temporary network failure or Azure Blob storage unresponsive. <br />

Terraform couldn't send the "release lock" request. <br />

🛠️ Solution: <br />
Retry the command — often resolves on second attempt. <br />

If lock persists, use: <br />
CMD: **terraform force-unlock <lock-id>** <br />
Get the lock ID from the error output.
