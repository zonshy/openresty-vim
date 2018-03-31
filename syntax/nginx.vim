" Vim syntax file
" Language: nginx.conf

if exists("b:current_syntax")
    finish
end

if has("patch-7.4.1142")
    " except control characters, ";", "{", and "}"
    " plus "(" for inline Lua code
    syn iskeyword 33-39,41-58,60-122,124,126-255
endif

syn match ngxVariableString '\$\(\w\+\|{\w\+}\)' contained
syn region ngxBlock start=+^+ end=+{+ skip=+\${+ contains=ngxComment,ngxDirectiveBlock,ngxVariableBlock,ngxString,orBlock oneline
syn region ngxString start=+\z(["']\)+ end=+\z1+ skip=+\\\\\|\\\z1+ contains=ngxVariableString
syn match ngxComment ' *#.*$'

syn keyword ngxBoolean on
syn keyword ngxBoolean off

syn keyword ngxDirectiveListen listen
    \ nextgroup=@ngxListenParams skipwhite skipempty
syn match ngxListenParam '\([^;{ \t\\]\|\\.\)\+'
    \ contained
    \ nextgroup=@ngxListenParams skipwhite skipempty
syn region ngxListenString start=+\z(["']\)+ end=+\z1+ skip=+\\\\\|\\\z1+
    \ contained
    \ nextgroup=@ngxListenParams skipwhite skipempty
syn match ngxListenComment '#.*$'
    \ contained
    \ nextgroup=@ngxListenParams skipwhite skipempty
syn keyword ngxListenOptions contained
    \ default_server ssl http2 spdy proxy_protocol
    \ setfib fastopen backlog rcvbuf sndbuf accept_filter deferred bind
    \ ipv6only reuseport so_keepalive keepidle
    \ nextgroup=@ngxListenParams skipwhite skipempty
syn cluster ngxListenParams
    \ contains=ngxListenParam,ngxListenString,ngxListenComment
    \ add=ngxListenOptions

syn keyword ngxDirectiveBlock http            contained
syn keyword ngxDirectiveBlock stream          contained
syn keyword ngxDirectiveBlock mail            contained
syn keyword ngxDirectiveBlock events          contained
syn keyword ngxDirectiveBlock server          contained
syn keyword ngxDirectiveBlock types           contained
syn keyword ngxDirectiveBlock location        contained
syn keyword ngxDirectiveBlock upstream        contained
syn keyword ngxDirectiveBlock charset_map     contained
syn keyword ngxDirectiveBlock limit_except    contained
syn keyword ngxDirectiveBlock if              contained
syn keyword ngxDirectiveBlock geo             contained
syn keyword ngxDirectiveBlock map             contained
syn keyword ngxDirectiveBlock split_clients   contained
syn keyword ngxDirectiveBlock match           contained

syn keyword ngxDirectiveImportant include
syn keyword ngxDirectiveImportant root
syn keyword ngxDirectiveImportant server_name
syn keyword ngxDirectiveImportant internal
syn keyword ngxDirectiveImportant proxy_pass
syn keyword ngxDirectiveImportant memcached_pass
syn keyword ngxDirectiveImportant fastcgi_pass
syn keyword ngxDirectiveImportant scgi_pass
syn keyword ngxDirectiveImportant uwsgi_pass
syn keyword ngxDirectiveImportant try_files

syn keyword ngxDirectiveControl break
syn keyword ngxDirectiveControl return
syn keyword ngxDirectiveControl rewrite
syn keyword ngxDirectiveControl set

syn keyword ngxDirectiveError error_page
syn keyword ngxDirectiveError post_action

syn keyword ngxDirectiveDeprecated proxy_downstream_buffer
syn keyword ngxDirectiveDeprecated proxy_upstream_buffer
syn keyword ngxDirectiveDeprecated spdy_chunk_size
syn keyword ngxDirectiveDeprecated spdy_headers_comp
syn keyword ngxDirectiveDeprecated spdy_keepalive_timeout
syn keyword ngxDirectiveDeprecated spdy_max_concurrent_streams
syn keyword ngxDirectiveDeprecated spdy_pool_size
syn keyword ngxDirectiveDeprecated spdy_recv_buffer_size
syn keyword ngxDirectiveDeprecated spdy_recv_timeout
syn keyword ngxDirectiveDeprecated spdy_streams_index_size
syn keyword ngxDirectiveDeprecated upstream_conf

syn keyword ngxDirective absolute_redirect
syn keyword ngxDirective accept_mutex
syn keyword ngxDirective accept_mutex_delay
syn keyword ngxDirective acceptex_read
syn keyword ngxDirective access_log
syn keyword ngxDirective add_after_body
syn keyword ngxDirective add_before_body
syn keyword ngxDirective add_header
syn keyword ngxDirective add_trailer
syn keyword ngxDirective addition_types
syn keyword ngxDirective aio
syn keyword ngxDirective aio_write
syn keyword ngxDirective alias
syn keyword ngxDirective allow
syn keyword ngxDirective ancient_browser
syn keyword ngxDirective ancient_browser_value
syn keyword ngxDirective auth_basic
syn keyword ngxDirective auth_basic_user_file
syn keyword ngxDirective auth_http
syn keyword ngxDirective auth_http_header
syn keyword ngxDirective auth_http_pass_client_cert
syn keyword ngxDirective auth_http_timeout
syn keyword ngxDirective auth_jwt
syn keyword ngxDirective auth_jwt_key_file
syn keyword ngxDirective auth_request
syn keyword ngxDirective auth_request_set
syn keyword ngxDirective autoindex
syn keyword ngxDirective autoindex_exact_size
syn keyword ngxDirective autoindex_format
syn keyword ngxDirective autoindex_localtime
syn keyword ngxDirective charset
syn keyword ngxDirective charset_types
syn keyword ngxDirective chunked_transfer_encoding
syn keyword ngxDirective client_body_buffer_size
syn keyword ngxDirective client_body_in_file_only
syn keyword ngxDirective client_body_in_single_buffer
syn keyword ngxDirective client_body_temp_path
syn keyword ngxDirective client_body_timeout
syn keyword ngxDirective client_header_buffer_size
syn keyword ngxDirective client_header_timeout
syn keyword ngxDirective client_max_body_size
syn keyword ngxDirective connection_pool_size
syn keyword ngxDirective create_full_put_path
syn keyword ngxDirective daemon
syn keyword ngxDirective dav_access
syn keyword ngxDirective dav_methods
syn keyword ngxDirective debug_connection
syn keyword ngxDirective debug_points
syn keyword ngxDirective default_type
syn keyword ngxDirective degradation
syn keyword ngxDirective degrade
syn keyword ngxDirective deny
syn keyword ngxDirective devpoll_changes
syn keyword ngxDirective devpoll_events
syn keyword ngxDirective directio
syn keyword ngxDirective directio_alignment
syn keyword ngxDirective disable_symlinks
syn keyword ngxDirective empty_gif
syn keyword ngxDirective env
syn keyword ngxDirective epoll_events
syn keyword ngxDirective error_log
syn keyword ngxDirective etag
syn keyword ngxDirective eventport_events
syn keyword ngxDirective expires
syn keyword ngxDirective f4f
syn keyword ngxDirective f4f_buffer_size
syn keyword ngxDirective fastcgi_bind
syn keyword ngxDirective fastcgi_buffer_size
syn keyword ngxDirective fastcgi_buffering
syn keyword ngxDirective fastcgi_buffers
syn keyword ngxDirective fastcgi_busy_buffers_size
syn keyword ngxDirective fastcgi_cache
syn keyword ngxDirective fastcgi_cache_background_update
syn keyword ngxDirective fastcgi_cache_bypass
syn keyword ngxDirective fastcgi_cache_key
syn keyword ngxDirective fastcgi_cache_lock
syn keyword ngxDirective fastcgi_cache_lock_age
syn keyword ngxDirective fastcgi_cache_lock_timeout
syn keyword ngxDirective fastcgi_cache_max_range_offset
syn keyword ngxDirective fastcgi_cache_methods
syn keyword ngxDirective fastcgi_cache_min_uses
syn keyword ngxDirective fastcgi_cache_path
syn keyword ngxDirective fastcgi_cache_purge
syn keyword ngxDirective fastcgi_cache_revalidate
syn keyword ngxDirective fastcgi_cache_use_stale
syn keyword ngxDirective fastcgi_cache_valid
syn keyword ngxDirective fastcgi_catch_stderr
syn keyword ngxDirective fastcgi_connect_timeout
syn keyword ngxDirective fastcgi_force_ranges
syn keyword ngxDirective fastcgi_hide_header
syn keyword ngxDirective fastcgi_ignore_client_abort
syn keyword ngxDirective fastcgi_ignore_headers
syn keyword ngxDirective fastcgi_index
syn keyword ngxDirective fastcgi_intercept_errors
syn keyword ngxDirective fastcgi_keep_conn
syn keyword ngxDirective fastcgi_limit_rate
syn keyword ngxDirective fastcgi_max_temp_file_size
syn keyword ngxDirective fastcgi_next_upstream
syn keyword ngxDirective fastcgi_next_upstream_timeout
syn keyword ngxDirective fastcgi_next_upstream_tries
syn keyword ngxDirective fastcgi_no_cache
syn keyword ngxDirective fastcgi_param
syn keyword ngxDirective fastcgi_pass_header
syn keyword ngxDirective fastcgi_pass_request_body
syn keyword ngxDirective fastcgi_pass_request_headers
syn keyword ngxDirective fastcgi_read_timeout
syn keyword ngxDirective fastcgi_request_buffering
syn keyword ngxDirective fastcgi_send_lowat
syn keyword ngxDirective fastcgi_send_timeout
syn keyword ngxDirective fastcgi_split_path_info
syn keyword ngxDirective fastcgi_store
syn keyword ngxDirective fastcgi_store_access
syn keyword ngxDirective fastcgi_temp_file_write_size
syn keyword ngxDirective fastcgi_temp_path
syn keyword ngxDirective flv
syn keyword ngxDirective geoip_city
syn keyword ngxDirective geoip_country
syn keyword ngxDirective geoip_org
syn keyword ngxDirective geoip_proxy
syn keyword ngxDirective geoip_proxy_recursive
syn keyword ngxDirective google_perftools_profiles
syn keyword ngxDirective grpc_bind
syn keyword ngxDirective grpc_buffer_size
syn keyword ngxDirective grpc_connect_timeout
syn keyword ngxDirective grpc_hide_header
syn keyword ngxDirective grpc_ignore_headers
syn keyword ngxDirective grpc_intercept_errors
syn keyword ngxDirective grpc_next_upstream
syn keyword ngxDirective grpc_next_upstream_timeout
syn keyword ngxDirective grpc_next_upstream_tries
syn keyword ngxDirective grpc_pass
syn keyword ngxDirective grpc_pass_header
syn keyword ngxDirective grpc_read_timeout
syn keyword ngxDirective grpc_send_timeout
syn keyword ngxDirective grpc_set_header
syn keyword ngxDirective grpc_ssl_certificate
syn keyword ngxDirective grpc_ssl_certificate_key
syn keyword ngxDirective grpc_ssl_ciphers
syn keyword ngxDirective grpc_ssl_crl
syn keyword ngxDirective grpc_ssl_name
syn keyword ngxDirective grpc_ssl_password_file
syn keyword ngxDirective grpc_ssl_protocols
syn keyword ngxDirective grpc_ssl_server_name
syn keyword ngxDirective grpc_ssl_session_reuse
syn keyword ngxDirective grpc_ssl_trusted_certificate
syn keyword ngxDirective grpc_ssl_verify
syn keyword ngxDirective grpc_ssl_verify_depth
syn keyword ngxDirective gunzip
syn keyword ngxDirective gunzip_buffers
syn keyword ngxDirective gzip
syn keyword ngxDirective gzip_buffers
syn keyword ngxDirective gzip_comp_level
syn keyword ngxDirective gzip_disable
syn keyword ngxDirective gzip_hash
syn keyword ngxDirective gzip_http_version
syn keyword ngxDirective gzip_min_length
syn keyword ngxDirective gzip_no_buffer
syn keyword ngxDirective gzip_proxied
syn keyword ngxDirective gzip_static
syn keyword ngxDirective gzip_types
syn keyword ngxDirective gzip_vary
syn keyword ngxDirective gzip_window
syn keyword ngxDirective hash
syn keyword ngxDirective health_check
syn keyword ngxDirective health_check_timeout
syn keyword ngxDirective hls
syn keyword ngxDirective hls_buffers
syn keyword ngxDirective hls_forward_args
syn keyword ngxDirective hls_fragment
syn keyword ngxDirective hls_mp4_buffer_size
syn keyword ngxDirective hls_mp4_max_buffer_size
syn keyword ngxDirective http2_body_preread_size
syn keyword ngxDirective http2_chunk_size
syn keyword ngxDirective http2_idle_timeout
syn keyword ngxDirective http2_max_concurrent_pushes
syn keyword ngxDirective http2_max_concurrent_streams
syn keyword ngxDirective http2_max_field_size
syn keyword ngxDirective http2_max_header_size
syn keyword ngxDirective http2_max_requests
syn keyword ngxDirective http2_pool_size
syn keyword ngxDirective http2_push
syn keyword ngxDirective http2_push_preload
syn keyword ngxDirective http2_recv_buffer_size
syn keyword ngxDirective http2_recv_timeout
syn keyword ngxDirective http2_streams_index_size
syn keyword ngxDirective if_modified_since
syn keyword ngxDirective ignore_invalid_headers
syn keyword ngxDirective image_filter
syn keyword ngxDirective image_filter_buffer
syn keyword ngxDirective image_filter_interlace
syn keyword ngxDirective image_filter_jpeg_quality
syn keyword ngxDirective image_filter_sharpen
syn keyword ngxDirective image_filter_transparency
syn keyword ngxDirective image_filter_webp_quality
syn keyword ngxDirective imap_auth
syn keyword ngxDirective imap_capabilities
syn keyword ngxDirective imap_client_buffer
syn keyword ngxDirective index
syn keyword ngxDirective iocp_threads
syn keyword ngxDirective ip_hash
syn keyword ngxDirective js_access
syn keyword ngxDirective js_content
syn keyword ngxDirective js_filter
syn keyword ngxDirective js_include
syn keyword ngxDirective js_preread
syn keyword ngxDirective js_set
syn keyword ngxDirective keepalive
syn keyword ngxDirective keepalive_disable
syn keyword ngxDirective keepalive_requests
syn keyword ngxDirective keepalive_timeout
syn keyword ngxDirective kqueue_changes
syn keyword ngxDirective kqueue_events
syn keyword ngxDirective large_client_header_buffers
syn keyword ngxDirective least_conn
syn keyword ngxDirective least_time
syn keyword ngxDirective limit_conn
syn keyword ngxDirective limit_conn_log_level
syn keyword ngxDirective limit_conn_status
syn keyword ngxDirective limit_conn_zone
syn keyword ngxDirective limit_rate
syn keyword ngxDirective limit_rate_after
syn keyword ngxDirective limit_req
syn keyword ngxDirective limit_req_log_level
syn keyword ngxDirective limit_req_status
syn keyword ngxDirective limit_req_zone
syn keyword ngxDirective lingering_close
syn keyword ngxDirective lingering_time
syn keyword ngxDirective lingering_timeout
syn keyword ngxDirective load_module
syn keyword ngxDirective lock_file
syn keyword ngxDirective log_format
syn keyword ngxDirective log_not_found
syn keyword ngxDirective log_subrequest
syn keyword ngxDirective map_hash_bucket_size
syn keyword ngxDirective map_hash_max_size
syn keyword ngxDirective master_process
syn keyword ngxDirective max_ranges
syn keyword ngxDirective memcached_bind
syn keyword ngxDirective memcached_buffer_size
syn keyword ngxDirective memcached_connect_timeout
syn keyword ngxDirective memcached_force_ranges
syn keyword ngxDirective memcached_gzip_flag
syn keyword ngxDirective memcached_next_upstream
syn keyword ngxDirective memcached_next_upstream_timeout
syn keyword ngxDirective memcached_next_upstream_tries
syn keyword ngxDirective memcached_read_timeout
syn keyword ngxDirective memcached_send_timeout
syn keyword ngxDirective merge_slashes
syn keyword ngxDirective min_delete_depth
syn keyword ngxDirective mirror
syn keyword ngxDirective mirror_request_body
syn keyword ngxDirective modern_browser
syn keyword ngxDirective modern_browser_value
syn keyword ngxDirective mp4
syn keyword ngxDirective mp4_buffer_size
syn keyword ngxDirective mp4_max_buffer_size
syn keyword ngxDirective mp4_limit_rate
syn keyword ngxDirective mp4_limit_rate_after
syn keyword ngxDirective msie_padding
syn keyword ngxDirective msie_refresh
syn keyword ngxDirective multi_accept
syn keyword ngxDirective ntlm
syn keyword ngxDirective open_file_cache
syn keyword ngxDirective open_file_cache_errors
syn keyword ngxDirective open_file_cache_events
syn keyword ngxDirective open_file_cache_min_uses
syn keyword ngxDirective open_file_cache_valid
syn keyword ngxDirective open_log_file_cache
syn keyword ngxDirective output_buffers
syn keyword ngxDirective override_charset
syn keyword ngxDirective pcre_jit
syn keyword ngxDirective perl
syn keyword ngxDirective perl_modules
syn keyword ngxDirective perl_require
syn keyword ngxDirective perl_set
syn keyword ngxDirective pid
syn keyword ngxDirective pop3_auth
syn keyword ngxDirective pop3_capabilities
syn keyword ngxDirective port_in_redirect
syn keyword ngxDirective post_acceptex
syn keyword ngxDirective postpone_gzipping
syn keyword ngxDirective postpone_output
syn keyword ngxDirective preread_buffer_size
syn keyword ngxDirective preread_timeout
syn keyword ngxDirective protocol
syn keyword ngxDirective proxy
syn keyword ngxDirective proxy_bind
syn keyword ngxDirective proxy_buffer
syn keyword ngxDirective proxy_buffer_size
syn keyword ngxDirective proxy_buffering
syn keyword ngxDirective proxy_buffers
syn keyword ngxDirective proxy_busy_buffers_size
syn keyword ngxDirective proxy_cache
syn keyword ngxDirective proxy_cache_background_update
syn keyword ngxDirective proxy_cache_bypass
syn keyword ngxDirective proxy_cache_convert_head
syn keyword ngxDirective proxy_cache_key
syn keyword ngxDirective proxy_cache_lock
syn keyword ngxDirective proxy_cache_lock_age
syn keyword ngxDirective proxy_cache_lock_timeout
syn keyword ngxDirective proxy_cache_max_range_offset
syn keyword ngxDirective proxy_cache_methods
syn keyword ngxDirective proxy_cache_min_uses
syn keyword ngxDirective proxy_cache_path
syn keyword ngxDirective proxy_cache_purge
syn keyword ngxDirective proxy_cache_revalidate
syn keyword ngxDirective proxy_cache_use_stale
syn keyword ngxDirective proxy_cache_valid
syn keyword ngxDirective proxy_connect_timeout
syn keyword ngxDirective proxy_cookie_domain
syn keyword ngxDirective proxy_cookie_path
syn keyword ngxDirective proxy_download_rate
syn keyword ngxDirective proxy_force_ranges
syn keyword ngxDirective proxy_headers_hash_bucket_size
syn keyword ngxDirective proxy_headers_hash_max_size
syn keyword ngxDirective proxy_hide_header
syn keyword ngxDirective proxy_http_version
syn keyword ngxDirective proxy_ignore_client_abort
syn keyword ngxDirective proxy_ignore_headers
syn keyword ngxDirective proxy_intercept_errors
syn keyword ngxDirective proxy_limit_rate
syn keyword ngxDirective proxy_max_temp_file_size
syn keyword ngxDirective proxy_method
syn keyword ngxDirective proxy_next_upstream
syn keyword ngxDirective proxy_next_upstream_timeout
syn keyword ngxDirective proxy_next_upstream_tries
syn keyword ngxDirective proxy_no_cache
syn keyword ngxDirective proxy_pass_error_message
syn keyword ngxDirective proxy_pass_header
syn keyword ngxDirective proxy_pass_request_body
syn keyword ngxDirective proxy_pass_request_headers
syn keyword ngxDirective proxy_protocol
syn keyword ngxDirective proxy_protocol_timeout
syn keyword ngxDirective proxy_read_timeout
syn keyword ngxDirective proxy_redirect
syn keyword ngxDirective proxy_request_buffering
syn keyword ngxDirective proxy_responses
syn keyword ngxDirective proxy_send_lowat
syn keyword ngxDirective proxy_send_timeout
syn keyword ngxDirective proxy_set_body
syn keyword ngxDirective proxy_set_header
syn keyword ngxDirective proxy_ssl
syn keyword ngxDirective proxy_ssl_certificate
syn keyword ngxDirective proxy_ssl_certificate_key
syn keyword ngxDirective proxy_ssl_ciphers
syn keyword ngxDirective proxy_ssl_crl
syn keyword ngxDirective proxy_ssl_name
syn keyword ngxDirective proxy_ssl_password_file
syn keyword ngxDirective proxy_ssl_protocols
syn keyword ngxDirective proxy_ssl_server_name
syn keyword ngxDirective proxy_ssl_session_reuse
syn keyword ngxDirective proxy_ssl_trusted_certificate
syn keyword ngxDirective proxy_ssl_verify
syn keyword ngxDirective proxy_ssl_verify_depth
syn keyword ngxDirective proxy_store
syn keyword ngxDirective proxy_store_access
syn keyword ngxDirective proxy_temp_file_write_size
syn keyword ngxDirective proxy_temp_path
syn keyword ngxDirective proxy_timeout
syn keyword ngxDirective proxy_upload_rate
syn keyword ngxDirective queue
syn keyword ngxDirective random_index
syn keyword ngxDirective read_ahead
syn keyword ngxDirective real_ip_header
syn keyword ngxDirective real_ip_recursive
syn keyword ngxDirective recursive_error_pages
syn keyword ngxDirective referer_hash_bucket_size
syn keyword ngxDirective referer_hash_max_size
syn keyword ngxDirective request_pool_size
syn keyword ngxDirective reset_timedout_connection
syn keyword ngxDirective resolver
syn keyword ngxDirective resolver_timeout
syn keyword ngxDirective rewrite_log
syn keyword ngxDirective satisfy
syn keyword ngxDirective scgi_bind
syn keyword ngxDirective scgi_buffer_size
syn keyword ngxDirective scgi_buffering
syn keyword ngxDirective scgi_buffers
syn keyword ngxDirective scgi_busy_buffers_size
syn keyword ngxDirective scgi_cache
syn keyword ngxDirective scgi_cache_background_update
syn keyword ngxDirective scgi_cache_bypass
syn keyword ngxDirective scgi_cache_key
syn keyword ngxDirective scgi_cache_lock
syn keyword ngxDirective scgi_cache_lock_age
syn keyword ngxDirective scgi_cache_lock_timeout
syn keyword ngxDirective scgi_cache_max_range_offset
syn keyword ngxDirective scgi_cache_methods
syn keyword ngxDirective scgi_cache_min_uses
syn keyword ngxDirective scgi_cache_path
syn keyword ngxDirective scgi_cache_purge
syn keyword ngxDirective scgi_cache_revalidate
syn keyword ngxDirective scgi_cache_use_stale
syn keyword ngxDirective scgi_cache_valid
syn keyword ngxDirective scgi_connect_timeout
syn keyword ngxDirective scgi_force_ranges
syn keyword ngxDirective scgi_hide_header
syn keyword ngxDirective scgi_ignore_client_abort
syn keyword ngxDirective scgi_ignore_headers
syn keyword ngxDirective scgi_intercept_errors
syn keyword ngxDirective scgi_limit_rate
syn keyword ngxDirective scgi_max_temp_file_size
syn keyword ngxDirective scgi_next_upstream
syn keyword ngxDirective scgi_next_upstream_timeout
syn keyword ngxDirective scgi_next_upstream_tries
syn keyword ngxDirective scgi_no_cache
syn keyword ngxDirective scgi_param
syn keyword ngxDirective scgi_pass_header
syn keyword ngxDirective scgi_pass_request_body
syn keyword ngxDirective scgi_pass_request_headers
syn keyword ngxDirective scgi_read_timeout
syn keyword ngxDirective scgi_request_buffering
syn keyword ngxDirective scgi_send_timeout
syn keyword ngxDirective scgi_store
syn keyword ngxDirective scgi_store_access
syn keyword ngxDirective scgi_temp_file_write_size
syn keyword ngxDirective scgi_temp_path
syn keyword ngxDirective secure_link
syn keyword ngxDirective secure_link_md5
syn keyword ngxDirective secure_link_secret
syn keyword ngxDirective send_lowat
syn keyword ngxDirective send_timeout
syn keyword ngxDirective sendfile
syn keyword ngxDirective sendfile_max_chunk
syn keyword ngxDirective server_name_in_redirect
syn keyword ngxDirective server_names_hash_bucket_size
syn keyword ngxDirective server_names_hash_max_size
syn keyword ngxDirective server_tokens
syn keyword ngxDirective session_log
syn keyword ngxDirective session_log_format
syn keyword ngxDirective session_log_zone
syn keyword ngxDirective set_real_ip_from
syn keyword ngxDirective slice
syn keyword ngxDirective smtp_auth
syn keyword ngxDirective smtp_capabilities
syn keyword ngxDirective smtp_client_buffer
syn keyword ngxDirective smtp_greeting_delay
syn keyword ngxDirective source_charset
syn keyword ngxDirective ssi
syn keyword ngxDirective ssi_ignore_recycled_buffers
syn keyword ngxDirective ssi_last_modified
syn keyword ngxDirective ssi_min_file_chunk
syn keyword ngxDirective ssi_silent_errors
syn keyword ngxDirective ssi_types
syn keyword ngxDirective ssi_value_length
syn keyword ngxDirective ssl
syn keyword ngxDirective ssl_buffer_size
syn keyword ngxDirective ssl_certificate
syn keyword ngxDirective ssl_certificate_key
syn keyword ngxDirective ssl_ciphers
syn keyword ngxDirective ssl_client_certificate
syn keyword ngxDirective ssl_crl
syn keyword ngxDirective ssl_dhparam
syn keyword ngxDirective ssl_ecdh_curve
syn keyword ngxDirective ssl_engine
syn keyword ngxDirective ssl_handshake_timeout
syn keyword ngxDirective ssl_password_file
syn keyword ngxDirective ssl_prefer_server_ciphers
syn keyword ngxDirective ssl_preread
syn keyword ngxDirective ssl_protocols
syn keyword ngxDirective ssl_session_cache
syn keyword ngxDirective ssl_session_ticket_key
syn keyword ngxDirective ssl_session_tickets
syn keyword ngxDirective ssl_session_timeout
syn keyword ngxDirective ssl_stapling
syn keyword ngxDirective ssl_stapling_file
syn keyword ngxDirective ssl_stapling_responder
syn keyword ngxDirective ssl_stapling_verify
syn keyword ngxDirective ssl_trusted_certificate
syn keyword ngxDirective ssl_verify_client
syn keyword ngxDirective ssl_verify_depth
syn keyword ngxDirective starttls
syn keyword ngxDirective state
syn keyword ngxDirective status
syn keyword ngxDirective status_format
syn keyword ngxDirective status_zone
syn keyword ngxDirective sticky
syn keyword ngxDirective sticky_cookie_insert
syn keyword ngxDirective stub_status
syn keyword ngxDirective sub_filter
syn keyword ngxDirective sub_filter_last_modified
syn keyword ngxDirective sub_filter_once
syn keyword ngxDirective sub_filter_types
syn keyword ngxDirective subrequest_output_buffer_size
syn keyword ngxDirective tcp_nodelay
syn keyword ngxDirective tcp_nopush
syn keyword ngxDirective thread_pool
syn keyword ngxDirective timeout
syn keyword ngxDirective timer_resolution
syn keyword ngxDirective types_hash_bucket_size
syn keyword ngxDirective types_hash_max_size
syn keyword ngxDirective underscores_in_headers
syn keyword ngxDirective uninitialized_variable_warn
syn keyword ngxDirective use
syn keyword ngxDirective user
syn keyword ngxDirective userid
syn keyword ngxDirective userid_domain
syn keyword ngxDirective userid_expires
syn keyword ngxDirective userid_mark
syn keyword ngxDirective userid_name
syn keyword ngxDirective userid_p3p
syn keyword ngxDirective userid_path
syn keyword ngxDirective userid_service
syn keyword ngxDirective uwsgi_bind
syn keyword ngxDirective uwsgi_buffer_size
syn keyword ngxDirective uwsgi_buffering
syn keyword ngxDirective uwsgi_buffers
syn keyword ngxDirective uwsgi_busy_buffers_size
syn keyword ngxDirective uwsgi_cache
syn keyword ngxDirective uwsgi_cache_background_update
syn keyword ngxDirective uwsgi_cache_bypass
syn keyword ngxDirective uwsgi_cache_key
syn keyword ngxDirective uwsgi_cache_lock
syn keyword ngxDirective uwsgi_cache_lock_age
syn keyword ngxDirective uwsgi_cache_lock_timeout
syn keyword ngxDirective uwsgi_cache_max_range_offset
syn keyword ngxDirective uwsgi_cache_methods
syn keyword ngxDirective uwsgi_cache_min_uses
syn keyword ngxDirective uwsgi_cache_path
syn keyword ngxDirective uwsgi_cache_purge
syn keyword ngxDirective uwsgi_cache_revalidate
syn keyword ngxDirective uwsgi_cache_use_stale
syn keyword ngxDirective uwsgi_cache_valid
syn keyword ngxDirective uwsgi_connect_timeout
syn keyword ngxDirective uwsgi_force_ranges
syn keyword ngxDirective uwsgi_hide_header
syn keyword ngxDirective uwsgi_ignore_client_abort
syn keyword ngxDirective uwsgi_ignore_headers
syn keyword ngxDirective uwsgi_intercept_errors
syn keyword ngxDirective uwsgi_limit_rate
syn keyword ngxDirective uwsgi_max_temp_file_size
syn keyword ngxDirective uwsgi_modifier1
syn keyword ngxDirective uwsgi_modifier2
syn keyword ngxDirective uwsgi_next_upstream
syn keyword ngxDirective uwsgi_next_upstream_timeout
syn keyword ngxDirective uwsgi_next_upstream_tries
syn keyword ngxDirective uwsgi_no_cache
syn keyword ngxDirective uwsgi_param
syn keyword ngxDirective uwsgi_pass_header
syn keyword ngxDirective uwsgi_pass_request_body
syn keyword ngxDirective uwsgi_pass_request_headers
syn keyword ngxDirective uwsgi_read_timeout
syn keyword ngxDirective uwsgi_request_buffering
syn keyword ngxDirective uwsgi_send_timeout
syn keyword ngxDirective uwsgi_ssl_certificate
syn keyword ngxDirective uwsgi_ssl_certificate_key
syn keyword ngxDirective uwsgi_ssl_ciphers
syn keyword ngxDirective uwsgi_ssl_crl
syn keyword ngxDirective uwsgi_ssl_name
syn keyword ngxDirective uwsgi_ssl_password_file
syn keyword ngxDirective uwsgi_ssl_protocols
syn keyword ngxDirective uwsgi_ssl_server_name
syn keyword ngxDirective uwsgi_ssl_session_reuse
syn keyword ngxDirective uwsgi_ssl_trusted_certificate
syn keyword ngxDirective uwsgi_ssl_verify
syn keyword ngxDirective uwsgi_ssl_verify_depth
syn keyword ngxDirective uwsgi_store
syn keyword ngxDirective uwsgi_store_access
syn keyword ngxDirective uwsgi_string
syn keyword ngxDirective uwsgi_temp_file_write_size
syn keyword ngxDirective uwsgi_temp_path
syn keyword ngxDirective valid_referers
syn keyword ngxDirective variables_hash_bucket_size
syn keyword ngxDirective variables_hash_max_size
syn keyword ngxDirective worker_aio_requests
syn keyword ngxDirective worker_connections
syn keyword ngxDirective worker_cpu_affinity
syn keyword ngxDirective worker_priority
syn keyword ngxDirective worker_processes
syn keyword ngxDirective worker_rlimit_core
syn keyword ngxDirective worker_rlimit_nofile
syn keyword ngxDirective worker_shutdown_timeout
syn keyword ngxDirective working_directory
syn keyword ngxDirective xclient
syn keyword ngxDirective xml_entities
syn keyword ngxDirective xslt_last_modified
syn keyword ngxDirective xslt_param
syn keyword ngxDirective xslt_string_param
syn keyword ngxDirective xslt_stylesheet
syn keyword ngxDirective xslt_types
syn keyword ngxDirective zone


" Tarantool nginx upstream module
" https://github.com/tarantool/nginx_upstream_module
syn keyword ngxDirectiveThirdParty contained tnt_allowed_indexes
syn keyword ngxDirectiveThirdParty contained tnt_allowed_spaces
syn keyword ngxDirectiveThirdParty contained tnt_buffer_size
syn keyword ngxDirectiveThirdParty contained tnt_connect_timeout
syn keyword ngxDirectiveThirdParty contained tnt_delete
syn keyword ngxDirectiveThirdParty contained tnt_http_methods
syn keyword ngxDirectiveThirdParty contained tnt_http_rest_methods
syn keyword ngxDirectiveThirdParty contained tnt_in_multiplier
syn keyword ngxDirectiveThirdParty contained tnt_insert
syn keyword ngxDirectiveThirdParty contained tnt_method
syn keyword ngxDirectiveThirdParty contained tnt_multireturn_skip_count
syn keyword ngxDirectiveThirdParty contained tnt_next_upstream
syn keyword ngxDirectiveThirdParty contained tnt_next_upstream_timeout
syn keyword ngxDirectiveThirdParty contained tnt_next_upstream_tries
syn keyword ngxDirectiveThirdParty contained tnt_out_multiplier
syn keyword ngxDirectiveThirdParty contained tnt_pass
syn keyword ngxDirectiveThirdParty contained tnt_pass_http_request
syn keyword ngxDirectiveThirdParty contained tnt_pass_http_request_buffer_size
syn keyword ngxDirectiveThirdParty contained tnt_pure_result
syn keyword ngxDirectiveThirdParty contained tnt_read_timeout
syn keyword ngxDirectiveThirdParty contained tnt_replace
syn keyword ngxDirectiveThirdParty contained tnt_select
syn keyword ngxDirectiveThirdParty contained tnt_select_limit_max
syn keyword ngxDirectiveThirdParty contained tnt_send_timeout
syn keyword ngxDirectiveThirdParty contained tnt_set_header
syn keyword ngxDirectiveThirdParty contained tnt_update
syn keyword ngxDirectiveThirdParty contained tnt_upsert

" Nginx virtual host traffic status module
" https://github.com/vozlt/nginx-module-vts
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_average_method
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_bypass_limit
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_bypass_stats
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_display
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_display_format
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_display_jsonp
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_display_sum_key
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_dump
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_filter
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_filter_by_host
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_filter_by_set_key
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_filter_check_duplicate
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_limit
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_limit_check_duplicate
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_limit_traffic
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_limit_traffic_by_set_key
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_set_by_filter
syn keyword ngxDirectiveThirdParty contained vhost_traffic_status_zone

" redis module
" https://www.nginx.com/resources/wiki/modules/redis/
syn keyword ngxDirectiveThirdParty contained redis_bind
syn keyword ngxDirectiveThirdParty contained redis_buffer_size
syn keyword ngxDirectiveThirdParty contained redis_connect_timeout
syn keyword ngxDirectiveThirdParty contained redis_gzip_flag
syn keyword ngxDirectiveThirdParty contained redis_next_upstream
syn keyword ngxDirectiveThirdParty contained redis_pass
syn keyword ngxDirectiveThirdParty contained redis_read_timeout
syn keyword ngxDirectiveThirdParty contained redis_send_timeout

" Nginx OCSP processing module designed for response caching
" https://github.com/kyprizel/nginx_ocsp_proxy-module
syn keyword ngxDirectiveThirdParty contained ocsp_cache_timeout
syn keyword ngxDirectiveThirdParty contained ocsp_proxy

" circle_gif module
" https://github.com/evanmiller/nginx_circle_gif
syn keyword ngxDirectiveThirdParty contained circle_gif
syn keyword ngxDirectiveThirdParty contained circle_gif_max_radius
syn keyword ngxDirectiveThirdParty contained circle_gif_min_radius
syn keyword ngxDirectiveThirdParty contained circle_gif_step_radius

" Certificate Transparency
" https://github.com/grahamedgecombe/nginx-ct
syn keyword ngxDirectiveThirdParty contained ssl_ct
syn keyword ngxDirectiveThirdParty contained ssl_ct_static_scts

" content filter for nginx, which returns the md5 hash of the content otherwise returned
" https://github.com/kainswor/nginx_md5_filter
syn keyword ngxDirectiveThirdParty contained md5_filter

" ngx_dynamic_upstream
" https://github.com/cubicdaiya/ngx_dynamic_upstream
syn keyword ngxDirectiveThirdParty contained dynamic_upstream

" conditional accesslog for nginx
" https://github.com/cfsego/ngx_log_if
syn keyword ngxDirectiveThirdParty contained access_log_bypass_if

" Nginx Selective Cache Purge Module
" https://github.com/wandenberg/nginx-selective-cache-purge-module
syn keyword ngxDirectiveThirdParty contained selective_cache_purge_query
syn keyword ngxDirectiveThirdParty contained selective_cache_purge_redis_database
syn keyword ngxDirectiveThirdParty contained selective_cache_purge_redis_host
syn keyword ngxDirectiveThirdParty contained selective_cache_purge_redis_password
syn keyword ngxDirectiveThirdParty contained selective_cache_purge_redis_port
syn keyword ngxDirectiveThirdParty contained selective_cache_purge_redis_unix_socket

" SPNEGO Authentication
" https://github.com/stnoonan/spnego-http-auth-nginx-module
syn keyword ngxDirectiveThirdParty contained auth_gss
syn keyword ngxDirectiveThirdParty contained auth_gss_allow_basic_fallback
syn keyword ngxDirectiveThirdParty contained auth_gss_authorized_principal
syn keyword ngxDirectiveThirdParty contained auth_gss_force_realm
syn keyword ngxDirectiveThirdParty contained auth_gss_format_full
syn keyword ngxDirectiveThirdParty contained auth_gss_keytab
syn keyword ngxDirectiveThirdParty contained auth_gss_realm
syn keyword ngxDirectiveThirdParty contained auth_gss_service_name

" ngx_headers_more
" https://github.com/openresty/headers-more-nginx-module

" Automatic PageSpeed optimization module for Nginx
" https://github.com/pagespeed/ngx_pagespeed
syn keyword ngxDirectiveThirdParty contained pagespeed

" limit the number of connections to upstream
" https://github.com/cfsego/nginx-limit-upstream
syn keyword ngxDirectiveThirdParty contained limit_upstream_conn
syn keyword ngxDirectiveThirdParty contained limit_upstream_log_level
syn keyword ngxDirectiveThirdParty contained limit_upstream_zone

" ngx_echo
" https://github.com/openresty/echo-nginx-module

" Non-blocking upstream module for Nginx to connect to MongoDB
" https://github.com/simpl/ngx_mongo
syn keyword ngxDirectiveThirdParty contained mongo_auth
syn keyword ngxDirectiveThirdParty contained mongo_bind
syn keyword ngxDirectiveThirdParty contained mongo_buffer_size
syn keyword ngxDirectiveThirdParty contained mongo_buffering
syn keyword ngxDirectiveThirdParty contained mongo_buffers
syn keyword ngxDirectiveThirdParty contained mongo_busy_buffers_size
syn keyword ngxDirectiveThirdParty contained mongo_connect_timeout
syn keyword ngxDirectiveThirdParty contained mongo_json
syn keyword ngxDirectiveThirdParty contained mongo_next_upstream
syn keyword ngxDirectiveThirdParty contained mongo_pass
syn keyword ngxDirectiveThirdParty contained mongo_query
syn keyword ngxDirectiveThirdParty contained mongo_read_timeout
syn keyword ngxDirectiveThirdParty contained mongo_send_timeout

" concatenating files in a given context: CSS and JS files usually
" https://github.com/alibaba/nginx-http-concat
syn keyword ngxDirectiveThirdParty contained concat
syn keyword ngxDirectiveThirdParty contained concat_delimiter
syn keyword ngxDirectiveThirdParty contained concat_ignore_file_error
syn keyword ngxDirectiveThirdParty contained concat_max_files
syn keyword ngxDirectiveThirdParty contained concat_types
syn keyword ngxDirectiveThirdParty contained concat_unique

" Link RRDtool's graphing facilities directly into nginx
" https://github.com/evanmiller/mod_rrd_graph
syn keyword ngxDirectiveThirdParty contained rrd_graph
syn keyword ngxDirectiveThirdParty contained rrd_graph_root

" summarizer-nginx-module
" https://github.com/reeteshranjan/summarizer-nginx-module
syn keyword ngxDirectiveThirdParty contained summarizer_bind
syn keyword ngxDirectiveThirdParty contained summarizer_buffer_size
syn keyword ngxDirectiveThirdParty contained summarizer_connect_timeout
syn keyword ngxDirectiveThirdParty contained summarizer_next_upstream
syn keyword ngxDirectiveThirdParty contained summarizer_pass
syn keyword ngxDirectiveThirdParty contained summarizer_read_timeout
syn keyword ngxDirectiveThirdParty contained summarizer_send_timeout

" ngx_http_accounting_module
" https://github.com/Lax/ngx_http_accounting_module
syn keyword ngxDirectiveThirdParty contained http_accounting
syn keyword ngxDirectiveThirdParty contained http_accounting_id
syn keyword ngxDirectiveThirdParty contained http_accounting_interval
syn keyword ngxDirectiveThirdParty contained http_accounting_log
syn keyword ngxDirectiveThirdParty contained http_accounting_perturb

" NGINX HTTP Internal Redirect Module
" https://github.com/flygoast/ngx_http_internal_redirect
syn keyword ngxDirectiveThirdParty contained internal_redirect_if
syn keyword ngxDirectiveThirdParty contained internal_redirect_if_no_postpone

" Whitespace stripper for nginx
" https://github.com/evanmiller/mod_strip
syn keyword ngxDirectiveThirdParty contained strip

" ngx_rds_json - an output filter that formats Resty DBD Streams generated by ngx_drizzle and others to JSON
" https://github.com/openresty/rds-json-nginx-module

" cconv nginx module
" https://github.com/liseen/set-cconv-nginx-module
syn keyword ngxDirectiveThirdParty contained set_cconv_to_simp
syn keyword ngxDirectiveThirdParty contained set_cconv_to_trad
syn keyword ngxDirectiveThirdParty contained set_pinyin_to_normal

" nginx-sflow-module
" https://github.com/sflow/nginx-sflow-module
syn keyword ngxDirectiveThirdParty contained sflow

" form-input-nginx-module
" https://github.com/calio/form-input-nginx-module
syn keyword ngxDirectiveThirdParty contained set_form_input
syn keyword ngxDirectiveThirdParty contained set_form_input_multi

" Digest Authentication
" https://github.com/atomx/nginx-http-auth-digest
syn keyword ngxDirectiveThirdParty contained auth_digest
syn keyword ngxDirectiveThirdParty contained auth_digest_drop_time
syn keyword ngxDirectiveThirdParty contained auth_digest_evasion_time
syn keyword ngxDirectiveThirdParty contained auth_digest_expires
syn keyword ngxDirectiveThirdParty contained auth_digest_maxtries
syn keyword ngxDirectiveThirdParty contained auth_digest_replays
syn keyword ngxDirectiveThirdParty contained auth_digest_shm_size
syn keyword ngxDirectiveThirdParty contained auth_digest_timeout
syn keyword ngxDirectiveThirdParty contained auth_digest_user_file

" A nginx module to match browsers and crawlers
" https://github.com/alibaba/nginx-http-user-agent
syn keyword ngxDirectiveThirdParty contained user_agent

" serve content directly from MongoDB's GridFS
" https://github.com/mdirolf/nginx-gridfs
syn keyword ngxDirectiveThirdParty contained gridfs
syn keyword ngxDirectiveThirdParty contained mongo

" nginx module providing API to communicate with supervisord and manage (start/stop) backends on-demand
" https://github.com/FRiCKLE/ngx_supervisord
syn keyword ngxDirectiveThirdParty contained supervisord
syn keyword ngxDirectiveThirdParty contained supervisord_inherit_backend_status
syn keyword ngxDirectiveThirdParty contained supervisord_name
syn keyword ngxDirectiveThirdParty contained supervisord_start
syn keyword ngxDirectiveThirdParty contained supervisord_stop

" IP2Location Nginx
" https://github.com/chrislim2888/ip2location-nginx
syn keyword ngxDirectiveThirdParty contained ip2location_database

" nginx_lua_module
" https://github.com/alacner/nginx_lua_module
syn keyword ngxDirectiveThirdParty contained lua_file

" FastDFS
" https://github.com/happyfish100/fastdfs-nginx-module
syn keyword ngxDirectiveThirdParty contained ngx_fastdfs_module

" PECL Memcache standard hashing compatible loadbalancer for Nginx
" https://github.com/replay/ngx_http_php_memcache_standard_balancer
syn keyword ngxDirectiveThirdParty contained hash_key

" ngx_http_response
" http://catap.ru/downloads/nginx/
syn keyword ngxDirectiveThirdParty contained response
syn keyword ngxDirectiveThirdParty contained response_type

" The fair load balancer module for nginx
" https://github.com/cryptofuture/nginx-upstream-fair
syn keyword ngxDirectiveThirdParty contained fair
syn keyword ngxDirectiveThirdParty contained upstream_fair_shm_size

" nchan
" https://github.com/slact/nchan
syn keyword ngxDirectiveThirdParty contained nchan_access_control_allow_origin
syn keyword ngxDirectiveThirdParty contained nchan_authorize_request
syn keyword ngxDirectiveThirdParty contained nchan_channel_event_string
syn keyword ngxDirectiveThirdParty contained nchan_channel_events_channel_id
syn keyword ngxDirectiveThirdParty contained nchan_channel_group
syn keyword ngxDirectiveThirdParty contained nchan_channel_group_accounting
syn keyword ngxDirectiveThirdParty contained nchan_channel_id
syn keyword ngxDirectiveThirdParty contained nchan_channel_id_split_delimiter
syn keyword ngxDirectiveThirdParty contained nchan_channel_timeout
syn keyword ngxDirectiveThirdParty contained nchan_deflate_message_for_websocket
syn keyword ngxDirectiveThirdParty contained nchan_eventsource_event
syn keyword ngxDirectiveThirdParty contained nchan_group_location
syn keyword ngxDirectiveThirdParty contained nchan_group_max_channels
syn keyword ngxDirectiveThirdParty contained nchan_group_max_messages
syn keyword ngxDirectiveThirdParty contained nchan_group_max_messages_disk
syn keyword ngxDirectiveThirdParty contained nchan_group_max_messages_memory
syn keyword ngxDirectiveThirdParty contained nchan_group_max_subscribers
syn keyword ngxDirectiveThirdParty contained nchan_longpoll_multipart_response
syn keyword ngxDirectiveThirdParty contained nchan_max_channel_id_length
syn keyword ngxDirectiveThirdParty contained nchan_max_channel_subscribers
syn keyword ngxDirectiveThirdParty contained nchan_max_reserved_memory
syn keyword ngxDirectiveThirdParty contained nchan_message_buffer_length
syn keyword ngxDirectiveThirdParty contained nchan_message_max_buffer_length
syn keyword ngxDirectiveThirdParty contained nchan_message_temp_path
syn keyword ngxDirectiveThirdParty contained nchan_message_timeout
syn keyword ngxDirectiveThirdParty contained nchan_permessage_deflate_compression_level
syn keyword ngxDirectiveThirdParty contained nchan_permessage_deflate_compression_memlevel
syn keyword ngxDirectiveThirdParty contained nchan_permessage_deflate_compression_strategy
syn keyword ngxDirectiveThirdParty contained nchan_permessage_deflate_compression_window
syn keyword ngxDirectiveThirdParty contained nchan_pub_channel_id
syn keyword ngxDirectiveThirdParty contained nchan_publisher
syn keyword ngxDirectiveThirdParty contained nchan_publisher_channel_id
syn keyword ngxDirectiveThirdParty contained nchan_publisher_location
syn keyword ngxDirectiveThirdParty contained nchan_publisher_upstream_request
syn keyword ngxDirectiveThirdParty contained nchan_pubsub
syn keyword ngxDirectiveThirdParty contained nchan_pubsub_channel_id
syn keyword ngxDirectiveThirdParty contained nchan_pubsub_location
syn keyword ngxDirectiveThirdParty contained nchan_redis_fakesub_timer_interval
syn keyword ngxDirectiveThirdParty contained nchan_redis_idle_channel_cache_timeout
syn keyword ngxDirectiveThirdParty contained nchan_redis_namespace
syn keyword ngxDirectiveThirdParty contained nchan_redis_pass
syn keyword ngxDirectiveThirdParty contained nchan_redis_pass_inheritable
syn keyword ngxDirectiveThirdParty contained nchan_redis_ping_interval
syn keyword ngxDirectiveThirdParty contained nchan_redis_publish_msgpacked_max_size
syn keyword ngxDirectiveThirdParty contained nchan_redis_server
syn keyword ngxDirectiveThirdParty contained nchan_redis_storage_mode
syn keyword ngxDirectiveThirdParty contained nchan_redis_url
syn keyword ngxDirectiveThirdParty contained nchan_redis_wait_after_connecting
syn keyword ngxDirectiveThirdParty contained nchan_shared_memory_size
syn keyword ngxDirectiveThirdParty contained nchan_storage_engine
syn keyword ngxDirectiveThirdParty contained nchan_store_messages
syn keyword ngxDirectiveThirdParty contained nchan_stub_status
syn keyword ngxDirectiveThirdParty contained nchan_sub_channel_id
syn keyword ngxDirectiveThirdParty contained nchan_subscribe_existing_channels_only
syn keyword ngxDirectiveThirdParty contained nchan_subscribe_request
syn keyword ngxDirectiveThirdParty contained nchan_subscriber
syn keyword ngxDirectiveThirdParty contained nchan_subscriber_channel_id
syn keyword ngxDirectiveThirdParty contained nchan_subscriber_compound_etag_message_id
syn keyword ngxDirectiveThirdParty contained nchan_subscriber_first_message
syn keyword ngxDirectiveThirdParty contained nchan_subscriber_http_raw_stream_separator
syn keyword ngxDirectiveThirdParty contained nchan_subscriber_last_message_id
syn keyword ngxDirectiveThirdParty contained nchan_subscriber_location
syn keyword ngxDirectiveThirdParty contained nchan_subscriber_message_id_custom_etag_header
syn keyword ngxDirectiveThirdParty contained nchan_subscriber_timeout
syn keyword ngxDirectiveThirdParty contained nchan_unsubscribe_request
syn keyword ngxDirectiveThirdParty contained nchan_use_redis
syn keyword ngxDirectiveThirdParty contained nchan_websocket_client_heartbeat
syn keyword ngxDirectiveThirdParty contained nchan_websocket_ping_interval
syn keyword ngxDirectiveThirdParty contained push_authorized_channels_only
syn keyword ngxDirectiveThirdParty contained push_channel_group
syn keyword ngxDirectiveThirdParty contained push_channel_timeout
syn keyword ngxDirectiveThirdParty contained push_max_channel_id_length
syn keyword ngxDirectiveThirdParty contained push_max_channel_subscribers
syn keyword ngxDirectiveThirdParty contained push_max_message_buffer_length
syn keyword ngxDirectiveThirdParty contained push_max_reserved_memory
syn keyword ngxDirectiveThirdParty contained push_message_buffer_length
syn keyword ngxDirectiveThirdParty contained push_message_timeout
syn keyword ngxDirectiveThirdParty contained push_min_message_buffer_length
syn keyword ngxDirectiveThirdParty contained push_publisher
syn keyword ngxDirectiveThirdParty contained push_store_messages
syn keyword ngxDirectiveThirdParty contained push_subscriber
syn keyword ngxDirectiveThirdParty contained push_subscriber_concurrency
syn keyword ngxDirectiveThirdParty contained push_subscriber_timeout

" An nginx module for sending statistics to statsd
" https://github.com/zebrafishlabs/nginx-statsd
syn keyword ngxDirectiveThirdParty contained statsd_count
syn keyword ngxDirectiveThirdParty contained statsd_sample_rate
syn keyword ngxDirectiveThirdParty contained statsd_server
syn keyword ngxDirectiveThirdParty contained statsd_timing

" Nginx module for etags on dynamic content
" https://github.com/kali/nginx-dynamic-etags
syn keyword ngxDirectiveThirdParty contained dynamic_etags

" ngx_set_misc - Various set_xxx directives added to nginx's rewrite module (md5/sha1, sql/json quoting, and many more)
" https://github.com/openresty/set-misc-nginx-module

" simple module to uppercase/lowercase strings in the nginx config
" https://github.com/replay/ngx_http_lower_upper_case
syn keyword ngxDirectiveThirdParty contained lower
syn keyword ngxDirectiveThirdParty contained upper

" nginx_substitutions_filter
" https://github.com/yaoweibin/ngx_http_substitutions_filter_module
syn keyword ngxDirectiveThirdParty contained subs_buffers
syn keyword ngxDirectiveThirdParty contained subs_filter
syn keyword ngxDirectiveThirdParty contained subs_filter_bypass
syn keyword ngxDirectiveThirdParty contained subs_filter_types
syn keyword ngxDirectiveThirdParty contained subs_line_buffer_size

" ngx_rds_csv - Nginx output filter module to convert Resty-DBD-Streams (RDS) to Comma-Separated Values (CSV)
" https://github.com/openresty/rds-csv-nginx-module

" Nginx module to set the language of a request based on a number of options
" https://github.com/simpl/ngx_http_set_lang
syn keyword ngxDirectiveThirdParty contained lang_cookie
syn keyword ngxDirectiveThirdParty contained lang_get_var
syn keyword ngxDirectiveThirdParty contained lang_host
syn keyword ngxDirectiveThirdParty contained lang_list
syn keyword ngxDirectiveThirdParty contained lang_post_var
syn keyword ngxDirectiveThirdParty contained lang_referer
syn keyword ngxDirectiveThirdParty contained set_lang
syn keyword ngxDirectiveThirdParty contained set_lang_method

" Split one big HTTP/Range request to multiple subrange requesets
" https://github.com/Qihoo360/ngx_http_subrange_module
syn keyword ngxDirectiveThirdParty contained subrange

" embedding Clojure or Java or Groovy programs
" https://github.com/nginx-clojure/nginx-clojure
syn keyword ngxDirectiveThirdParty contained access_handler_code
syn keyword ngxDirectiveThirdParty contained access_handler_name
syn keyword ngxDirectiveThirdParty contained access_handler_property
syn keyword ngxDirectiveThirdParty contained access_handler_type
syn keyword ngxDirectiveThirdParty contained always_read_body
syn keyword ngxDirectiveThirdParty contained auto_upgrade_ws
syn keyword ngxDirectiveThirdParty contained body_filter_code
syn keyword ngxDirectiveThirdParty contained body_filter_name
syn keyword ngxDirectiveThirdParty contained body_filter_property
syn keyword ngxDirectiveThirdParty contained body_filter_type
syn keyword ngxDirectiveThirdParty contained content_handler_code
syn keyword ngxDirectiveThirdParty contained content_handler_name
syn keyword ngxDirectiveThirdParty contained content_handler_property
syn keyword ngxDirectiveThirdParty contained content_handler_type
syn keyword ngxDirectiveThirdParty contained handler_code
syn keyword ngxDirectiveThirdParty contained handler_name
syn keyword ngxDirectiveThirdParty contained handler_type
syn keyword ngxDirectiveThirdParty contained handlers_lazy_init
syn keyword ngxDirectiveThirdParty contained header_filter_code
syn keyword ngxDirectiveThirdParty contained header_filter_name
syn keyword ngxDirectiveThirdParty contained header_filter_property
syn keyword ngxDirectiveThirdParty contained header_filter_type
syn keyword ngxDirectiveThirdParty contained jvm_classpath
syn keyword ngxDirectiveThirdParty contained jvm_classpath_check
syn keyword ngxDirectiveThirdParty contained jvm_exit_handler_code
syn keyword ngxDirectiveThirdParty contained jvm_exit_handler_name
syn keyword ngxDirectiveThirdParty contained jvm_handler_type
syn keyword ngxDirectiveThirdParty contained jvm_init_handler_code
syn keyword ngxDirectiveThirdParty contained jvm_init_handler_name
syn keyword ngxDirectiveThirdParty contained jvm_options
syn keyword ngxDirectiveThirdParty contained jvm_path
syn keyword ngxDirectiveThirdParty contained jvm_var
syn keyword ngxDirectiveThirdParty contained jvm_workers
syn keyword ngxDirectiveThirdParty contained max_balanced_tcp_connections
syn keyword ngxDirectiveThirdParty contained rewrite_handler_code
syn keyword ngxDirectiveThirdParty contained rewrite_handler_name
syn keyword ngxDirectiveThirdParty contained rewrite_handler_property
syn keyword ngxDirectiveThirdParty contained rewrite_handler_type
syn keyword ngxDirectiveThirdParty contained shared_map
syn keyword ngxDirectiveThirdParty contained write_page_size

" A module for nginx web server for handling file uploads using multipart/form-data encoding (RFC 1867)
" https://github.com/Austinb/nginx-upload-module
syn keyword ngxDirectiveThirdParty contained upload_aggregate_form_field
syn keyword ngxDirectiveThirdParty contained upload_archive_elm
syn keyword ngxDirectiveThirdParty contained upload_archive_elm_separator
syn keyword ngxDirectiveThirdParty contained upload_archive_path
syn keyword ngxDirectiveThirdParty contained upload_archive_path_separator
syn keyword ngxDirectiveThirdParty contained upload_buffer_size
syn keyword ngxDirectiveThirdParty contained upload_cleanup
syn keyword ngxDirectiveThirdParty contained upload_content_type
syn keyword ngxDirectiveThirdParty contained upload_discard
syn keyword ngxDirectiveThirdParty contained upload_field_name
syn keyword ngxDirectiveThirdParty contained upload_file_crc32
syn keyword ngxDirectiveThirdParty contained upload_file_md5
syn keyword ngxDirectiveThirdParty contained upload_file_md5_uc
syn keyword ngxDirectiveThirdParty contained upload_file_name
syn keyword ngxDirectiveThirdParty contained upload_file_sha1
syn keyword ngxDirectiveThirdParty contained upload_file_sha1_uc
syn keyword ngxDirectiveThirdParty contained upload_file_size
syn keyword ngxDirectiveThirdParty contained upload_filter
syn keyword ngxDirectiveThirdParty contained upload_max_file_size
syn keyword ngxDirectiveThirdParty contained upload_max_output_body_len
syn keyword ngxDirectiveThirdParty contained upload_max_part_header_len
syn keyword ngxDirectiveThirdParty contained upload_pass
syn keyword ngxDirectiveThirdParty contained upload_pass_args
syn keyword ngxDirectiveThirdParty contained upload_pass_form_field
syn keyword ngxDirectiveThirdParty contained upload_set_form_field
syn keyword ngxDirectiveThirdParty contained upload_store
syn keyword ngxDirectiveThirdParty contained upload_store_access
syn keyword ngxDirectiveThirdParty contained upload_tmp_path
syn keyword ngxDirectiveThirdParty contained upload_unzip
syn keyword ngxDirectiveThirdParty contained upload_unzip_buffers
syn keyword ngxDirectiveThirdParty contained upload_unzip_hash
syn keyword ngxDirectiveThirdParty contained upload_unzip_max_file_name_len
syn keyword ngxDirectiveThirdParty contained upload_unzip_window
syn keyword ngxDirectiveThirdParty contained upload_void_content_type

" character conversion nginx module using libiconv
" https://github.com/calio/iconv-nginx-module
syn keyword ngxDirectiveThirdParty contained iconv_buffer_size
syn keyword ngxDirectiveThirdParty contained iconv_filter
syn keyword ngxDirectiveThirdParty contained set_iconv

" nginx module which adds ability to cache static files
" https://github.com/FRiCKLE/ngx_slowfs_cache
syn keyword ngxDirectiveThirdParty contained slowfs_big_file_size
syn keyword ngxDirectiveThirdParty contained slowfs_cache
syn keyword ngxDirectiveThirdParty contained slowfs_cache_key
syn keyword ngxDirectiveThirdParty contained slowfs_cache_min_uses
syn keyword ngxDirectiveThirdParty contained slowfs_cache_path
syn keyword ngxDirectiveThirdParty contained slowfs_cache_purge
syn keyword ngxDirectiveThirdParty contained slowfs_cache_valid
syn keyword ngxDirectiveThirdParty contained slowfs_temp_path

" A Nginx module to dump backtrace when a worker process exits abnormally
" https://github.com/alibaba/nginx-backtrace
syn keyword ngxDirectiveThirdParty contained backtrace_log
syn keyword ngxDirectiveThirdParty contained backtrace_max_stack_size

" Nginx url encoding converting module
" https://github.com/vozlt/nginx-module-url
syn keyword ngxDirectiveThirdParty contained url_encoding_convert
syn keyword ngxDirectiveThirdParty contained url_encoding_convert_alloc_size
syn keyword ngxDirectiveThirdParty contained url_encoding_convert_alloc_size_x
syn keyword ngxDirectiveThirdParty contained url_encoding_convert_from
syn keyword ngxDirectiveThirdParty contained url_encoding_convert_phase
syn keyword ngxDirectiveThirdParty contained url_encoding_convert_to

" NGINX-based VOD Packager
" https://github.com/kaltura/nginx-vod-module
syn keyword ngxDirectiveThirdParty contained vod
syn keyword ngxDirectiveThirdParty contained vod_align_segments_to_key_frames
syn keyword ngxDirectiveThirdParty contained vod_apply_dynamic_mapping
syn keyword ngxDirectiveThirdParty contained vod_base_url
syn keyword ngxDirectiveThirdParty contained vod_bootstrap_segment_durations
syn keyword ngxDirectiveThirdParty contained vod_cache_buffer_size
syn keyword ngxDirectiveThirdParty contained vod_clip_from_param_name
syn keyword ngxDirectiveThirdParty contained vod_clip_to_param_name
syn keyword ngxDirectiveThirdParty contained vod_drm_clear_lead_segment_count
syn keyword ngxDirectiveThirdParty contained vod_drm_enabled
syn keyword ngxDirectiveThirdParty contained vod_drm_info_cache
syn keyword ngxDirectiveThirdParty contained vod_drm_max_info_length
syn keyword ngxDirectiveThirdParty contained vod_drm_request_uri
syn keyword ngxDirectiveThirdParty contained vod_drm_single_key
syn keyword ngxDirectiveThirdParty contained vod_drm_upstream_location
syn keyword ngxDirectiveThirdParty contained vod_dynamic_clip_map_uri
syn keyword ngxDirectiveThirdParty contained vod_dynamic_mapping_cache
syn keyword ngxDirectiveThirdParty contained vod_encryption_iv_seed
syn keyword ngxDirectiveThirdParty contained vod_expires
syn keyword ngxDirectiveThirdParty contained vod_expires_live
syn keyword ngxDirectiveThirdParty contained vod_expires_live_time_dependent
syn keyword ngxDirectiveThirdParty contained vod_fallback_upstream_location
syn keyword ngxDirectiveThirdParty contained vod_force_continuous_timestamps
syn keyword ngxDirectiveThirdParty contained vod_force_playlist_type_vod
syn keyword ngxDirectiveThirdParty contained vod_gop_look_ahead
syn keyword ngxDirectiveThirdParty contained vod_gop_look_behind
syn keyword ngxDirectiveThirdParty contained vod_ignore_edit_list
syn keyword ngxDirectiveThirdParty contained vod_initial_read_size
syn keyword ngxDirectiveThirdParty contained vod_lang_param_name
syn keyword ngxDirectiveThirdParty contained vod_last_modified
syn keyword ngxDirectiveThirdParty contained vod_last_modified_types
syn keyword ngxDirectiveThirdParty contained vod_live_mapping_cache
syn keyword ngxDirectiveThirdParty contained vod_live_response_cache
syn keyword ngxDirectiveThirdParty contained vod_live_window_duration
syn keyword ngxDirectiveThirdParty contained vod_manifest_duration_policy
syn keyword ngxDirectiveThirdParty contained vod_manifest_segment_durations_mode
syn keyword ngxDirectiveThirdParty contained vod_mapping_cache
syn keyword ngxDirectiveThirdParty contained vod_max_frames_size
syn keyword ngxDirectiveThirdParty contained vod_max_mapping_response_size
syn keyword ngxDirectiveThirdParty contained vod_max_metadata_size
syn keyword ngxDirectiveThirdParty contained vod_max_upstream_headers_size
syn keyword ngxDirectiveThirdParty contained vod_media_set_map_uri
syn keyword ngxDirectiveThirdParty contained vod_media_set_override_json
syn keyword ngxDirectiveThirdParty contained vod_metadata_cache
syn keyword ngxDirectiveThirdParty contained vod_min_single_nalu_per_frame_segment
syn keyword ngxDirectiveThirdParty contained vod_mode
syn keyword ngxDirectiveThirdParty contained vod_multi_uri_suffix
syn keyword ngxDirectiveThirdParty contained vod_notification_uri
syn keyword ngxDirectiveThirdParty contained vod_open_file_thread_pool
syn keyword ngxDirectiveThirdParty contained vod_output_buffer_pool
syn keyword ngxDirectiveThirdParty contained vod_parse_hdlr_name
syn keyword ngxDirectiveThirdParty contained vod_path_response_postfix
syn keyword ngxDirectiveThirdParty contained vod_path_response_prefix
syn keyword ngxDirectiveThirdParty contained vod_performance_counters
syn keyword ngxDirectiveThirdParty contained vod_proxy_header_name
syn keyword ngxDirectiveThirdParty contained vod_proxy_header_value
syn keyword ngxDirectiveThirdParty contained vod_redirect_segments_url
syn keyword ngxDirectiveThirdParty contained vod_remote_upstream_location
syn keyword ngxDirectiveThirdParty contained vod_response_cache
syn keyword ngxDirectiveThirdParty contained vod_secret_key
syn keyword ngxDirectiveThirdParty contained vod_segment_count_policy
syn keyword ngxDirectiveThirdParty contained vod_segment_duration
syn keyword ngxDirectiveThirdParty contained vod_segments_base_url
syn keyword ngxDirectiveThirdParty contained vod_source_clip_map_uri
syn keyword ngxDirectiveThirdParty contained vod_speed_param_name
syn keyword ngxDirectiveThirdParty contained vod_status
syn keyword ngxDirectiveThirdParty contained vod_time_shift_param_name
syn keyword ngxDirectiveThirdParty contained vod_tracks_param_name
syn keyword ngxDirectiveThirdParty contained vod_upstream_extra_args
syn keyword ngxDirectiveThirdParty contained vod_upstream_location

" ngx_http_geoip2_module
" https://github.com/leev/ngx_http_geoip2_module
syn keyword ngxDirectiveThirdParty contained geoip2
syn keyword ngxDirectiveThirdParty contained geoip2_proxy
syn keyword ngxDirectiveThirdParty contained geoip2_proxy_recursive

" Shibboleth auth request module for Nginx
" https://github.com/nginx-shib/nginx-http-shibboleth
syn keyword ngxDirectiveThirdParty contained shib_request
syn keyword ngxDirectiveThirdParty contained shib_request_set
syn keyword ngxDirectiveThirdParty contained shib_request_use_headers

" Nginx Video Thumb Extractor Module
" https://github.com/wandenberg/nginx-video-thumbextractor-module
syn keyword ngxDirectiveThirdParty contained video_thumbextractor
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_image_height
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_image_width
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_jpeg_baseline
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_jpeg_dpi
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_jpeg_optimize
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_jpeg_progressive_mode
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_jpeg_quality
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_jpeg_smooth
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_next_time
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_only_keyframe
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_processes_per_worker
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_threads
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_tile_color
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_tile_cols
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_tile_margin
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_tile_max_cols
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_tile_max_rows
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_tile_padding
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_tile_rows
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_tile_sample_interval
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_video_filename
syn keyword ngxDirectiveThirdParty contained video_thumbextractor_video_second

" Upstream Consistent Hash
" https://github.com/replay/ngx_http_consistent_hash
syn keyword ngxDirectiveThirdParty contained consistent_hash

" A version of the Nginx HTTP stub status module that outputs in JSON format
" https://github.com/nginx-modules/nginx-json-status-module
syn keyword ngxDirectiveThirdParty contained json_status
syn keyword ngxDirectiveThirdParty contained json_status_type

" ngx_memc - An extended version of the standard memcached module
" https://github.com/openresty/memc-nginx-module

" Fancy Index
" https://github.com/aperezdc/ngx-fancyindex
syn keyword ngxDirectiveThirdParty contained fancyindex
syn keyword ngxDirectiveThirdParty contained fancyindex_css_href
syn keyword ngxDirectiveThirdParty contained fancyindex_default_sort
syn keyword ngxDirectiveThirdParty contained fancyindex_directories_first
syn keyword ngxDirectiveThirdParty contained fancyindex_exact_size
syn keyword ngxDirectiveThirdParty contained fancyindex_footer
syn keyword ngxDirectiveThirdParty contained fancyindex_header
syn keyword ngxDirectiveThirdParty contained fancyindex_hide_symlinks
syn keyword ngxDirectiveThirdParty contained fancyindex_ignore
syn keyword ngxDirectiveThirdParty contained fancyindex_localtime
syn keyword ngxDirectiveThirdParty contained fancyindex_name_length
syn keyword ngxDirectiveThirdParty contained fancyindex_show_path
syn keyword ngxDirectiveThirdParty contained fancyindex_time_format

" A module allowing the nginx to use files embedded in a zip file
" https://github.com/youzee/nginx-unzip-module
syn keyword ngxDirectiveThirdParty contained file_in_unzip
syn keyword ngxDirectiveThirdParty contained file_in_unzip_archivefile
syn keyword ngxDirectiveThirdParty contained file_in_unzip_extract

" PAM Authentication
" https://github.com/sto/ngx_http_auth_pam_module
syn keyword ngxDirectiveThirdParty contained auth_pam
syn keyword ngxDirectiveThirdParty contained auth_pam_service_name
syn keyword ngxDirectiveThirdParty contained auth_pam_set_pam_env

" Enhanced Nginx Memcached Module
" https://github.com/bpaquet/ngx_http_enhanced_memcached_module
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_allow_delete
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_allow_put
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_bind
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_buffer_size
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_connect_timeout
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_flush
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_flush_namespace
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_hash_keys_with_md5
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_pass
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_read_timeout
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_send_timeout
syn keyword ngxDirectiveThirdParty contained enhanced_memcached_stats

" ModSecurity web application firewall
" https://github.com/SpiderLabs/ModSecurity/tree/master
syn keyword ngxDirectiveThirdParty contained ModSecurityConfig
syn keyword ngxDirectiveThirdParty contained ModSecurityEnabled
syn keyword ngxDirectiveThirdParty contained pool_context_hash_size

" ngx_http_lua_module - Embed the power of Lua into Nginx HTTP Servers
" https://github.com/openresty/lua-nginx-module

" Nginx Audio Track for HTTP Live Streaming
" https://github.com/flavioribeiro/nginx-audio-track-for-hls-module
syn keyword ngxDirectiveThirdParty contained ngx_hls_audio_track
syn keyword ngxDirectiveThirdParty contained ngx_hls_audio_track_output_format
syn keyword ngxDirectiveThirdParty contained ngx_hls_audio_track_output_header
syn keyword ngxDirectiveThirdParty contained ngx_hls_audio_track_rootpath

" Limit upload rate
" https://github.com/cfsego/limit_upload_rate
syn keyword ngxDirectiveThirdParty contained limit_upload_rate
syn keyword ngxDirectiveThirdParty contained limit_upload_rate_after
syn keyword ngxDirectiveThirdParty contained limit_upload_rate_log_level

" AJP protocol proxy
" https://github.com/yaoweibin/nginx_ajp_module
syn keyword ngxDirectiveThirdParty contained ajp_buffer_size
syn keyword ngxDirectiveThirdParty contained ajp_buffers
syn keyword ngxDirectiveThirdParty contained ajp_busy_buffers_size
syn keyword ngxDirectiveThirdParty contained ajp_cache
syn keyword ngxDirectiveThirdParty contained ajp_cache_key
syn keyword ngxDirectiveThirdParty contained ajp_cache_lock
syn keyword ngxDirectiveThirdParty contained ajp_cache_lock_timeout
syn keyword ngxDirectiveThirdParty contained ajp_cache_methods
syn keyword ngxDirectiveThirdParty contained ajp_cache_min_uses
syn keyword ngxDirectiveThirdParty contained ajp_cache_path
syn keyword ngxDirectiveThirdParty contained ajp_cache_use_stale
syn keyword ngxDirectiveThirdParty contained ajp_cache_valid
syn keyword ngxDirectiveThirdParty contained ajp_connect_timeout
syn keyword ngxDirectiveThirdParty contained ajp_header_packet_buffer_size
syn keyword ngxDirectiveThirdParty contained ajp_hide_header
syn keyword ngxDirectiveThirdParty contained ajp_ignore_client_abort
syn keyword ngxDirectiveThirdParty contained ajp_ignore_headers
syn keyword ngxDirectiveThirdParty contained ajp_intercept_errors
syn keyword ngxDirectiveThirdParty contained ajp_keep_conn
syn keyword ngxDirectiveThirdParty contained ajp_max_data_packet_size
syn keyword ngxDirectiveThirdParty contained ajp_max_temp_file_size
syn keyword ngxDirectiveThirdParty contained ajp_next_upstream
syn keyword ngxDirectiveThirdParty contained ajp_pass
syn keyword ngxDirectiveThirdParty contained ajp_pass_header
syn keyword ngxDirectiveThirdParty contained ajp_pass_request_body
syn keyword ngxDirectiveThirdParty contained ajp_pass_request_headers
syn keyword ngxDirectiveThirdParty contained ajp_read_timeout
syn keyword ngxDirectiveThirdParty contained ajp_send_lowat
syn keyword ngxDirectiveThirdParty contained ajp_send_timeout
syn keyword ngxDirectiveThirdParty contained ajp_store
syn keyword ngxDirectiveThirdParty contained ajp_store_access
syn keyword ngxDirectiveThirdParty contained ajp_temp_file_write_size
syn keyword ngxDirectiveThirdParty contained ajp_temp_path
syn keyword ngxDirectiveThirdParty contained ajp_upstream_fail_timeout
syn keyword ngxDirectiveThirdParty contained ajp_upstream_max_fails

" Streaming regular expression replacement in response bodies
" https://github.com/openresty/replace-filter-nginx-module

" ngx_http_types_filter_module
" https://github.com/flygoast/ngx_http_types_filter
syn keyword ngxDirectiveThirdParty contained types_filter
syn keyword ngxDirectiveThirdParty contained types_filter_use_default

" Nginx module for retrieving user attributes and groups from SSSD
" https://github.com/veruu/ngx_sssd_info
syn keyword ngxDirectiveThirdParty contained sssd_info
syn keyword ngxDirectiveThirdParty contained sssd_info_attribute
syn keyword ngxDirectiveThirdParty contained sssd_info_attribute_separator
syn keyword ngxDirectiveThirdParty contained sssd_info_attributes
syn keyword ngxDirectiveThirdParty contained sssd_info_group
syn keyword ngxDirectiveThirdParty contained sssd_info_group_separator
syn keyword ngxDirectiveThirdParty contained sssd_info_groups
syn keyword ngxDirectiveThirdParty contained sssd_info_output_to

" Footer filter
" https://github.com/alibaba/nginx-http-footer-filter
syn keyword ngxDirectiveThirdParty contained footer
syn keyword ngxDirectiveThirdParty contained footer_types

" Syntactically Awesome NGINX Module
" https://github.com/mneudert/sass-nginx-module
syn keyword ngxDirectiveThirdParty contained sass_compile
syn keyword ngxDirectiveThirdParty contained sass_error_log
syn keyword ngxDirectiveThirdParty contained sass_include_path
syn keyword ngxDirectiveThirdParty contained sass_indent
syn keyword ngxDirectiveThirdParty contained sass_is_indented_syntax
syn keyword ngxDirectiveThirdParty contained sass_linefeed
syn keyword ngxDirectiveThirdParty contained sass_output_style
syn keyword ngxDirectiveThirdParty contained sass_precision
syn keyword ngxDirectiveThirdParty contained sass_source_comments
syn keyword ngxDirectiveThirdParty contained sass_source_map_embed

" Nginx module for POST authentication and authorization
" https://github.com/veruu/ngx_form_auth
syn keyword ngxDirectiveThirdParty contained form_auth
syn keyword ngxDirectiveThirdParty contained form_auth_login
syn keyword ngxDirectiveThirdParty contained form_auth_pam_service
syn keyword ngxDirectiveThirdParty contained form_auth_password
syn keyword ngxDirectiveThirdParty contained form_auth_remote_user

" NGINX module for Brotli compression
" https://github.com/eustas/ngx_brotli
syn keyword ngxDirectiveThirdParty contained brotli
syn keyword ngxDirectiveThirdParty contained brotli_buffers
syn keyword ngxDirectiveThirdParty contained brotli_comp_level
syn keyword ngxDirectiveThirdParty contained brotli_min_length
syn keyword ngxDirectiveThirdParty contained brotli_static
syn keyword ngxDirectiveThirdParty contained brotli_types
syn keyword ngxDirectiveThirdParty contained brotli_window

" nginx max connections queue
" https://github.com/ezmobius/nginx-ey-balancer
syn keyword ngxDirectiveThirdParty contained max_connections_max_queue_length
syn keyword ngxDirectiveThirdParty contained max_connections_queue_timeout

" nginx-upsync-module
" https://github.com/weibocom/nginx-upsync-module
syn keyword ngxDirectiveThirdParty contained upstream_show
syn keyword ngxDirectiveThirdParty contained upsync
syn keyword ngxDirectiveThirdParty contained upsync_dump_path
syn keyword ngxDirectiveThirdParty contained upsync_lb

" Embed the power of Lua into NGINX TCP/UDP servers
" https://github.com/openresty/stream-lua-nginx-module

" Health checks upstreams for nginx
" https://github.com/yaoweibin/nginx_upstream_check_module
syn keyword ngxDirectiveThirdParty contained check
syn keyword ngxDirectiveThirdParty contained check_fastcgi_param
syn keyword ngxDirectiveThirdParty contained check_http_expect_alive
syn keyword ngxDirectiveThirdParty contained check_http_send
syn keyword ngxDirectiveThirdParty contained check_keepalive_requests
syn keyword ngxDirectiveThirdParty contained check_shm_size
syn keyword ngxDirectiveThirdParty contained check_status

" add given content to the end of the response according to the condition specified
" https://github.com/flygoast/ngx_http_footer_if_filter
syn keyword ngxDirectiveThirdParty contained footer_if

" encrypt and decrypt nginx variable values
" https://github.com/openresty/encrypted-session-nginx-module

" NGINX-based Media Streaming Server
" https://github.com/arut/nginx-rtmp-module
syn keyword ngxDirectiveThirdParty contained ack_window
syn keyword ngxDirectiveThirdParty contained application
syn keyword ngxDirectiveThirdParty contained buffer
syn keyword ngxDirectiveThirdParty contained buflen
syn keyword ngxDirectiveThirdParty contained busy
syn keyword ngxDirectiveThirdParty contained chunk_size
syn keyword ngxDirectiveThirdParty contained dash
syn keyword ngxDirectiveThirdParty contained dash_cleanup
syn keyword ngxDirectiveThirdParty contained dash_fragment
syn keyword ngxDirectiveThirdParty contained dash_nested
syn keyword ngxDirectiveThirdParty contained dash_path
syn keyword ngxDirectiveThirdParty contained dash_playlist_length
syn keyword ngxDirectiveThirdParty contained drop_idle_publisher
syn keyword ngxDirectiveThirdParty contained exec
syn keyword ngxDirectiveThirdParty contained exec_block
syn keyword ngxDirectiveThirdParty contained exec_kill_signal
syn keyword ngxDirectiveThirdParty contained exec_options
syn keyword ngxDirectiveThirdParty contained exec_play
syn keyword ngxDirectiveThirdParty contained exec_play_done
syn keyword ngxDirectiveThirdParty contained exec_publish
syn keyword ngxDirectiveThirdParty contained exec_publish_done
syn keyword ngxDirectiveThirdParty contained exec_pull
syn keyword ngxDirectiveThirdParty contained exec_push
syn keyword ngxDirectiveThirdParty contained exec_record_done
syn keyword ngxDirectiveThirdParty contained exec_static
syn keyword ngxDirectiveThirdParty contained hls_audio_buffer_size
syn keyword ngxDirectiveThirdParty contained hls_base_url
syn keyword ngxDirectiveThirdParty contained hls_cleanup
syn keyword ngxDirectiveThirdParty contained hls_continuous
syn keyword ngxDirectiveThirdParty contained hls_fragment_naming
syn keyword ngxDirectiveThirdParty contained hls_fragment_naming_granularity
syn keyword ngxDirectiveThirdParty contained hls_fragment_slicing
syn keyword ngxDirectiveThirdParty contained hls_fragments_per_key
syn keyword ngxDirectiveThirdParty contained hls_key_path
syn keyword ngxDirectiveThirdParty contained hls_key_url
syn keyword ngxDirectiveThirdParty contained hls_keys
syn keyword ngxDirectiveThirdParty contained hls_max_audio_delay
syn keyword ngxDirectiveThirdParty contained hls_max_fragment
syn keyword ngxDirectiveThirdParty contained hls_muxdelay
syn keyword ngxDirectiveThirdParty contained hls_nested
syn keyword ngxDirectiveThirdParty contained hls_path
syn keyword ngxDirectiveThirdParty contained hls_playlist_length
syn keyword ngxDirectiveThirdParty contained hls_sync
syn keyword ngxDirectiveThirdParty contained hls_type
syn keyword ngxDirectiveThirdParty contained hls_variant
syn keyword ngxDirectiveThirdParty contained idle_streams
syn keyword ngxDirectiveThirdParty contained interleave
syn keyword ngxDirectiveThirdParty contained live
syn keyword ngxDirectiveThirdParty contained max_connections
syn keyword ngxDirectiveThirdParty contained max_message
syn keyword ngxDirectiveThirdParty contained max_streams
syn keyword ngxDirectiveThirdParty contained meta
syn keyword ngxDirectiveThirdParty contained netcall_buffer
syn keyword ngxDirectiveThirdParty contained netcall_timeout
syn keyword ngxDirectiveThirdParty contained notify_method
syn keyword ngxDirectiveThirdParty contained notify_relay_redirect
syn keyword ngxDirectiveThirdParty contained notify_update_strict
syn keyword ngxDirectiveThirdParty contained notify_update_timeout
syn keyword ngxDirectiveThirdParty contained on_connect
syn keyword ngxDirectiveThirdParty contained on_disconnect
syn keyword ngxDirectiveThirdParty contained on_done
syn keyword ngxDirectiveThirdParty contained on_play
syn keyword ngxDirectiveThirdParty contained on_play_done
syn keyword ngxDirectiveThirdParty contained on_publish
syn keyword ngxDirectiveThirdParty contained on_publish_done
syn keyword ngxDirectiveThirdParty contained on_record_done
syn keyword ngxDirectiveThirdParty contained on_update
syn keyword ngxDirectiveThirdParty contained out_cork
syn keyword ngxDirectiveThirdParty contained out_queue
syn keyword ngxDirectiveThirdParty contained ping
syn keyword ngxDirectiveThirdParty contained ping_timeout
syn keyword ngxDirectiveThirdParty contained play
syn keyword ngxDirectiveThirdParty contained play_local_path
syn keyword ngxDirectiveThirdParty contained play_restart
syn keyword ngxDirectiveThirdParty contained play_temp_path
syn keyword ngxDirectiveThirdParty contained play_time_fix
syn keyword ngxDirectiveThirdParty contained publish_notify
syn keyword ngxDirectiveThirdParty contained publish_time_fix
syn keyword ngxDirectiveThirdParty contained pull
syn keyword ngxDirectiveThirdParty contained pull_reconnect
syn keyword ngxDirectiveThirdParty contained push
syn keyword ngxDirectiveThirdParty contained push_reconnect
syn keyword ngxDirectiveThirdParty contained record
syn keyword ngxDirectiveThirdParty contained record_append
syn keyword ngxDirectiveThirdParty contained record_interval
syn keyword ngxDirectiveThirdParty contained record_lock
syn keyword ngxDirectiveThirdParty contained record_max_frames
syn keyword ngxDirectiveThirdParty contained record_max_size
syn keyword ngxDirectiveThirdParty contained record_notify
syn keyword ngxDirectiveThirdParty contained record_path
syn keyword ngxDirectiveThirdParty contained record_suffix
syn keyword ngxDirectiveThirdParty contained record_unique
syn keyword ngxDirectiveThirdParty contained recorder
syn keyword ngxDirectiveThirdParty contained relay_buffer
syn keyword ngxDirectiveThirdParty contained respawn
syn keyword ngxDirectiveThirdParty contained respawn_timeout
syn keyword ngxDirectiveThirdParty contained rtmp
syn keyword ngxDirectiveThirdParty contained rtmp_auto_push
syn keyword ngxDirectiveThirdParty contained rtmp_auto_push_reconnect
syn keyword ngxDirectiveThirdParty contained rtmp_control
syn keyword ngxDirectiveThirdParty contained rtmp_socket_dir
syn keyword ngxDirectiveThirdParty contained rtmp_stat
syn keyword ngxDirectiveThirdParty contained rtmp_stat_stylesheet
syn keyword ngxDirectiveThirdParty contained session_relay
syn keyword ngxDirectiveThirdParty contained so_keepalive
syn keyword ngxDirectiveThirdParty contained stream_buckets
syn keyword ngxDirectiveThirdParty contained sync
syn keyword ngxDirectiveThirdParty contained wait_key
syn keyword ngxDirectiveThirdParty contained wait_video

" update upstreams' config by restful interface
" https://github.com/yzprofile/ngx_http_dyups_module
syn keyword ngxDirectiveThirdParty contained dyups_interface
syn keyword ngxDirectiveThirdParty contained dyups_read_msg_log
syn keyword ngxDirectiveThirdParty contained dyups_read_msg_timeout
syn keyword ngxDirectiveThirdParty contained dyups_shm_zone_size
syn keyword ngxDirectiveThirdParty contained dyups_trylock
syn keyword ngxDirectiveThirdParty contained dyups_upstream_conf

" nginx-upload-progress-module
" https://github.com/masterzen/nginx-upload-progress-module
syn keyword ngxDirectiveThirdParty contained report_uploads
syn keyword ngxDirectiveThirdParty contained track_uploads
syn keyword ngxDirectiveThirdParty contained upload_progress
syn keyword ngxDirectiveThirdParty contained upload_progress_content_type
syn keyword ngxDirectiveThirdParty contained upload_progress_header
syn keyword ngxDirectiveThirdParty contained upload_progress_java_output
syn keyword ngxDirectiveThirdParty contained upload_progress_json_output
syn keyword ngxDirectiveThirdParty contained upload_progress_jsonp_output
syn keyword ngxDirectiveThirdParty contained upload_progress_jsonp_parameter
syn keyword ngxDirectiveThirdParty contained upload_progress_template

" simple robot mitigation module using cookie based challenge/response technique. Not supported any more.
" https://github.com/kyprizel/testcookie-nginx-module
syn keyword ngxDirectiveThirdParty contained testcookie
syn keyword ngxDirectiveThirdParty contained testcookie_arg
syn keyword ngxDirectiveThirdParty contained testcookie_deny_keepalive
syn keyword ngxDirectiveThirdParty contained testcookie_domain
syn keyword ngxDirectiveThirdParty contained testcookie_expires
syn keyword ngxDirectiveThirdParty contained testcookie_fallback
syn keyword ngxDirectiveThirdParty contained testcookie_get_only
syn keyword ngxDirectiveThirdParty contained testcookie_httponly_flag
syn keyword ngxDirectiveThirdParty contained testcookie_https_location
syn keyword ngxDirectiveThirdParty contained testcookie_internal
syn keyword ngxDirectiveThirdParty contained testcookie_max_attempts
syn keyword ngxDirectiveThirdParty contained testcookie_name
syn keyword ngxDirectiveThirdParty contained testcookie_p3p
syn keyword ngxDirectiveThirdParty contained testcookie_pass
syn keyword ngxDirectiveThirdParty contained testcookie_path
syn keyword ngxDirectiveThirdParty contained testcookie_port_in_redirect
syn keyword ngxDirectiveThirdParty contained testcookie_redirect_via_refresh
syn keyword ngxDirectiveThirdParty contained testcookie_refresh_encrypt_cookie
syn keyword ngxDirectiveThirdParty contained testcookie_refresh_encrypt_cookie_iv
syn keyword ngxDirectiveThirdParty contained testcookie_refresh_encrypt_cookie_key
syn keyword ngxDirectiveThirdParty contained testcookie_refresh_status
syn keyword ngxDirectiveThirdParty contained testcookie_refresh_template
syn keyword ngxDirectiveThirdParty contained testcookie_secret
syn keyword ngxDirectiveThirdParty contained testcookie_secure_flag
syn keyword ngxDirectiveThirdParty contained testcookie_session
syn keyword ngxDirectiveThirdParty contained testcookie_whitelist

" nginx module to parse php sessions
" https://github.com/replay/ngx_http_php_session
syn keyword ngxDirectiveThirdParty contained php_session_parse
syn keyword ngxDirectiveThirdParty contained php_session_strip_formatting

" Accept Language
" https://github.com/giom/nginx_accept_language_module
syn keyword ngxDirectiveThirdParty contained set_from_accept_language

" Nginx Sorted Querystring Module
" https://github.com/wandenberg/nginx-sorted-querystring-module
syn keyword ngxDirectiveThirdParty contained sorted_querysting_filter_parameter

" Ancient nginx plugin; probably not useful to anyone
" https://github.com/kr/nginx-notice
syn keyword ngxDirectiveThirdParty contained notice
syn keyword ngxDirectiveThirdParty contained notice_type

" Nginx Module for Authenticating Akamai G2O requests
" https://github.com/kaltura/nginx_mod_akamai_g2o
syn keyword ngxDirectiveThirdParty contained g2o
syn keyword ngxDirectiveThirdParty contained g2o_data_header
syn keyword ngxDirectiveThirdParty contained g2o_hash_function
syn keyword ngxDirectiveThirdParty contained g2o_key
syn keyword ngxDirectiveThirdParty contained g2o_log_level
syn keyword ngxDirectiveThirdParty contained g2o_nonce
syn keyword ngxDirectiveThirdParty contained g2o_sign_header
syn keyword ngxDirectiveThirdParty contained g2o_time_window
syn keyword ngxDirectiveThirdParty contained g2o_version

" ngx_eval
" https://github.com/openresty/nginx-eval-module

" Add support for array-typed variables to nginx config files
" https://github.com/openresty/array-var-nginx-module

" ngx_stream_echo - TCP/stream echo module for NGINX (a port of the ngx_http_echo module)
" https://github.com/openresty/stream-echo-nginx-module

" xss-nginx-module - Native cross-site scripting support in nginx
" https://github.com/openresty/xss-nginx-module

" MogileFS client for nginx
" https://github.com/vkholodkov/nginx-mogilefs-module
syn keyword ngxDirectiveThirdParty contained mogilefs_class
syn keyword ngxDirectiveThirdParty contained mogilefs_connect_timeout
syn keyword ngxDirectiveThirdParty contained mogilefs_domain
syn keyword ngxDirectiveThirdParty contained mogilefs_methods
syn keyword ngxDirectiveThirdParty contained mogilefs_noverify
syn keyword ngxDirectiveThirdParty contained mogilefs_pass
syn keyword ngxDirectiveThirdParty contained mogilefs_read_timeout
syn keyword ngxDirectiveThirdParty contained mogilefs_send_timeout
syn keyword ngxDirectiveThirdParty contained mogilefs_tracker

" drizzle-nginx-module - Upstream module for talking to MySQL and Drizzle directly
" https://github.com/openresty/drizzle-nginx-module

" log messages over ZeroMQ
" https://github.com/alticelabs/nginx-log-zmq
syn keyword ngxDirectiveThirdParty contained log_zmq_endpoint
syn keyword ngxDirectiveThirdParty contained log_zmq_format
syn keyword ngxDirectiveThirdParty contained log_zmq_off
syn keyword ngxDirectiveThirdParty contained log_zmq_server

" Nginx upstream module for Sphinx 2.x search daemon
" https://github.com/reeteshranjan/sphinx2-nginx-module
syn keyword ngxDirectiveThirdParty contained sphinx2_bind
syn keyword ngxDirectiveThirdParty contained sphinx2_buffer_size
syn keyword ngxDirectiveThirdParty contained sphinx2_connect_timeout
syn keyword ngxDirectiveThirdParty contained sphinx2_next_upstream
syn keyword ngxDirectiveThirdParty contained sphinx2_pass
syn keyword ngxDirectiveThirdParty contained sphinx2_read_timeout
syn keyword ngxDirectiveThirdParty contained sphinx2_send_timeout

" Nginx HTTP rDNS module
" https://github.com/flant/nginx-http-rdns
syn keyword ngxDirectiveThirdParty contained rdns
syn keyword ngxDirectiveThirdParty contained rdns_allow
syn keyword ngxDirectiveThirdParty contained rdns_deny

" An asynchronous domain name resolve module for nginx upstream
" https://github.com/wdaike/ngx_upstream_jdomain
syn keyword ngxDirectiveThirdParty contained jdomain

" Adds support for arithmetic operations to NGINX config
" https://github.com/arut/nginx-let-module
syn keyword ngxDirectiveThirdParty contained let

" Phusion Passenger
" https://www.phusionpassenger.com/library/config/nginx/reference/
syn keyword ngxDirectiveThirdParty contained passenger_abort_on_startup_error
syn keyword ngxDirectiveThirdParty contained passenger_abort_websockets_on_process_shutdown
syn keyword ngxDirectiveThirdParty contained passenger_app_env
syn keyword ngxDirectiveThirdParty contained passenger_app_file_descriptor_ulimit
syn keyword ngxDirectiveThirdParty contained passenger_app_group_name
syn keyword ngxDirectiveThirdParty contained passenger_app_rights
syn keyword ngxDirectiveThirdParty contained passenger_app_root
syn keyword ngxDirectiveThirdParty contained passenger_app_type
syn keyword ngxDirectiveThirdParty contained passenger_base_uri
syn keyword ngxDirectiveThirdParty contained passenger_buffer_response
syn keyword ngxDirectiveThirdParty contained passenger_buffer_size
syn keyword ngxDirectiveThirdParty contained passenger_buffers
syn keyword ngxDirectiveThirdParty contained passenger_busy_buffers_size
syn keyword ngxDirectiveThirdParty contained passenger_concurrency_model
syn keyword ngxDirectiveThirdParty contained passenger_core_file_descriptor_ulimit
syn keyword ngxDirectiveThirdParty contained passenger_ctl
syn keyword ngxDirectiveThirdParty contained passenger_data_buffer_dir
syn keyword ngxDirectiveThirdParty contained passenger_debugger
syn keyword ngxDirectiveThirdParty contained passenger_default_group
syn keyword ngxDirectiveThirdParty contained passenger_default_user
syn keyword ngxDirectiveThirdParty contained passenger_disable_security_update_check
syn keyword ngxDirectiveThirdParty contained passenger_document_root
syn keyword ngxDirectiveThirdParty contained passenger_enabled
syn keyword ngxDirectiveThirdParty contained passenger_env_var
syn keyword ngxDirectiveThirdParty contained passenger_file_descriptor_log_file
syn keyword ngxDirectiveThirdParty contained passenger_fly_with
syn keyword ngxDirectiveThirdParty contained passenger_force_max_concurrent_requests_per_process
syn keyword ngxDirectiveThirdParty contained passenger_friendly_error_pages
syn keyword ngxDirectiveThirdParty contained passenger_group
syn keyword ngxDirectiveThirdParty contained passenger_headers_hash_bucket_size
syn keyword ngxDirectiveThirdParty contained passenger_headers_hash_max_size
syn keyword ngxDirectiveThirdParty contained passenger_ignore_client_abort
syn keyword ngxDirectiveThirdParty contained passenger_ignore_headers
syn keyword ngxDirectiveThirdParty contained passenger_instance_registry_dir
syn keyword ngxDirectiveThirdParty contained passenger_intercept_errors
syn keyword ngxDirectiveThirdParty contained passenger_load_shell_envvars
syn keyword ngxDirectiveThirdParty contained passenger_log_file
syn keyword ngxDirectiveThirdParty contained passenger_log_level
syn keyword ngxDirectiveThirdParty contained passenger_max_instances
syn keyword ngxDirectiveThirdParty contained passenger_max_instances_per_app
syn keyword ngxDirectiveThirdParty contained passenger_max_pool_size
syn keyword ngxDirectiveThirdParty contained passenger_max_preloader_idle_time
syn keyword ngxDirectiveThirdParty contained passenger_max_request_queue_size
syn keyword ngxDirectiveThirdParty contained passenger_max_request_queue_time
syn keyword ngxDirectiveThirdParty contained passenger_max_request_time
syn keyword ngxDirectiveThirdParty contained passenger_max_requests
syn keyword ngxDirectiveThirdParty contained passenger_memory_limit
syn keyword ngxDirectiveThirdParty contained passenger_meteor_app_settings
syn keyword ngxDirectiveThirdParty contained passenger_min_instances
syn keyword ngxDirectiveThirdParty contained passenger_nodejs
syn keyword ngxDirectiveThirdParty contained passenger_pass_header
syn keyword ngxDirectiveThirdParty contained passenger_pool_idle_time
syn keyword ngxDirectiveThirdParty contained passenger_pre_start
syn keyword ngxDirectiveThirdParty contained passenger_python
syn keyword ngxDirectiveThirdParty contained passenger_read_timeout
syn keyword ngxDirectiveThirdParty contained passenger_request_queue_overflow_status_code
syn keyword ngxDirectiveThirdParty contained passenger_resist_deployment_errors
syn keyword ngxDirectiveThirdParty contained passenger_response_buffer_high_watermark
syn keyword ngxDirectiveThirdParty contained passenger_restart_dir
syn keyword ngxDirectiveThirdParty contained passenger_rolling_restarts
syn keyword ngxDirectiveThirdParty contained passenger_root
syn keyword ngxDirectiveThirdParty contained passenger_ruby
syn keyword ngxDirectiveThirdParty contained passenger_security_update_check_proxy
syn keyword ngxDirectiveThirdParty contained passenger_set_header
syn keyword ngxDirectiveThirdParty contained passenger_show_version_in_header
syn keyword ngxDirectiveThirdParty contained passenger_socket_backlog
syn keyword ngxDirectiveThirdParty contained passenger_spawn_method
syn keyword ngxDirectiveThirdParty contained passenger_start_timeout
syn keyword ngxDirectiveThirdParty contained passenger_startup_file
syn keyword ngxDirectiveThirdParty contained passenger_stat_throttle_rate
syn keyword ngxDirectiveThirdParty contained passenger_sticky_sessions
syn keyword ngxDirectiveThirdParty contained passenger_sticky_sessions_cookie_name
syn keyword ngxDirectiveThirdParty contained passenger_thread_count
syn keyword ngxDirectiveThirdParty contained passenger_turbocaching
syn keyword ngxDirectiveThirdParty contained passenger_user
syn keyword ngxDirectiveThirdParty contained passenger_user_switching
syn keyword ngxDirectiveThirdParty contained passenger_vary_turbocache_by_cookie
syn keyword ngxDirectiveThirdPartyDeprecated contained passenger_analytics_log_group
syn keyword ngxDirectiveThirdPartyDeprecated contained passenger_analytics_log_user
syn keyword ngxDirectiveThirdPartyDeprecated contained passenger_debug_log_file
syn keyword ngxDirectiveThirdPartyDeprecated contained passenger_use_global_queue
syn keyword ngxDirectiveThirdPartyDeprecated contained rack_env
syn keyword ngxDirectiveThirdPartyDeprecated contained rails_app_spawner_idle_time
syn keyword ngxDirectiveThirdPartyDeprecated contained rails_env
syn keyword ngxDirectiveThirdPartyDeprecated contained rails_framework_spawner_idle_time
syn keyword ngxDirectiveThirdPartyDeprecated contained rails_spawn_method
syn keyword ngxDirectiveThirdPartyDeprecated contained union_station_filter
syn keyword ngxDirectiveThirdPartyDeprecated contained union_station_gateway_address
syn keyword ngxDirectiveThirdPartyDeprecated contained union_station_gateway_cert
syn keyword ngxDirectiveThirdPartyDeprecated contained union_station_gateway_port
syn keyword ngxDirectiveThirdPartyDeprecated contained union_station_key
syn keyword ngxDirectiveThirdPartyDeprecated contained union_station_proxy_address
syn keyword ngxDirectiveThirdPartyDeprecated contained union_station_support

" NGINX WebDAV missing commands support (PROPFIND & OPTIONS)
" https://github.com/arut/nginx-dav-ext-module
syn keyword ngxDirectiveThirdParty contained dav_ext_methods

" Dynamic Image Transformation Module For nginx
" https://github.com/cubicdaiya/ngx_small_light
syn keyword ngxDirectiveThirdParty contained small_light
syn keyword ngxDirectiveThirdParty contained small_light_buffer
syn keyword ngxDirectiveThirdParty contained small_light_getparam_mode
syn keyword ngxDirectiveThirdParty contained small_light_imlib2_temp_dir
syn keyword ngxDirectiveThirdParty contained small_light_material_dir
syn keyword ngxDirectiveThirdParty contained small_light_pattern_define
syn keyword ngxDirectiveThirdParty contained small_light_radius_max
syn keyword ngxDirectiveThirdParty contained small_light_sigma_max

" nginx load-balancer module implementing ketama consistent hashing
" https://github.com/flygoast/ngx_http_upstream_ketama_chash
syn keyword ngxDirectiveThirdParty contained ketama_chash

" ngx_srcache - Transparent subrequest-based caching layout for arbitrary nginx locations
" https://github.com/openresty/srcache-nginx-module

" Nginx OpenSSL version check at startup
" https://github.com/apcera/nginx-openssl-version
syn keyword ngxDirectiveThirdParty contained openssl_builddate_minimum
syn keyword ngxDirectiveThirdParty contained openssl_version_minimum

" Module for nginx to proxy rtmp using http protocol
" https://github.com/kwojtek/nginx-rtmpt-proxy-module
syn keyword ngxDirectiveThirdParty contained rtmpt_proxy
syn keyword ngxDirectiveThirdParty contained rtmpt_proxy_http_timeout
syn keyword ngxDirectiveThirdParty contained rtmpt_proxy_rtmp_timeout
syn keyword ngxDirectiveThirdParty contained rtmpt_proxy_stat
syn keyword ngxDirectiveThirdParty contained rtmpt_proxy_stylesheet
syn keyword ngxDirectiveThirdParty contained rtmpt_proxy_target

" nginx-ip-blocker
" https://github.com/tmthrgd/nginx-ip-blocker
syn keyword ngxDirectiveThirdParty contained ip_blocker

" LDAP Authentication
" https://github.com/kvspb/nginx-auth-ldap
syn keyword ngxDirectiveThirdParty contained auth_ldap
syn keyword ngxDirectiveThirdParty contained auth_ldap_cache_enabled
syn keyword ngxDirectiveThirdParty contained auth_ldap_cache_expiration_time
syn keyword ngxDirectiveThirdParty contained auth_ldap_cache_size
syn keyword ngxDirectiveThirdParty contained auth_ldap_servers
syn keyword ngxDirectiveThirdParty contained auth_ldap_servers_size
syn keyword ngxDirectiveThirdParty contained ldap_server

" Nginx module that allows the setting of variables to the value of a variety of hashes
" https://github.com/simpl/ngx_http_set_hash
syn keyword ngxDirectiveThirdParty contained set_md5
syn keyword ngxDirectiveThirdParty contained set_md5_upper
syn keyword ngxDirectiveThirdParty contained set_murmur2
syn keyword ngxDirectiveThirdParty contained set_murmur2_upper
syn keyword ngxDirectiveThirdParty contained set_sha1
syn keyword ngxDirectiveThirdParty contained set_sha1_upper

" ngx_redis2 - Nginx upstream module for the Redis 2.0 protocol
" https://github.com/openresty/redis2-nginx-module

" NAXSI is an open-source, high performance, low rules maintenance WAF for NGINX
" https://github.com/nbs-system/naxsi
syn keyword ngxDirectiveThirdParty contained BasicRule
syn keyword ngxDirectiveThirdParty contained CheckRule
syn keyword ngxDirectiveThirdParty contained DeniedUrl
syn keyword ngxDirectiveThirdParty contained LearningMode
syn keyword ngxDirectiveThirdParty contained LibInjectionSql
syn keyword ngxDirectiveThirdParty contained LibInjectionXss
syn keyword ngxDirectiveThirdParty contained MainRule
syn keyword ngxDirectiveThirdParty contained SecRulesDisabled
syn keyword ngxDirectiveThirdParty contained SecRulesEnabled
syn keyword ngxDirectiveThirdParty contained basic_rule
syn keyword ngxDirectiveThirdParty contained check_rule
syn keyword ngxDirectiveThirdParty contained denied_url
syn keyword ngxDirectiveThirdParty contained learning_mode
syn keyword ngxDirectiveThirdParty contained libinjection_sql
syn keyword ngxDirectiveThirdParty contained libinjection_xss
syn keyword ngxDirectiveThirdParty contained main_rule
syn keyword ngxDirectiveThirdParty contained rules_disabled
syn keyword ngxDirectiveThirdParty contained rules_enabled

" Push Stream
" https://github.com/wandenberg/nginx-push-stream-module
syn keyword ngxDirectiveThirdParty contained push_stream_allow_connections_to_events_channel
syn keyword ngxDirectiveThirdParty contained push_stream_allowed_origins
syn keyword ngxDirectiveThirdParty contained push_stream_authorized_channels_only
syn keyword ngxDirectiveThirdParty contained push_stream_channel_deleted_message_text
syn keyword ngxDirectiveThirdParty contained push_stream_channel_inactivity_time
syn keyword ngxDirectiveThirdParty contained push_stream_channel_info_on_publish
syn keyword ngxDirectiveThirdParty contained push_stream_channels_path
syn keyword ngxDirectiveThirdParty contained push_stream_channels_statistics
syn keyword ngxDirectiveThirdParty contained push_stream_events_channel_id
syn keyword ngxDirectiveThirdParty contained push_stream_footer_template
syn keyword ngxDirectiveThirdParty contained push_stream_header_template
syn keyword ngxDirectiveThirdParty contained push_stream_header_template_file
syn keyword ngxDirectiveThirdParty contained push_stream_last_event_id
syn keyword ngxDirectiveThirdParty contained push_stream_last_received_message_tag
syn keyword ngxDirectiveThirdParty contained push_stream_last_received_message_time
syn keyword ngxDirectiveThirdParty contained push_stream_longpolling_connection_ttl
syn keyword ngxDirectiveThirdParty contained push_stream_max_channel_id_length
syn keyword ngxDirectiveThirdParty contained push_stream_max_messages_stored_per_channel
syn keyword ngxDirectiveThirdParty contained push_stream_max_number_of_channels
syn keyword ngxDirectiveThirdParty contained push_stream_max_number_of_wildcard_channels
syn keyword ngxDirectiveThirdParty contained push_stream_max_subscribers_per_channel
syn keyword ngxDirectiveThirdParty contained push_stream_message_template
syn keyword ngxDirectiveThirdParty contained push_stream_message_ttl
syn keyword ngxDirectiveThirdParty contained push_stream_padding_by_user_agent
syn keyword ngxDirectiveThirdParty contained push_stream_ping_message_interval
syn keyword ngxDirectiveThirdParty contained push_stream_ping_message_text
syn keyword ngxDirectiveThirdParty contained push_stream_publisher
syn keyword ngxDirectiveThirdParty contained push_stream_shared_memory_size
syn keyword ngxDirectiveThirdParty contained push_stream_store_messages
syn keyword ngxDirectiveThirdParty contained push_stream_subscriber
syn keyword ngxDirectiveThirdParty contained push_stream_subscriber_connection_ttl
syn keyword ngxDirectiveThirdParty contained push_stream_timeout_with_body
syn keyword ngxDirectiveThirdParty contained push_stream_user_agent
syn keyword ngxDirectiveThirdParty contained push_stream_websocket_allow_publish
syn keyword ngxDirectiveThirdParty contained push_stream_wildcard_channel_max_qtd
syn keyword ngxDirectiveThirdParty contained push_stream_wildcard_channel_prefix

" AWS proxy
" https://github.com/anomalizer/ngx_aws_auth
syn keyword ngxDirectiveThirdParty contained aws_access_key
syn keyword ngxDirectiveThirdParty contained aws_endpoint
syn keyword ngxDirectiveThirdParty contained aws_key_scope
syn keyword ngxDirectiveThirdParty contained aws_s3_bucket
syn keyword ngxDirectiveThirdParty contained aws_sign
syn keyword ngxDirectiveThirdParty contained aws_signing_key

" ngx_postgres is an upstream module that allows nginx to communicate directly with PostgreSQL database
" https://github.com/FRiCKLE/ngx_postgres
syn keyword ngxDirectiveThirdParty contained postgres_connect_timeout
syn keyword ngxDirectiveThirdParty contained postgres_escape
syn keyword ngxDirectiveThirdParty contained postgres_keepalive
syn keyword ngxDirectiveThirdParty contained postgres_output
syn keyword ngxDirectiveThirdParty contained postgres_pass
syn keyword ngxDirectiveThirdParty contained postgres_query
syn keyword ngxDirectiveThirdParty contained postgres_result_timeout
syn keyword ngxDirectiveThirdParty contained postgres_rewrite
syn keyword ngxDirectiveThirdParty contained postgres_server
syn keyword ngxDirectiveThirdParty contained postgres_set


" highlight

hi link ngxComment Comment
hi link ngxVariableString PreProc
hi link ngxBlock Normal
hi link ngxString String

hi link ngxBoolean Boolean
hi link ngxDirectiveBlock Statement
hi link ngxDirectiveImportant Type
hi link ngxDirectiveControl Keyword
hi link ngxDirectiveError Constant
hi link ngxDirectiveDeprecated Error
hi link ngxDirective Identifier
hi link ngxDirectiveThirdParty Special

hi link ngxDirectiveListen Type
hi link ngxListenOptions Keyword

let b:current_syntax = "nginx"
