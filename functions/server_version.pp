# Authoritatively determine the puppet server version and return `undef` if one
# could not be determined.
#
# @return [String]
#   The puppet server version
#
function pupmod::server_version {
  # Authoritatively determine the puppet server version
  if defined('$::serverversion') {
    $server_version = $::serverversion
  }
  elsif fact('server_facts.serverversion') {
    $server_version = fact('server_facts.serverversion')
  }
  elsif fact('simp_pupmod_serverversion') {
    $server_version = fact('simp_pupmod_serverversion')
  }
  else {
    $server_version = '0.0.0'
  }

  $server_version
}

