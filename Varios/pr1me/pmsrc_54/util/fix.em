(defcom fix
    (do_forever
       (fix_buffer)
       (next_buf)
    )
)

(defcom fix_buffer
    (redisplay)
    (mark_whole)
       (fix_var "l2" "device_status")
       (fix_var "l2" "device_type")
       (fix_var "l2" "l3_driver")
       (fix_var "l2" "accounting")
       (fix_var "l2" "ignore_next_eject")
       (fix_var "l2" "suppress_output")
       (fix_var "l2" "print_line_len")
       (fix_var "l2" "pc_mark")
       (fix_var "l2" "mark_size")
       (fix_var "l2" "mark_type")
       (fix_var "l2" "print_mode")
       (fix_var "l2" "print_file_position")
       (fix_var "l2" "paper_pos")
       (fix_var "l2" "first_print_pos")
       (fix_var "l2" "paged_mode_counters")
       (fix_var "l2" "pm_lines_per_page")
       (fix_var "l2" "pm_lines_printed_this_page")
       (fix_var "l2" "pm_last_page_nr_printed")
       (fix_var "l2" "paged_and_nofmt_mode_counters")
       (fix_var "l2" "last_line_nr_printed")
       (fix_var "l2" "total_pages_printed")
       (fix_var "l2" "page_header_line")
       (fix_var "l2" "request_info")
       (fix_var "l2" "pasd_action")
       (fix_var "l2" "pasd_page_count")
       (fix_var "l2" "advance_pc_save")
       (fix_var "l2" "advance_page_count")
       (fix_var "l2" "first_alignment_page")
       (fix_var "l2" "last_alignment_page")
       (fix_var "l2" "line_numbers")
       (fix_var "l2" "no_header")
       (fix_var "l2" "wrap_around_enabled")
       (fix_var "l2" "suppress_accounting")
       (fix_var "l2" "in_align_mode")
       (fix_var "l2" "need_to_realign")
       (fix_var "l2" "quiet")
       (fix_var "l2" "big_letters")
       (fix_var "l2" "maxwidth")
       (fix_var "l2" "firstline")
       (fix_var "l2" "func_implemented")
       (fix_var "l2" "form_characteristics")
       (fix_var "l2" "chars_per_line")
       (fix_var "l2" "lines_per_page")
       (fix_var "l2" "call_status")
       (fix_var "l2" "max_channel_skip")
       (fix_var "l2" "scan_key")
       (fix_var "l2" "pad_char")
       (fix_var "ds" "monitor_uid")
       (fix_var "ds" "device_state")
       (fix_var "ds" "monitors_device_state")
       (fix_var "ds" "device_unit")
       (fix_var "ds" "device_id")
       (fix_var "ds" "initial_kwl")
       (fix_var "ds" "p_device_kwl")
       (fix_var "ds" "device_name")
       (fix_var "ds" "kwl_unit")
       (fix_var "ds" "semaphore")
       (fix_var "ds" "auto_restart")
       (fix_var "ds" "started_by_monitor")
       (fix_var "ds" "pending_kwl_requests")
       (fix_var "ds" "when_to_load")
       (fix_var "ds" "reinit_kwl")
       (fix_var "ds" "kwls_to_load")
       (fix_var "ds" "action_after_eoj")
       (fix_var "ds" "action_when_idle")
       (fix_var "ds" "completion_code")
       (fix_var "ds" "idle_time_limit")
       (fix_var "ds" "ticks_until_timeout")
       (fix_var "ds" "current_request")
       (fix_var "ds" "req_kwp")
       (fix_var "ds" "error_status")
       (fix_var "ds" "error_msgp")
       (fix_var "ds" "status_display")
       (fix_var "ds" "sd_width")
       (fix_var "ds" "sd_lines")
       (fix_var "ds" "sd_display")
       (fix_var "ds" "status_counters")
       (fix_var "ds" "current_page_file_pos")
       (fix_var "ds" "time_of_last_request_call")
       (fix_var "ds" "starting_pc_mark")
       (fix_var "ds" "starting_file_position")
       (fix_var "ds" "total_elapsed_print_time")
       (fix_var "ds" "elapsed_print_time")
       (fix_var "ds" "time_samples")
       (fix_var "ds" "level_2_driver")
       (fix_var "ds" "level_3_driver")
       (fix_var "ds" "user_accounting_proc")
       (fix_var "ds" "need_device_translate")
       (fix_var "ds" "need_file_translate")
       (fix_var "ds" "device_translation_table")
       (fix_var "ds" "file_translation_table")
       (fix_var "ds" "file_units")
       (fix_var "ds" "page_control_unit")
       (fix_var "ds" "print_file_unit")
       (fix_var "ds" "pfbp")
       (fix_var "ds" "pc_status")
       (fix_var "ds" "last_pc_mark")
       (fix_var "ds" "current_pc_mark")
       (fix_var "ds" "last_unique_id")
       (fix_var "ds" "job_characteristics")
       (fix_var "ds" "p_job_kwl")
       (fix_var "ds" "job_id")
       (fix_var "ds" "tranid")
       (fix_var "ds" "unique_id")
       (fix_var "ds" "q_partition")
       (fix_var "ds" "job_name")
       (fix_var "ds" "user_project")
       (fix_var "ds" "user_id")
       (fix_var "ds" "system_id")
       (fix_var "ds" "job_pathname")
       (fix_var "ds" "job_system")
       (fix_var "ds" "file_size")
       (fix_var "ds" "file_size_words")
       (fix_var "ds" "copies")
       (fix_var "ds" "copy_nr")
       (fix_var "ds" "requested")
       (fix_var "ds" "dates")
       (fix_var "ds" "backed_up")
       (fix_var "ds" "deferred")
       (fix_var "ds" "modified_then")
       (fix_var "ds" "modified_now")
       (fix_var "ds" "spooled")
       (fix_var "ds" "started")
       (fix_var "ds" "copyfile")
       (fix_var "ds" "inuse_ok")
       (fix_var "ds" "parallel_ok")
       (fix_var "ds" "resume_ok")
       (fix_var "ds" "delete_user_file")
       (fix_var "ds" "notify_user")
       (fix_var "ds" "notify_now")
       (fix_var "mon" "system_list_size")
       (fix_var "mon" "system_list")
       (fix_var "mon" "my_system_index")
       (fix_var "mon" "master_system_id")
       (fix_var "mon" "masters_uid")
       (fix_var "mon" "my_disks")
       (fix_var "mon" "disk_entry")
       (fix_var "mon" "disk_name")
       (fix_var "mon" "system_name")
       (fix_var "mon" "need_fast_scan")
       (fix_var "mon" "scan_quadsecs")
       (fix_var "mon" "monitor_bol")
       (fix_var "mon" "device_bol")
       (fix_var "mon" "job_bol")
       (fix_var "gbl" "using_debugger")
       (fix_var "gbl" "trace_on")
       (fix_var "gbl" "sswitch")
       (fix_var "gbl" "I_am_master")
       (fix_var "gbl" "I_am_monitor")
       (fix_var "gbl" "I_am_user")
       (fix_var "gbl" "I_am_device")
       (fix_var "gbl" "I_am_opr")
       (fix_var "gbl" "command_file_active")
       (fix_var "gbl" "in_grace_period")
       (fix_var "gbl" "user_inited")
       (fix_var "gbl" "system_condition_signalled")
       (fix_var "gbl" "abort_label_set")
       (fix_var "gbl" "abort_label")
       (fix_var "gbl" "psv_address_pointer")
       (fix_var "gbl" "prev_ticks_since_midnight")
       (fix_var "gbl" "prev_ticks_returned")
       (fix_var "gbl" "my_login_time")
       (fix_var "gbl" "my_user_nr")
       (fix_var "gbl" "full_id")
       (fix_var "gbl" "version")
       (fix_var "gbl" "my_user_id")
       (fix_var "gbl" "group_count")
       (fix_var "gbl" "my_groups")
       (fix_var "gbl" "my_project_id")
       (fix_var "gbl" "my_id")
       (fix_var "psv" "monitor_user")
       (fix_var "psv" "system_inited")
       (fix_var "psv" "network_exists")
       (fix_var "psv" "network_started")
       (fix_var "psv" "monitor_semaphore")
       (fix_var "psv" "area_semaphore")
       (fix_var "psv" "primenet_port")
       (fix_var "psv" "ticks_per_sec")
       (fix_var "psv" "time_limit")
       (fix_var "psv" "my_system_id")
       (fix_var "psv" "my_node_nr")
       (fix_var "psv" "rev_modifier")
       (fix_var "psv" "system_partition")
       (fix_var "psv" "monitor_uid")
       (fix_var "psv" "copyright_counter")
       (fix_var "psv" "date_inited")
       (fix_var "psv" "expiration_date")
       (fix_var "psv" "shared_area")
       (fix_var "psv" "shared_area_owner")
       (fix_var "psv" "time_area_locked")
       (fix_var "psv" "master_kwf_date")
       (fix_var "psv" "master_kwl")
       (fix_var "psv" "internal_kwl")
       (fix_var "psv" "old_master_kwl")
       (fix_var "psv" "old_internal_kwl")
       (fix_var "psv" "user_msg_bol")
       (fix_var "psv" "user_msg_eol")
       (fix_var "psv" "suppress_copyright")
       (fix_var "psv" "debug_scheduler")
       (fix_var "psv" "primos_error_table")
       (fix_var "psv" "begin_shared_area")
       (fix_var "comm" "receive_list_bol")
       (fix_var "comm" "receive_list_eol")
       (fix_var "comm" "cb_list")
       (fix_var "comm" "buffer_bol")
       (fix_var "comm" "buffer_eol")
       (fix_var "err$es" "warning")
       (fix_var "err$es" "type")
       (fix_var "err$es" "status1")
       (fix_var "err$es" "status2")
       (fix_var "err$es" "clearing_codes")
       (fix_var "err$es" "ccode")
       (fix_var "err$es" "cdiag")
       (fix_var "err$es" "subr")
       (fix_var "err$es" "system_message")
       (fix_var "err$es" "user_message")
       (fix_var "kwl" "kwl_info_bits")
       (fix_var "kwl" "in_edit_kwl")
       (fix_var "kwl" "check_wp_from_ikwl_only")
       (fix_var "kwl" "master_kwl_not_found_printed")
)

(defun fix_var ((prefix string) (var string))
    (move_top)
    (do_forever
       (if (& (forward_search var) (^ (looking_at "_")))
           (back_word)
           (if (looking_at var)
              (if (^ (| (looked_at ".") (looked_at "$")))
                  (if (fix_query prefix)
                      (insert (catenate prefix "."))
                      (redisplay)
                  else
                      (forward_word)
                  )
              else
                  (forward_word)
              )
           else
              (forward_word)
           )
       else
         (stop_doing)
    )
)

(defun fix_query ((prefix string) &local (ch character) &returns boolean)
     (info_message (catenate "Fix with prefix " prefix "?"))
     (setq ch (read_character))
     (info_message "")
     (if (= ch "y") (return true)
     else
         (if (= ch "n") (return false)
         else
             (if (= ch "")
                 (abort_command)
             else
                (send_raw_string "")
                (fix_query prefix)
             )
         )
     )
)