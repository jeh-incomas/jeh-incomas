#Make sure that you are Schema Admin before changin schema master role
Move-ADDirectoryServerOperationMasterRole -Identity "VMWINDC20" PDCEmulator
Move-ADDirectoryServerOperationMasterRole -Identity "VMWINDC20" RIDMaster
Move-ADDirectoryServerOperationMasterRole -Identity "VMWINDC20" Infrastructuremaster
Move-ADDirectoryServerOperationMasterRole -Identity "VMWINDC20" DomainNamingmaster
Move-ADDirectoryServerOperationMasterRole -Identity "VMWINDC20" SchemaMaster
