############################Description##########################################################
#Script para criação de Sites do Sharepoint através do Powerhell
#################################################################################################
Write-Host -ForegroundColor Green "Script para criacao de Sites do Sharepoint"
$tenant = Read-Host -Prompt 'Digite o nome do Tenant do Sharepoint Ex: redcononline'
Write-Host -ForegroundColor Yellow $tenant
$question = Read-Host "O Tenant esta correto? (S ou N)" 
if ($question -eq 's') {
   Connect-PnPOnline -Url "https://$tenant-admin.sharepoint.com/" -Credentials $cred
   $repete = Read-Host -Prompt 'Digite o numero de sites que sera criado no Sharepoint'
   while ($i -lt $repete){
      $Title = Read-Host -Prompt 'Digite o nome de exibicao do site no Sharepoint (Ex: Publico)'
      $url = Read-Host -Prompt 'Digite a URL do site (Ex: sharepoint.com/sites/publico)'
      $NewModernTeamSite = @{
         Title       = $Title
         Url         = "https://$tenant.sharepoint.com/sites/$url"
         Owner       = "redcon@$tenant.onmicrosoft.com" 
         lcid        = 1046
         Template    = "STS#3"    
         TimeZone    = 8
      }
      New-PnPTenantSite @NewModernTeamSite
      Write-Host "Ainda faltam" -ForegroundColor Yellow ($repete -1) "sites a serem criados"
      $i++
      
   }
   Write-Host -ForegroundColor Green "Listagem de Sites Criados no $tenant"
   Get-PnPTenantSite
}
else
   {
   Exit
   }



     