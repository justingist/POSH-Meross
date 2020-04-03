Function Connect-MerossCloud ($credential) {


}

Function ConvertTo-MerossRequest ($data) {
  $Bytes = [System.Text.Encoding]::ASCII.GetBytes($data)
  $EncodedText =[Convert]::ToBase64String($Bytes)
  $nonce = '0123456789ABCDEF' # need to improve randomness of nonce!
  $encodeable = $secret+$timestamp_millis+$nonce+$EncodedText
  # need to check license for stringhash function
  $md5hash = Get-StringHash -String $encodeable



  $payload = [ordered]@{
      'params'= $EncodedText
      'sign'= $md5hash
      'timestamp'= $timestamp_millis
      'nonce'= $nonce
  }

  return $payload
}

Function Get-Devices ($session,$params) {

}

Function Get-Nonce {


}

