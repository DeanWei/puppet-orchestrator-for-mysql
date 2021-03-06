#

class orchestrator::config inherits orchestrator {

# lint:ignore:140chars
  $config_defaults   = {
    'Debug'                                      => true,
    'EnableSyslog'                               => false,
    'ListenAddress'                              => ':3000',
    'AgentsServerPort'                           => ':3001',
    'MySQLTopologyCredentialsConfigFile'         => $orchestrator::top_path,
    'MySQLTopologySSLPrivateKeyFile'             => '',
    'MySQLTopologySSLCertFile'                   => '',
    'MySQLTopologySSLCAFile'                     => '',
    'MySQLTopologySSLSkipVerify'                 => true,
    'MySQLTopologyUseMutualTLS'                  => false,
    'MySQLTopologyMaxPoolConnections'            => 3,
    'DatabaselessMode__experimental'             => false,
    'MySQLOrchestratorHost'                      => $orchestrator::metadb_host,
    'MySQLOrchestratorPort'                      => 3306,
    'MySQLOrchestratorDatabase'                  => 'orchestrator',
    'MySQLOrchestratorCredentialsConfigFile'     => $orchestrator::srv_path,
    'MySQLOrchestratorSSLPrivateKeyFile'         => '',
    'MySQLOrchestratorSSLCertFile'               => '',
    'MySQLOrchestratorSSLCAFile'                 => '',
    'MySQLOrchestratorSSLSkipVerify'             => true,
    'MySQLOrchestratorUseMutualTLS'              => false,
    'MySQLConnectTimeoutSeconds'                 => 1,
    'DefaultInstancePort'                        => 3306,
    'SlaveLagQuery'                              => '',
    'SlaveStartPostWaitMilliseconds'             => 1000,
    'DiscoverByShowSlaveHosts'                   => true,
    'InstancePollSeconds'                        => 5,
    'ReadLongRunningQueries'                     => false,
    'BinlogFileHistoryDays'                      => 10,
    'UnseenInstanceForgetHours'                  => 240,
    'SnapshotTopologiesIntervalHours'            => 0,
    'InstanceBulkOperationsWaitTimeoutSeconds'   => 10,
    'ActiveNodeExpireSeconds'                    => 5,
    'HostnameResolveMethod'                      => 'default',
    'MySQLHostnameResolveMethod'                 => '@@hostname',
    'SkipBinlogServerUnresolveCheck'             => true,
    'ExpiryHostnameResolvesMinutes'              => 60,
    'RejectHostnameResolvePattern'               => '',
    'ReasonableReplicationLagSeconds'            => 10,
    'ProblemIgnoreHostnameFilters'               => [],
    'VerifyReplicationFilters'                   => false,
    'MaintenanceOwner'                           => 'orchestrator',
    'ReasonableMaintenanceReplicationLagSeconds' => 20,
    'MaintenanceExpireMinutes'                   => 10,
    'MaintenancePurgeDays'                       => 365,
    'CandidateInstanceExpireMinutes'             => 60,
    'AuditLogFile'                               => '/var/log/orchestrator-audit.log',
    'AuditToSyslog'                              => false,
    'AuditPageSize'                              => 20,
    'AuditPurgeDays'                             => 365,
    'RemoveTextFromHostnameDisplay'              => '.mycompany.com:3306',
    'ReadOnly'                                   => true,
    'AuthenticationMethod'                       => '',
    'HTTPAuthUser'                               => '',
    'HTTPAuthPassword'                           => '',
    'AuthUserHeader'                             => '',
    'PowerAuthUsers'                             => ['*'],
    'ClusterNameToAlias'                         => {
      '127.0.0.1' => 'test suite'
    },
    'AccessTokenUseExpirySeconds'                => 60,
    'AccessTokenExpiryMinutes'                   => 1440,
    'DetectClusterAliasQuery'                    => '',
    'DetectClusterDomainQuery'                   => '',
    'DataCenterPattern'                          => '',
    'PhysicalEnvironmentPattern'                 => '',
    'PromotionIgnoreHostnameFilters'             => [],
    'ServeAgentsHttp'                            => false,
    'AgentsUseSSL'                               => false,
    'AgentsUseMutualTLS'                         => false,
    'AgentSSLSkipVerify'                         => false,
    'AgentSSLPrivateKeyFile'                     => '',
    'AgentSSLCertFile'                           => '',
    'AgentSSLCAFile'                             => '',
    'AgentSSLValidOUs'                           => [],
    'UseSSL'                                     => false,
    'UseMutualTLS'                               => false,
    'SSLSkipVerify'                              => false,
    'SSLPrivateKeyFile'                          => '',
    'SSLCertFile'                                => '',
    'SSLCAFile'                                  => '',
    'SSLValidOUs'                                => [],
    'StatusEndpoint'                             => '/api/status',
    'StatusSimpleHealth'                         => true,
    'StatusOUVerify'                             => false,
    'HttpTimeoutSeconds'                         => 60,
    'AgentPollMinutes'                           => 60,
    'AgentAutoDiscover'                          => false,
    'UnseenAgentForgetHours'                     => 6,
    'StaleSeedFailMinutes'                       => 60,
    'SeedAcceptableBytesDiff'                    => 8192,
    'PseudoGTIDPattern'                          => '`heartbeat` [(]ts, server_id, file, position, relay_master_log_file, exec_master_log_pos[)] VALUES',
    'PseudoGTIDPatternIsFixedSubstring'          => false,
    'PseudoGTIDMonotonicHint'                    => 'heartbeat',
    'DetectPseudoGTIDQuery'                      => 'select count(*)>0 as pseudo_gtid_exists from github_meta.heartbeat where ts > NOW() - INTERVAL 2 DAY;',
    'BinlogEventsChunkSize'                      => 10000,
    'BufferBinlogEvents'                         => true,
    'SkipBinlogEventsContaining'                 => [],
    'ReduceReplicationAnalysisCount'             => false,
    'FailureDetectionPeriodBlockMinutes'         => 60,
    'RecoveryPollSeconds'                        => 5,
    'RecoveryPeriodBlockSeconds'                 => 600,
    'RecoveryIgnoreHostnameFilters'              => [],
    'RecoverMasterClusterFilters'                => [
      '_master_pattern_'
    ],
    'RecoverIntermediateMasterClusterFilters'    => [
      '_intermediate_master_pattern_'
    ],
    'OnFailureDetectionProcesses'                => [
      "echo 'Detected {failureType} on {failureCluster}. Affected replicas: {countSlaves}' >> /tmp/recovery.log"
    ],
    'PreFailoverProcesses'                       => [
      "echo 'Will recover from {failureType} on {failureCluster}' >> /tmp/recovery.log"
    ],
    'PostFailoverProcesses'                      => [
      "echo '(for all types) Recovered from {failureType} on {failureCluster}. Failed: {failedHost}:{failedPort}; Successor: {successorHost}:{successorPort}' >> /tmp/recovery.log"
    ],
    'PostUnsuccessfulFailoverProcesses'          => [],
    'PostMasterFailoverProcesses'                => [
      "echo 'Recovered from {failureType} on {failureCluster}. Failed: {failedHost}:{failedPort}; Promoted: {successorHost}:{successorPort}' >> /tmp/recovery.log"
    ],
    'PostIntermediateMasterFailoverProcesses'    => [
      "echo 'Recovered from {failureType} on {failureCluster}. Failed: {failedHost}:{failedPort}; Successor: {successorHost}:{successorPort}' >> /tmp/recovery.log"
    ],
    'CoMasterRecoveryMustPromoteOtherCoMaster'   => true,
    'DetachLostSlavesAfterMasterFailover'        => true,
    'ApplyMySQLPromotionAfterMasterFailover'     => false,
    'MasterFailoverLostInstancesDowntimeMinutes' => 60,
    'PostponeSlaveRecoveryOnLagMinutes'          => 10,
    'OSCIgnoreHostnameFilters'                   => [],
    'GraphitePollSeconds'                        => 60,
    'GraphiteAddr'                               => '',
    'GraphitePath'                               => '',
    'GraphiteConvertHostnameDotsToUnderscores'   => true,
  }
  # lint:endignore

  # Create a merged together set of options.  Rightmost hashes win over left. Requires stdlib
  $options = merge($config_defaults, $orchestrator::config_override)

  file { $orchestrator::config:
    path    => $config_path,
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => '0644',
    content => template($orchestrator::config_template),
  }
}
