$cert = New-SelfSignedCertificate -DnsName www.yourwebsite.com -Type CodeSigning -CertStoreLocation Cert:\CurrentUser\My
$CertPassword = ConvertTo-SecureString -String "my_passowrd" -Force –AsPlainText
Export-PfxCertificate -Cert "cert:\CurrentUser\My\$($cert.Thumbprint)" -FilePath "selfsigncert.pfx" -Password $CertPassword
