
select
  to_char(ALLTABLES.period_start_time,'yyyy/mm/dd') period_start_time,
  nvl(plmn.co_name, nvl(plmn.co_object_instance,  'NN('||plmn.co_gid||')')) "PLMN Name",
  --ALLTABLES.plmn_gid, 
  --nvl(plmn.co_ext_dn, plmn.co_dn) "DN",
  round(to_number(100*decode( (lcelav2.denom_cell_avail),0,null, (lcelav2.samples_cell_avail) / (lcelav2.denom_cell_avail))),2) LTE_5750a,
  round(to_number(100*decode( (lcelav2.denom_cell_avail - lcelav2.samples_cell_plan_unavail),0,null, (lcelav2.samples_cell_avail) / (lcelav2.denom_cell_avail - lcelav2.samples_cell_plan_unavail))),2) LTE_5239a,
  to_number((lcelld2.rach_stp_att_small_msg + lcelld2.rach_stp_att_large_msg + lcelld2.rach_stp_att_dedicated)) LTE_1072a,
  round(to_number(100*decode( (lcelld2.rach_stp_att_small_msg + lcelld2.rach_stp_att_large_msg + lcelld2.rach_stp_att_dedicated),0,null, lcelld2.rach_stp_completions / (lcelld2.rach_stp_att_small_msg + lcelld2.rach_stp_att_large_msg + lcelld2.rach_stp_att_dedicated))),2) LTE_5569a,
  round(to_number(100*decode( (lcelld2.rach_stp_att_small_msg + lcelld2.rach_stp_att_large_msg),0,null, lmac2.rach_msg3_contention / (lcelld2.rach_stp_att_small_msg + lcelld2.rach_stp_att_large_msg))),2) LTE_5670a,
  round(to_number((luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol)),2) LTE_753c,
  round(to_number(100*decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_del_tol,0)),0,null, luest2.sign_conn_estab_comp / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_del_tol,0)))),2) LTE_5218f,
  to_number((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0))) LTE_5219b,
  round(to_number(decode( luest2.enb_init_to_idle_norm_rel +luest2.enb_init_to_idle_other +luest2.enb_init_to_idle_rnl +luest2.epc_init_to_idle_detach +luest2.epc_init_to_idle_other +luest2.epc_init_to_idle_rnl +luest2.epc_init_to_idle_ue_norm_rel +nvl(luest2.pre_empt_ue_context_non_gbr,0),0,null, 100*(luest2.enb_init_to_idle_norm_rel +luest2.epc_init_to_idle_detach +luest2.epc_init_to_idle_ue_norm_rel +nvl(luest2.pre_empt_ue_context_non_gbr,0)) / (luest2.enb_init_to_idle_norm_rel +luest2.enb_init_to_idle_other +luest2.enb_init_to_idle_rnl +luest2.epc_init_to_idle_detach +luest2.epc_init_to_idle_other +luest2.epc_init_to_idle_rnl +luest2.epc_init_to_idle_ue_norm_rel +nvl(luest2.pre_empt_ue_context_non_gbr,0)))),2) LTE_5220b,
  round(to_number(100*decode( lrrc2.rrc_con_re_estab_att,0,null, lrrc2.rrc_con_re_estab_succ / lrrc2.rrc_con_re_estab_att)),2) LTE_5143a,
  to_number((lrrc2.rrc_con_re_estab_att)) LTE_1077a,
  to_number(lrdb2.data_rb_stp_att) LTE_5116a,
  round(to_number(100*decode( (lrdb2.data_rb_stp_att),0,null, (lrdb2.data_rb_stp_comp) / (lrdb2.data_rb_stp_att))),2) LTE_5003a,
  round(to_number(100 - 100*decode( (nvl((lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_succ + lepsb2.erab_rel_ho_part),0) + nvl(lepsb2.erab_rel_epc_path_switch,0) + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth),0,null, (nvl((lepsb2.erab_rel_ho_part + lepsb2.erab_rel_enb - lepsb2.erab_rel_enb_rnl_ina - lepsb2.erab_rel_enb_rnl_red - lepsb2.erab_rel_enb_rnl_rrna + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0)),0) ) / (nvl((lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_succ + lepsb2.erab_rel_ho_part),0) + nvl(lepsb2.erab_rel_epc_path_switch,0) + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth))),2) LTE_5117c,
  to_number(lepsb2.eps_bearer_setup_attempts) LTE_5118a,
  round(to_number(100*decode( (lepsb2.eps_bearer_setup_attempts),0,null, (lepsb2.eps_bearer_setup_completions) / (lepsb2.eps_bearer_setup_attempts))),2) LTE_5017a,
  round(to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_ina + lepsb2.erab_rel_enb_rnl_red + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))),2) LTE_5023g,
  round(to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_ina + lepsb2.erab_rel_enb_rnl_red + lepsb2.erab_rel_enb_rnl_rrna + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0)) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))),2) LTE_5024g,
  round(to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_ho_part + lepsb2.erab_rel_enb - lepsb2.erab_rel_enb_rnl_ina - lepsb2.erab_rel_enb_rnl_red - lepsb2.erab_rel_enb_rnl_rrna - nvl(lepsb2.erab_rel_temp_qci1,0)) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))),2) LTE_5025g,
  round(to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.erab_rel_enb_rnl_rrna / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))),2) LTE_5587e,
  to_number(nvl(lepsb2.erab_ini_setup_att_qci2,0) + nvl(lepsb2.erab_add_setup_att_qci2,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_2,0)) LTE_5550b,
  to_number(nvl(lepsb2.erab_ini_setup_att_qci3,0) + nvl(lepsb2.erab_add_setup_att_qci3,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_3,0)) LTE_5551b,
  to_number(nvl(lepsb2.erab_ini_setup_att_qci4,0) + nvl(lepsb2.erab_add_setup_att_qci4,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_4,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_4,0)) LTE_5552b,
  to_number((lepsb2.erab_ini_setup_att_qci5 + lepsb2.erab_add_setup_att_qci5)) LTE_5641a,
  to_number((lepsb2.erab_ini_setup_att_qci6 + lepsb2.erab_add_setup_att_qci6)) LTE_5642a,
  to_number((lepsb2.erab_ini_setup_att_qci7 + lepsb2.erab_add_setup_att_qci7)) LTE_5643a,
  to_number((lepsb2.erab_ini_setup_att_qci8 + lepsb2.erab_add_setup_att_qci8)) LTE_5644a,
  to_number((lepsb2.erab_ini_setup_att_qci9 + lepsb2.erab_add_setup_att_qci9)) LTE_5645a,
  round(to_number(100*decode( (nvl(lepsb2.erab_ini_setup_att_qci2,0) + nvl(lepsb2.erab_add_setup_att_qci2,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_2,0)) ,0,null, (nvl(lepsb2.erab_ini_setup_succ_qci2,0) + nvl(lepsb2.erab_add_setup_succ_qci2,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_com_add_qci_2,0)) / (nvl(lepsb2.erab_ini_setup_att_qci2,0) + nvl(lepsb2.erab_add_setup_att_qci2,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_2,0)))),2) LTE_5553b,
  round(to_number(100*decode( (nvl(lepsb2.erab_ini_setup_att_qci3,0) + nvl(lepsb2.erab_add_setup_att_qci3,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_3,0)) ,0,null, (nvl(lepsb2.erab_ini_setup_succ_qci3,0) + nvl(lepsb2.erab_add_setup_succ_qci3,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_com_add_qci_3,0)) / (nvl(lepsb2.erab_ini_setup_att_qci3,0) + nvl(lepsb2.erab_add_setup_att_qci3,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_3,0)))),2) LTE_5554b,
  round(to_number(100*decode( (nvl(lepsb2.erab_ini_setup_att_qci4,0) + nvl(lepsb2.erab_add_setup_att_qci4,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_4,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_4,0)) ,0,null, (nvl(lepsb2.erab_ini_setup_succ_qci4,0) + nvl(lepsb2.erab_add_setup_succ_qci4,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_4,0) + nvl(lepsb2.eps_bearer_stp_com_add_qci_4,0)) / (nvl(lepsb2.erab_ini_setup_att_qci4,0) + nvl(lepsb2.erab_add_setup_att_qci4,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_4,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_4,0)))),2) LTE_5555b,
  round(to_number(100*decode( (lepsb2.erab_ini_setup_att_qci5 + lepsb2.erab_add_setup_att_qci5),0,null, (lepsb2.erab_ini_setup_succ_qci5 + lepsb2.erab_add_setup_succ_qci5) / (lepsb2.erab_ini_setup_att_qci5 + lepsb2.erab_add_setup_att_qci5))),2) LTE_5646a,
  round(to_number(100*decode( (lepsb2.erab_ini_setup_att_qci6 + lepsb2.erab_add_setup_att_qci6),0,null, (lepsb2.erab_ini_setup_succ_qci6 + lepsb2.erab_add_setup_succ_qci6) / (lepsb2.erab_ini_setup_att_qci6 + lepsb2.erab_add_setup_att_qci6))),2) LTE_5647a,
  round(to_number(100*decode( (lepsb2.erab_ini_setup_att_qci7 + lepsb2.erab_add_setup_att_qci7),0,null, (lepsb2.erab_ini_setup_succ_qci7 + lepsb2.erab_add_setup_succ_qci7) / (lepsb2.erab_ini_setup_att_qci7 + lepsb2.erab_add_setup_att_qci7))),2) LTE_5648a,
  round(to_number(100*decode( (lepsb2.erab_ini_setup_att_qci8 + lepsb2.erab_add_setup_att_qci8),0,null, (lepsb2.erab_ini_setup_succ_qci8 + lepsb2.erab_add_setup_succ_qci8) / (lepsb2.erab_ini_setup_att_qci8 + lepsb2.erab_add_setup_att_qci8))),2) LTE_5649a,
  round(to_number(100*decode( (lepsb2.erab_ini_setup_att_qci9 + lepsb2.erab_add_setup_att_qci9),0,null, (lepsb2.erab_ini_setup_succ_qci9 + lepsb2.erab_add_setup_succ_qci9) / (lepsb2.erab_ini_setup_att_qci9 + lepsb2.erab_add_setup_att_qci9))),2) LTE_5650a,
  round(to_number(100*(decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_del_tol,0) + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg),0,null, luest2.sign_conn_estab_comp / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_del_tol,0) + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg))) * (decode(luest2.s1_sign_conn_estab_att_ue,0,null,null,1, luest2.s1_sign_conn_estab_succ_ue / luest2.s1_sign_conn_estab_att_ue)) * (decode( (nvl(lepsb2.erab_ini_setup_att_qci1,0) + nvl(lepsb2.erab_ini_setup_att_qci2,0) + nvl(lepsb2.erab_ini_setup_att_qci3,0) + nvl(lepsb2.erab_ini_setup_att_qci4,0) + nvl(lepsb2.erab_ini_setup_att_qci5,0) + nvl(lepsb2.erab_ini_setup_att_qci6,0) + nvl(lepsb2.erab_ini_setup_att_qci7,0) + nvl(lepsb2.erab_ini_setup_att_qci8,0) + nvl(lepsb2.erab_ini_setup_att_qci9,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_1,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_4,0) + nvl(lepsb2.eps_bear_stp_att_ini_non_gbr,0)) ,0,null, (nvl(lepsb2.erab_ini_setup_succ_qci1,0) + nvl(lepsb2.erab_ini_setup_succ_qci2,0) + nvl(lepsb2.erab_ini_setup_succ_qci3,0) + nvl(lepsb2.erab_ini_setup_succ_qci4,0) + nvl(lepsb2.erab_ini_setup_succ_qci5,0) + nvl(lepsb2.erab_ini_setup_succ_qci6,0) + nvl(lepsb2.erab_ini_setup_succ_qci7,0) + nvl(lepsb2.erab_ini_setup_succ_qci8,0) + nvl(lepsb2.erab_ini_setup_succ_qci9,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci1,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_4,0) + nvl(lepsb2.eps_bear_stp_com_ini_non_gbr,0)) / (nvl(lepsb2.erab_ini_setup_att_qci1,0) + nvl(lepsb2.erab_ini_setup_att_qci2,0) + nvl(lepsb2.erab_ini_setup_att_qci3,0) + nvl(lepsb2.erab_ini_setup_att_qci4,0) + nvl(lepsb2.erab_ini_setup_att_qci5,0) + nvl(lepsb2.erab_ini_setup_att_qci6,0) + nvl(lepsb2.erab_ini_setup_att_qci7,0) + nvl(lepsb2.erab_ini_setup_att_qci8,0) + nvl(lepsb2.erab_ini_setup_att_qci9,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_1,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_4,0) + nvl(lepsb2.eps_bear_stp_att_ini_non_gbr,0))))),2) LTE_5060i,
  round(to_number(100*(decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + luest2.sign_conn_estab_att_del_tol + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_emg),0,null, luest2.sign_conn_estab_comp / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + luest2.sign_conn_estab_att_del_tol + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_emg)))*(decode( luest2.s1_sign_conn_estab_att_ue,0,null, luest2.s1_sign_conn_estab_succ_ue / luest2.s1_sign_conn_estab_att_ue))*(decode( (lepsb2.erab_ini_setup_att_qci1 + lepsb2.erab_ini_setup_att_qci2 + lepsb2.erab_ini_setup_att_qci3 + lepsb2.erab_ini_setup_att_qci4 + lepsb2.erab_ini_setup_att_qci5 + lepsb2.erab_ini_setup_att_qci6 + lepsb2.erab_ini_setup_att_qci7 + lepsb2.erab_ini_setup_att_qci8 + lepsb2.erab_ini_setup_att_qci9),0,null, (lepsb2.erab_ini_setup_succ_qci1 + lepsb2.erab_ini_setup_succ_qci2 + lepsb2.erab_ini_setup_succ_qci3 + lepsb2.erab_ini_setup_succ_qci4 + lepsb2.erab_ini_setup_succ_qci5 + lepsb2.erab_ini_setup_succ_qci6 + lepsb2.erab_ini_setup_succ_qci7 + lepsb2.erab_ini_setup_succ_qci8 + lepsb2.erab_ini_setup_succ_qci9) / (lepsb2.erab_ini_setup_att_qci1 + lepsb2.erab_ini_setup_att_qci2 + lepsb2.erab_ini_setup_att_qci3 + lepsb2.erab_ini_setup_att_qci4 + lepsb2.erab_ini_setup_att_qci5 + lepsb2.erab_ini_setup_att_qci6 + lepsb2.erab_ini_setup_att_qci7 + lepsb2.erab_ini_setup_att_qci8 + lepsb2.erab_ini_setup_att_qci9)))*(decode( (lepsb2.erab_add_setup_att_qci1 + lepsb2.erab_add_setup_att_qci2 + lepsb2.erab_add_setup_att_qci3 + lepsb2.erab_add_setup_att_qci4 + lepsb2.erab_add_setup_att_qci5 + lepsb2.erab_add_setup_att_qci6 + lepsb2.erab_add_setup_att_qci7 + lepsb2.erab_add_setup_att_qci8 + lepsb2.erab_add_setup_att_qci9),0,null, (lepsb2.erab_add_setup_succ_qci1 + lepsb2.erab_add_setup_succ_qci2 + lepsb2.erab_add_setup_succ_qci3 + lepsb2.erab_add_setup_succ_qci4 + lepsb2.erab_add_setup_succ_qci5 + lepsb2.erab_add_setup_succ_qci6 + lepsb2.erab_add_setup_succ_qci7 + lepsb2.erab_add_setup_succ_qci8 + lepsb2.erab_add_setup_succ_qci9 - nvl(lepsb2.erab_rel_temp_qci1,0)) / (lepsb2.erab_add_setup_att_qci1 + lepsb2.erab_add_setup_att_qci2 + lepsb2.erab_add_setup_att_qci3 + lepsb2.erab_add_setup_att_qci4 + lepsb2.erab_add_setup_att_qci5 + lepsb2.erab_add_setup_att_qci6 + lepsb2.erab_add_setup_att_qci7 + lepsb2.erab_add_setup_att_qci8 + lepsb2.erab_add_setup_att_qci9)))),2) LTE_5574f,
  to_number(nvl(lepsb2.erab_add_setup_att_qci1,0) + nvl(lepsb2.erab_add_setup_att_qci2,0) + nvl(lepsb2.erab_add_setup_att_qci3,0) + nvl(lepsb2.erab_add_setup_att_qci4,0) + nvl(lepsb2.erab_add_setup_att_qci5,0) + nvl(lepsb2.erab_add_setup_att_qci6,0) + nvl(lepsb2.erab_add_setup_att_qci7,0) + nvl(lepsb2.erab_add_setup_att_qci8,0) + nvl(lepsb2.erab_add_setup_att_qci9,0) + nvl((lepsb2.eps_bearer_setup_attempts - lepsb2.eps_bearer_stp_att_ini_qci_1 - lepsb2.eps_bearer_stp_att_ini_qci_2 - lepsb2.eps_bearer_stp_att_ini_qci_3 - lepsb2.eps_bearer_stp_att_ini_qci_4 - lepsb2.eps_bear_stp_att_ini_non_gbr - (nvl(lepsb2.erab_add_setup_att_qci1,0) + nvl(lepsb2.erab_add_setup_att_qci2,0) + nvl(lepsb2.erab_add_setup_att_qci3,0) + nvl(lepsb2.erab_add_setup_att_qci4,0) + nvl(lepsb2.erab_add_setup_att_qci5,0) + nvl(lepsb2.erab_add_setup_att_qci6,0) + nvl(lepsb2.erab_add_setup_att_qci7,0) + nvl(lepsb2.erab_add_setup_att_qci8,0) + nvl(lepsb2.erab_add_setup_att_qci9,0))),0)) LTE_1094b,
  to_number(1000000000*decode( (lcellt2.pdcp_sdu_vol_ul + lcellt2.pdcp_sdu_vol_dl),0,null, (lepsb2.erab_rel_ho_part + lepsb2.erab_rel_enb - lepsb2.erab_rel_enb_rnl_ina - lepsb2.erab_rel_enb_rnl_red - lepsb2.erab_rel_enb_rnl_rrna + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)) / (lcellt2.pdcp_sdu_vol_ul + lcellt2.pdcp_sdu_vol_dl))) LTE_5812d,
  round(to_number((lepsb2.ERAB_IN_SESSION_TIME_QCI1 + lepsb2.ERAB_IN_SESSION_TIME_QCI2 + lepsb2.ERAB_IN_SESSION_TIME_QCI3 + lepsb2.ERAB_IN_SESSION_TIME_QCI4 + lepsb2.ERAB_IN_SESSION_TIME_NON_GBR)/60),2) LTE_5575a,
  to_number(lepsb2.ERAB_IN_SESSION_TIME_QCI2 /60) LTE_5577a,
  to_number(lepsb2.ERAB_IN_SESSION_TIME_QCI3 / 60) LTE_5578a,
  to_number(lepsb2.ERAB_IN_SESSION_TIME_QCI4 / 60) LTE_5579a,
  to_number(lepsb2.ERAB_IN_SESSION_TIME_NON_GBR / 60) LTE_5580a,
  round(to_number(decode( (decode( (60*60),0,null, (lepsb2.erab_in_session_time_qci1 + lepsb2.erab_in_session_time_qci2 + lepsb2.erab_in_session_time_qci3 + lepsb2.erab_in_session_time_qci4 + lepsb2.erab_in_session_time_non_gbr) / (60*60))),0,null, (lepsb2.erab_rel_enb_act_qci1 + lepsb2.erab_rel_enb_act_qci2 + lepsb2.erab_rel_enb_act_qci3 + lepsb2.erab_rel_enb_act_qci4 + lepsb2.erab_rel_enb_act_non_gbr) / (decode( (60*60),0,null, (lepsb2.erab_in_session_time_qci1 + lepsb2.erab_in_session_time_qci2 + lepsb2.erab_in_session_time_qci3 + lepsb2.erab_in_session_time_qci4 + lepsb2.erab_in_session_time_non_gbr) / (60*60))))),2) LTE_5581b,
  round(to_number(decode( (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci2 / (60*60))),0,null, lepsb2.erab_rel_enb_act_qci2 / (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci2 / (60*60))))),2) LTE_5583b,
  to_number(decode( (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci3 / (60*60))),0,null, lepsb2.erab_rel_enb_act_qci3 / (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci3 / (60*60))))) LTE_5584b,
  to_number(decode( (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci4 / (60*60))),0,null, lepsb2.erab_rel_enb_act_qci4 / (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci4 / (60*60))))) LTE_5585b,
  round(to_number(decode( (decode( (60*60),0,null, lepsb2.erab_in_session_time_non_gbr / (60*60))),0,null, lepsb2.erab_rel_enb_act_non_gbr / (decode( (60*60),0,null, lepsb2.erab_in_session_time_non_gbr / (60*60))))),2) LTE_5586b,
  to_number(nvl(lepsb2.erab_ini_setup_att_qci1,0) + nvl(lepsb2.erab_add_setup_att_qci1,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_1,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_1,0)) LTE_5205b,
  round(to_number(100*decode( (lepsb2.erab_ini_setup_att_qci1 + lepsb2.erab_add_setup_att_qci1),0,null, (lepsb2.erab_ini_setup_succ_qci1 + lepsb2.erab_add_setup_succ_qci1 - nvl(lepsb2.erab_rel_temp_qci1,0)) / (lepsb2.erab_ini_setup_att_qci1 + lepsb2.erab_add_setup_att_qci1))),2) LTE_5204c,
  round(to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_ho_part_qci1 + lepsb2.erab_rel_enb_qci1 - lepsb2.erab_rel_enb_rnl_ina_qci1 - lepsb2.erab_rel_enb_rnl_red_qci1 - lepsb2.erab_rel_enb_rnl_rrna_qci1 - nvl(lepsb2.erab_rel_temp_qci1,0)) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))),2) LTE_5572d,
  round(to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.erab_rel_enb_act_qci1 / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))),2) LTE_5571e,
  round(to_number(100*decode( (lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_ina_qci1 + lepsb2.erab_rel_enb_rnl_red_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1) / (lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))),2) LTE_5209d,
  round(to_number(lepsb2.ERAB_IN_SESSION_TIME_QCI1 / 60),2) LTE_5576a,
  to_number(decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_in_session_time_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_1153d,
  round(to_number((lepsb2.erab_in_session_time_qci1) / (60*60)),2) LTE_1067c,
  round(to_number(decode( (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci1 / (60*60))),0,null, lepsb2.erab_rel_enb_act_qci1 / (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci1 / (60*60))))),2) LTE_5582b,
  round(to_number(objcount.lncel_count* (nvl(lueq_ext.ue_drb_buf_dl_data_qci_1/100,0) + nvl(lcelld2.ue_drb_dl_data_qci_1/100,0))),2) LTE_5805d,
  round(to_number(objcount.lncel_count* (nvl(lueq_ext.ue_drb_buf_ul_data_qci_1/100,0) + nvl(lcelld2.ue_drb_ul_data_qci_1/100,0))),2) LTE_5807d,
  round(to_number(lcelld2.pdcp_ret_dl_del_mean_qci_1),2) LTE_5138a,
  round(to_number(lcellt2.pdcp_sdu_vol_dl/1000000),3) LTE_5212a,
  round(to_number(lcellt2.pdcp_sdu_vol_ul/ 1000000),3) LTE_5213a,
  round(to_number(8*decode( lcellt2.active_tti_ul,0,null, lcellt_ext2.pdcp_sdu_vol_ul / lcellt2.active_tti_ul)),3) LTE_5289d,
  round(to_number(8*decode( lcellt2.active_tti_dl,0,null, lcellt_ext2.pdcp_sdu_vol_dl / lcellt2.active_tti_dl)),3) LTE_5292d,
  round(to_number(lcellt2.pdcp_data_rate_max_dl),3) LTE_291b,
  round(to_number(lcellt2.pdcp_data_rate_max_ul),3) LTE_288b,
  round(to_number(lcellt2.pdcp_data_rate_mean_dl_qci_1),3) LTE_5293c,
  round(to_number(lcellt2.pdcp_data_rate_mean_ul_qci_1),3) LTE_5294c,
  round(to_number(decode( lcellt2.ip_tput_time_dl_qci_5,0,null, lcellt2.ip_tput_vol_dl_qci_5 / lcellt2.ip_tput_time_dl_qci_5)),3) LTE_5354a,
  round(to_number(decode( (1000*1000),0,null, (lcellt2.ip_tput_vol_dl_qci_5/8) / (1000*1000))),3) LTE_1319b,
  round(to_number(decode( lcellt2.ip_tput_time_dl_qci_6,0,null, lcellt2.ip_tput_vol_dl_qci_6 / lcellt2.ip_tput_time_dl_qci_6)),3) LTE_5355a,
  round(to_number(decode( (1000*1000),0,null, (lcellt2.ip_tput_vol_dl_qci_6/8) / (1000*1000))),3) LTE_1320b,
  round(to_number(decode( lcellt2.ip_tput_time_dl_qci_7,0,null, lcellt2.ip_tput_vol_dl_qci_7 / lcellt2.ip_tput_time_dl_qci_7)),3) LTE_5356a,
  round(to_number(decode( (1000*1000),0,null, (lcellt2.ip_tput_vol_dl_qci_7/8) / (1000*1000))),3) LTE_1321b,
  round(to_number(decode( lcellt2.ip_tput_time_dl_qci_8,0,null, lcellt2.ip_tput_vol_dl_qci_8 / lcellt2.ip_tput_time_dl_qci_8)),3) LTE_5357a,
  round(to_number(decode( (1000*1000),0,null, (lcellt2.ip_tput_vol_dl_qci_8/8) / (1000*1000))),3) LTE_1322b,
  round(to_number(decode( lcellt2.ip_tput_time_dl_qci_9,0,null, lcellt2.ip_tput_vol_dl_qci_9 / lcellt2.ip_tput_time_dl_qci_9)),3) LTE_5358a,
  round(to_number(decode( (1000*1000),0,null, (lcellt2.ip_tput_vol_dl_qci_9/8) / (1000*1000))),3) LTE_1323b,
  round(to_number(decode( lcellt2.ip_tput_time_ul_qci_5,0,null, lcellt2.ip_tput_vol_ul_qci_5 / lcellt2.ip_tput_time_ul_qci_5)),3) LTE_5363a,
  round(to_number(decode( (1000*1000),0,null, (lcellt2.ip_tput_vol_ul_qci_5/8) / (1000*1000))),3) LTE_1328b,
  round(to_number(decode( lcellt2.ip_tput_time_ul_qci_6,0,null, lcellt2.ip_tput_vol_ul_qci_6 / lcellt2.ip_tput_time_ul_qci_6)),3) LTE_5364a,
  round(to_number(decode( (1000*1000),0,null, (lcellt2.ip_tput_vol_ul_qci_6/8) / (1000*1000))),3) LTE_1329b,
  round(to_number(decode( lcellt2.ip_tput_time_ul_qci_7,0,null, lcellt2.ip_tput_vol_ul_qci_7 / lcellt2.ip_tput_time_ul_qci_7)),3) LTE_5365a,
  round(to_number(decode( (1000*1000),0,null, (lcellt2.ip_tput_vol_ul_qci_7/8) / (1000*1000))),3) LTE_1330b,
  round(to_number(decode( lcellt2.ip_tput_time_ul_qci_8,0,null, lcellt2.ip_tput_vol_ul_qci_8 / lcellt2.ip_tput_time_ul_qci_8)),3) LTE_5366a,
  round(to_number(decode( (1000*1000),0,null, (lcellt2.ip_tput_vol_ul_qci_8/8) / (1000*1000))),3) LTE_1331b,
  round(to_number(decode( lcellt2.ip_tput_time_ul_qci_9,0,null, lcellt2.ip_tput_vol_ul_qci_9 / lcellt2.ip_tput_time_ul_qci_9)),3) LTE_5367a,
  round(to_number(decode( (1000*1000),0,null, (lcellt2.ip_tput_vol_ul_qci_9/8) / (1000*1000))),3) LTE_1332b,
  round(to_number((lcellr2.ul_prb_util_tti_mean/10)),1) LTE_5273b,
  round(to_number((lcellr2.dl_prb_util_tti_mean/10)),1) LTE_5276b,
  round(to_number(8*decode(lcellr2.prb_used_pdsch,0,NULL, (lcellt2.pdcp_sdu_vol_dl / lcellr2.prb_used_pdsch / 180))),2) LTE_5747a,
  round(to_number(8*decode(lcellr2.prb_used_pusch,0,NULL, (lcellt2.pdcp_sdu_vol_ul / lcellr2.prb_used_pusch / 180))),2) LTE_5748a,
  round(to_number(100*decode( (lianbho2.intra_enb_ho_prep),0,null, (lianbho2.succ_intra_enb_ho) / (lianbho2.intra_enb_ho_prep))),2) LTE_5043a,
  to_number(lianbho2.att_intra_enb_ho) LTE_5124a,
  round(to_number(100*decode( (lianbho2.att_intra_enb_ho),0,null, (lianbho2.succ_intra_enb_ho) / (lianbho2.att_intra_enb_ho))),2) LTE_5035a,
  to_number(lianbho2.intra_enb_ho_prep) LTE_5123a,
  round(to_number(100*decode( (lianbho2.intra_enb_ho_prep),0,null, (lianbho2.att_intra_enb_ho) / (lianbho2.intra_enb_ho_prep))),2) LTE_5036a,
  round(to_number(100*decode( (lienbho2.inter_enb_ho_prep - lienbho2.inter_x2_lb_prep_fail_ac),0,null, lienbho2.succ_inter_enb_ho / (lienbho2.inter_enb_ho_prep - lienbho2.inter_x2_lb_prep_fail_ac))),2) LTE_5058c,
  to_number(lienbho2.att_inter_enb_ho) LTE_5125a,
  round(to_number(100*decode( lienbho2.att_inter_enb_ho,0,null, lienbho2.succ_inter_enb_ho / lienbho2.att_inter_enb_ho)),2) LTE_5048b,
  to_number(lienbho2.inter_enb_ho_prep) LTE_5126a,
  round(to_number(100*decode( (lienbho2.inter_enb_ho_prep - lienbho2.inter_x2_lb_prep_fail_ac),0,null, lienbho2.att_inter_enb_ho / (lienbho2.inter_enb_ho_prep - lienbho2.inter_x2_lb_prep_fail_ac))),2) LTE_5049c,
  round(to_number(100*decode( (lienbho2.inter_enb_s1_ho_prep - nvl(lienbho2.inter_s1_lb_prep_fail_ac,0)),0,null, lienbho2.inter_enb_s1_ho_succ / (lienbho2.inter_enb_s1_ho_prep - nvl(lienbho2.inter_s1_lb_prep_fail_ac,0)))),2) LTE_5084b,
  to_number(lienbho2.inter_enb_s1_ho_att) LTE_5240a,
  round(to_number(100*decode( lienbho2.inter_enb_s1_ho_att,0,null, lienbho2.inter_enb_s1_ho_succ / lienbho2.inter_enb_s1_ho_att)),2) LTE_5082a,
  round(to_number(lienbho2.inter_enb_s1_ho_prep),2) LTE_5127a,
  round(to_number(100*decode( (lienbho2.inter_enb_s1_ho_prep - nvl(lienbho2.inter_s1_lb_prep_fail_ac,0)),0,null, lienbho2.inter_enb_s1_ho_att / (lienbho2.inter_enb_s1_ho_prep - nvl(lienbho2.inter_s1_lb_prep_fail_ac,0)))),2) LTE_5078b,
  round(to_number(100*decode( lho2.ho_intfreq_att,0,null, lho2.ho_intfreq_succ / lho2.ho_intfreq_att)),2) LTE_5114a,
  to_number((lho2.ho_intfreq_att)) LTE_1078a,
  round(to_number(100*decode( lho2.ho_intfreq_gap_att,0,null, lho2.ho_intfreq_gap_succ / lho2.ho_intfreq_gap_att)),2) LTE_5115a,
  to_number((lho2.ho_intfreq_gap_att)) LTE_1079a,
  to_number(lho2.ho_lb_att) LTE_5316a,
  round(to_number(100*decode( lho2.ho_lb_att,0,null, lho2.ho_lb_succ / lho2.ho_lb_att)),2) LTE_5317a,
  round(to_number(100*decode( (lcellr2.period_duration_sum*60),0,null, lcellr2.high_cell_load_lb / (lcellr2.period_duration_sum*60))),3) LTE_1096c,
  round(to_number(100*decode( (lisho2.isys_ho_prep),0,null, (lisho2.isys_ho_succ + lisho2.isys_ho_utran_srvcc_succ + lisho2.isys_ho_geran_srvcc_succ) / (lisho2.isys_ho_prep))),2) LTE_5198b,
  to_number((lisho2.isys_ho_att + lisho2.isys_ho_utran_srvcc_att + lisho2.isys_ho_geran_srvcc_att)) LTE_5251a,
  round(to_number(100*decode( (lisho2.isys_ho_att + lisho2.isys_ho_utran_srvcc_att + lisho2.isys_ho_geran_srvcc_att),0,null, (lisho2.isys_ho_succ + lisho2.isys_ho_utran_srvcc_succ + lisho2.isys_ho_geran_srvcc_succ) / (lisho2.isys_ho_att + lisho2.isys_ho_utran_srvcc_att + lisho2.isys_ho_geran_srvcc_att))),2) LTE_5250a,
  to_number(lisho2.isys_ho_prep) LTE_5190a,
  round(to_number(100*decode( (lisho2.isys_ho_prep),0,null, (lisho2.isys_ho_att + lisho2.isys_ho_utran_srvcc_att + lisho2.isys_ho_geran_srvcc_att) / (lisho2.isys_ho_prep))),2) LTE_5191b,
  to_number(lisho2.isys_ho_utran_srvcc_att) LTE_5562a,
  to_number(100*decode( lisho2.isys_ho_utran_srvcc_att,0,null, lisho2.isys_ho_utran_srvcc_succ / lisho2.isys_ho_utran_srvcc_att)) LTE_5564a,
  to_number(lisho2.isys_ho_geran_srvcc_att) LTE_5565a,
  round(to_number(100*decode( lisho2.isys_ho_geran_srvcc_att,0,null, lisho2.isys_ho_geran_srvcc_succ / lisho2.isys_ho_geran_srvcc_att)),2) LTE_5567a,
  to_number((lisho2.csfb_redir_cr_att - lisho2.csfb_redir_cr_cmode_att)) LTE_1091a,
  to_number(lisho2.csfb_redir_cr_cmode_att) LTE_1092a,
  to_number((lisho2.csfb_psho_utran_att)) LTE_1081a,
  round(to_number(objcount.lncel_count* (nvl(decode(lueq_ext.denom_act_ue_data_dl,0,null, lueq_ext.sum_act_ue_data_dl/lueq_ext.denom_act_ue_data_dl),0) +nvl(decode(lcelld2.denom_active_ue_data_dl,0,null, lcelld2.sum_active_ue_data_dl/lcelld2.denom_active_ue_data_dl),0))),2) LTE_5800e,
  round(to_number(objcount.lncel_count* (nvl(decode(lueq_ext.denom_act_ue_data_ul,0,null, lueq_ext.sum_act_ue_data_ul/lueq_ext.denom_act_ue_data_ul),0) +nvl(decode(lcelld2.denom_active_ue_data_ul,0,null, lcelld2.sum_active_ue_data_ul/lcelld2.denom_active_ue_data_ul),0))),2) LTE_5801e,
  to_number(lueq_ext.dl_ue_data_buffer_max) LTE_5802b,
  to_number(lueq_ext.ul_ue_data_buffer_max) LTE_5803b,
  round(to_number(decode( lenbld2.denom_active_ue_enb,0,null, lenbld2.sum_active_ue_enb / lenbld2.denom_active_ue_enb)*lenbld_ext.lnbts_count),1) LTE_5804c,
  to_number((lenbld2.enb_load_act_ue_max)) LTE_1082a,
  round(to_number((nvl(decode(lueq_ext.denom_rrc_connected_ue,0,null,lueq_ext.sum_rrc_connected_ue / lueq_ext.denom_rrc_connected_ue),0) + nvl(decode(lcelld2.denom_rrc_conn_ue,0,null,lcelld2.sum_rrc_conn_ue / lcelld2.denom_rrc_conn_ue),0)) *objcount.lncel_count),2) LTE_5242b,
  round(to_number(objcount.lncel_count* (nvl((lueq_ext.ca_dl_cap_ue_2cc_avg/100),0) + nvl((lcelld2.ca_dl_cap_ue_avg/100),0))),2) LTE_5318c,
  round(to_number(objcount.lncel_count* (nvl((lueq_ext.ca_dl_capab_ue_3cc_avg/100),0) + nvl((lcelld2.ca_dl_cap_ue_3cc_avg/100),0))),2) LTE_5671b,
  round(to_number(objcount.lncel_count* (nvl((lueq_ext.ca_scell_act_ue_avg/100),0)+ nvl((lcelld2.ca_scell_active_ue_avg/100),0))),2) LTE_5320b,
  round(to_number(objcount.lncel_count* (nvl((lueq_ext.ca_2scells_act_ue_avg/100),0) + nvl((lcelld2.ca_2scells_active_ue_avg/100),0))),2) LTE_5674b,
  round(to_number(decode( 1000,0,null, lcellt2.rlc_pdu_dl_vol_ca_scell / 1000)),3) LTE_5324a,
  to_number(lcellr2.ca_scell_config_att) LTE_1114a,
  round(to_number(100*decode( lcellr2.ca_scell_config_att,0,null, lcellr2.ca_scell_config_succ / lcellr2.ca_scell_config_att)),2) LTE_5323a,
  round(to_number(objcount.lncel_count*lcellr2.tti_bundling_mode_ue_avg / 100),2) LTE_5326b,
  round(to_number(nvl((lcelld2.pdcp_sdu_delay_ul_dtch_mean),0)),2) LTE_5137a,
  round(to_number((lcelld2.pdcp_sdu_delay_dl_dtch_mean)),2) LTE_5134a,
  round(to_number((lcelld2.pdcp_ret_dl_del_mean_qci_1 + lqos2.harq_duration_qci1_avg)),2) LTE_5471a,
  round(to_number((lcelld2.pdcp_ret_dl_del_mean_qci_2 + lqos2.harq_duration_qci2_avg)),2) LTE_5472a,
  round(to_number((lcelld2.pdcp_ret_dl_del_mean_qci_3 + lqos2.harq_duration_qci3_avg)),2) LTE_5473a,
  round(to_number((lcelld2.pdcp_ret_dl_del_mean_qci_4 + lqos2.harq_duration_qci4_avg)),2) LTE_5474a,
  round(to_number((lcelld2.pdcp_ret_dl_del_mean_qci_5 + lqos2.harq_duration_qci5_avg)),2) LTE_5475a,
  round(to_number((lcelld2.pdcp_ret_dl_del_mean_qci_6 + lqos2.harq_duration_qci6_avg)),2) LTE_5476a,
  round(to_number((lcelld2.pdcp_ret_dl_del_mean_qci_7 + lqos2.harq_duration_qci7_avg)),2) LTE_5477a,
  round(to_number((lcelld2.pdcp_ret_dl_del_mean_qci_8 + lqos2.harq_duration_qci8_avg)),2) LTE_5478a,
  round(to_number((lcelld2.pdcp_ret_dl_del_mean_qci_9 + lqos2.harq_duration_qci9_avg)),2) LTE_5479a,
  round(to_number(100*decode(lcelld2.ul_rlc_pdu_rec_tot,0,null, lcelld2.ul_rlc_pdu_retr_req / lcelld2.ul_rlc_pdu_rec_tot)),2) LTE_5207b,
  round(to_number(decode((lcelld2.rlc_pdu_first_trans + lcelld2.rlc_pdu_re_trans),0,null, (lcelld2.rlc_pdu_re_trans) / (lcelld2.rlc_pdu_first_trans + lcelld2.rlc_pdu_re_trans))*100),2) LTE_5208a,
  round(to_number(100*decode((lcelld2.pdsch_trans_using_mcs0 + lcelld2.pdsch_trans_using_mcs1 + lcelld2.pdsch_trans_using_mcs2 + lcelld2.pdsch_trans_using_mcs3 + lcelld2.pdsch_trans_using_mcs4 + lcelld2.pdsch_trans_using_mcs5 + lcelld2.pdsch_trans_using_mcs6 + lcelld2.pdsch_trans_using_mcs7 + lcelld2.pdsch_trans_using_mcs8 + lcelld2.pdsch_trans_using_mcs9 + lcelld2.pdsch_trans_using_mcs10 + lcelld2.pdsch_trans_using_mcs11 + lcelld2.pdsch_trans_using_mcs12 + lcelld2.pdsch_trans_using_mcs13 + lcelld2.pdsch_trans_using_mcs14 + lcelld2.pdsch_trans_using_mcs15 + lcelld2.pdsch_trans_using_mcs16 + lcelld2.pdsch_trans_using_mcs17 + lcelld2.pdsch_trans_using_mcs18 + lcelld2.pdsch_trans_using_mcs19 + lcelld2.pdsch_trans_using_mcs20 + lcelld2.pdsch_trans_using_mcs21 + lcelld2.pdsch_trans_using_mcs22 + lcelld2.pdsch_trans_using_mcs23 + lcelld2.pdsch_trans_using_mcs24 + lcelld2.pdsch_trans_using_mcs25 + lcelld2.pdsch_trans_using_mcs26 + lcelld2.pdsch_trans_using_mcs27 + lcelld2.pdsch_trans_using_mcs28 + nvl(lcelld2.pdsch_trans_using_mcs29,0) + nvl(lcelld2.pdsch_trans_using_mcs30,0) + nvl(lcelld2.pdsch_trans_using_mcs31,0) + nvl(lcellr2.schdl_256qam_pdsch_16qam,0) + nvl(lcellr2.schdl_256qam_pdsch_64qam,0) + nvl(lcellr2.schdl_256qam_pdsch_256qam,0)),0,null, (lcelld2.pdsch_trans_nack_mcs0 + lcelld2.pdsch_trans_nack_mcs1 + lcelld2.pdsch_trans_nack_mcs2 + lcelld2.pdsch_trans_nack_mcs3 + lcelld2.pdsch_trans_nack_mcs4 + lcelld2.pdsch_trans_nack_mcs5 + lcelld2.pdsch_trans_nack_mcs6 + lcelld2.pdsch_trans_nack_mcs7 + lcelld2.pdsch_trans_nack_mcs8 + lcelld2.pdsch_trans_nack_mcs9 + lcelld2.pdsch_trans_nack_mcs10 + lcelld2.pdsch_trans_nack_mcs11 + lcelld2.pdsch_trans_nack_mcs12 + lcelld2.pdsch_trans_nack_mcs13 + lcelld2.pdsch_trans_nack_mcs14 + lcelld2.pdsch_trans_nack_mcs15 + lcelld2.pdsch_trans_nack_mcs16 + lcelld2.pdsch_trans_nack_mcs17 + lcelld2.pdsch_trans_nack_mcs18 + lcelld2.pdsch_trans_nack_mcs19 + lcelld2.pdsch_trans_nack_mcs20 + lcelld2.pdsch_trans_nack_mcs21 + lcelld2.pdsch_trans_nack_mcs22 + lcelld2.pdsch_trans_nack_mcs23 + lcelld2.pdsch_trans_nack_mcs24 + lcelld2.pdsch_trans_nack_mcs25 + lcelld2.pdsch_trans_nack_mcs26 + lcelld2.pdsch_trans_nack_mcs27 + lcelld2.pdsch_trans_nack_mcs28 + nvl(lcelld2.pdsch_trans_nack_mcs29,0) + nvl(lcelld2.pdsch_trans_nack_mcs30,0) + nvl(lcelld2.pdsch_trans_nack_mcs31,0) + lcelld2.tb_bund2_nack_pdsch_mcs0 + lcelld2.tb_bund2_nack_pdsch_mcs1 + lcelld2.tb_bund2_nack_pdsch_mcs2 + lcelld2.tb_bund2_nack_pdsch_mcs3 + lcelld2.tb_bund2_nack_pdsch_mcs4 + lcelld2.tb_bund2_nack_pdsch_mcs5 + lcelld2.tb_bund2_nack_pdsch_mcs6 + lcelld2.tb_bund2_nack_pdsch_mcs7 + lcelld2.tb_bund2_nack_pdsch_mcs8 + lcelld2.tb_bund2_nack_pdsch_mcs9 + lcelld2.tb_bund2_nack_pdsch_mcs10 + lcelld2.tb_bund2_nack_pdsch_mcs11 + lcelld2.tb_bund2_nack_pdsch_mcs12 + lcelld2.tb_bund2_nack_pdsch_mcs13 + lcelld2.tb_bund2_nack_pdsch_mcs14 + lcelld2.tb_bund2_nack_pdsch_mcs15 + lcelld2.tb_bund2_nack_pdsch_mcs16 + lcelld2.tb_bund2_nack_pdsch_mcs17 + lcelld2.tb_bund2_nack_pdsch_mcs18 + lcelld2.tb_bund2_nack_pdsch_mcs19 + lcelld2.tb_bund2_nack_pdsch_mcs20 + lcelld2.tb_bund2_nack_pdsch_mcs21 + lcelld2.tb_bund2_nack_pdsch_mcs22 + lcelld2.tb_bund2_nack_pdsch_mcs23 + lcelld2.tb_bund2_nack_pdsch_mcs24 + lcelld2.tb_bund2_nack_pdsch_mcs25 + lcelld2.tb_bund2_nack_pdsch_mcs26 + lcelld2.tb_bund2_nack_pdsch_mcs27 + lcelld2.tb_bund2_nack_pdsch_mcs28 + nvl(lcelld2.tb_bund2_nack_pdsch_mcs29,0) + nvl(lcelld2.tb_bund2_nack_pdsch_mcs30,0) + nvl(lcelld2.tb_bund2_nack_pdsch_mcs31,0) + lcelld2.tb_bund3_nack_pdsch_mcs0 + lcelld2.tb_bund3_nack_pdsch_mcs1 + lcelld2.tb_bund3_nack_pdsch_mcs2 + lcelld2.tb_bund3_nack_pdsch_mcs3 + lcelld2.tb_bund3_nack_pdsch_mcs4 + lcelld2.tb_bund3_nack_pdsch_mcs5 + lcelld2.tb_bund3_nack_pdsch_mcs6 + lcelld2.tb_bund3_nack_pdsch_mcs7 + lcelld2.tb_bund3_nack_pdsch_mcs8 + lcelld2.tb_bund3_nack_pdsch_mcs9 + lcelld2.tb_bund3_nack_pdsch_mcs10 + lcelld2.tb_bund3_nack_pdsch_mcs11 + lcelld2.tb_bund3_nack_pdsch_mcs12 + lcelld2.tb_bund3_nack_pdsch_mcs13 + lcelld2.tb_bund3_nack_pdsch_mcs14 + lcelld2.tb_bund3_nack_pdsch_mcs15 + lcelld2.tb_bund3_nack_pdsch_mcs16 + lcelld2.tb_bund3_nack_pdsch_mcs17 + lcelld2.tb_bund3_nack_pdsch_mcs18 + lcelld2.tb_bund3_nack_pdsch_mcs19 + lcelld2.tb_bund3_nack_pdsch_mcs20 + lcelld2.tb_bund3_nack_pdsch_mcs21 + lcelld2.tb_bund3_nack_pdsch_mcs22 + lcelld2.tb_bund3_nack_pdsch_mcs23 + lcelld2.tb_bund3_nack_pdsch_mcs24 + lcelld2.tb_bund3_nack_pdsch_mcs25 + lcelld2.tb_bund3_nack_pdsch_mcs26 + lcelld2.tb_bund3_nack_pdsch_mcs27 + lcelld2.tb_bund3_nack_pdsch_mcs28 + nvl(lcelld2.tb_bund3_nack_pdsch_mcs29,0) + nvl(lcelld2.tb_bund3_nack_pdsch_mcs30,0) + nvl(lcelld2.tb_bund3_nack_pdsch_mcs31,0) + lcelld2.tb_bund4_nack_pdsch_mcs0 + lcelld2.tb_bund4_nack_pdsch_mcs1 + lcelld2.tb_bund4_nack_pdsch_mcs2 + lcelld2.tb_bund4_nack_pdsch_mcs3 + lcelld2.tb_bund4_nack_pdsch_mcs4 + lcelld2.tb_bund4_nack_pdsch_mcs5 + lcelld2.tb_bund4_nack_pdsch_mcs6 + lcelld2.tb_bund4_nack_pdsch_mcs7 + lcelld2.tb_bund4_nack_pdsch_mcs8 + lcelld2.tb_bund4_nack_pdsch_mcs9 + lcelld2.tb_bund4_nack_pdsch_mcs10 + lcelld2.tb_bund4_nack_pdsch_mcs11 + lcelld2.tb_bund4_nack_pdsch_mcs12 + lcelld2.tb_bund4_nack_pdsch_mcs13 + lcelld2.tb_bund4_nack_pdsch_mcs14 + lcelld2.tb_bund4_nack_pdsch_mcs15 + lcelld2.tb_bund4_nack_pdsch_mcs16 + lcelld2.tb_bund4_nack_pdsch_mcs17 + lcelld2.tb_bund4_nack_pdsch_mcs18 + lcelld2.tb_bund4_nack_pdsch_mcs19 + lcelld2.tb_bund4_nack_pdsch_mcs20 + lcelld2.tb_bund4_nack_pdsch_mcs21 + lcelld2.tb_bund4_nack_pdsch_mcs22 + lcelld2.tb_bund4_nack_pdsch_mcs23 + lcelld2.tb_bund4_nack_pdsch_mcs24 + lcelld2.tb_bund4_nack_pdsch_mcs25 + lcelld2.tb_bund4_nack_pdsch_mcs26 + lcelld2.tb_bund4_nack_pdsch_mcs27 + lcelld2.tb_bund4_nack_pdsch_mcs28 + lcelld2.tb_bund4_nack_pdsch_mcs29 + lcelld2.tb_bund4_nack_pdsch_mcs30 + lcelld2.tb_bund4_nack_pdsch_mcs31 + nvl(lcellr2.schdl_256qam_pdsch_nack_qpsk,0) + nvl(lcellr2.schdl_256qam_pdsch_nack_16qam,0) + nvl(lcellr2.schdl_256qam_pdsch_nack_64qam,0) + nvl(lcellr2.schdl_256qam_pdsch_nack_256qam,0)) / (lcelld2.pdsch_trans_using_mcs0 + lcelld2.pdsch_trans_using_mcs1 + lcelld2.pdsch_trans_using_mcs2 + lcelld2.pdsch_trans_using_mcs3 + lcelld2.pdsch_trans_using_mcs4 + lcelld2.pdsch_trans_using_mcs5 + lcelld2.pdsch_trans_using_mcs6 + lcelld2.pdsch_trans_using_mcs7 + lcelld2.pdsch_trans_using_mcs8 + lcelld2.pdsch_trans_using_mcs9 + lcelld2.pdsch_trans_using_mcs10 + lcelld2.pdsch_trans_using_mcs11 + lcelld2.pdsch_trans_using_mcs12 + lcelld2.pdsch_trans_using_mcs13 + lcelld2.pdsch_trans_using_mcs14 + lcelld2.pdsch_trans_using_mcs15 + lcelld2.pdsch_trans_using_mcs16 + lcelld2.pdsch_trans_using_mcs17 + lcelld2.pdsch_trans_using_mcs18 + lcelld2.pdsch_trans_using_mcs19 + lcelld2.pdsch_trans_using_mcs20 + lcelld2.pdsch_trans_using_mcs21 + lcelld2.pdsch_trans_using_mcs22 + lcelld2.pdsch_trans_using_mcs23 + lcelld2.pdsch_trans_using_mcs24 + lcelld2.pdsch_trans_using_mcs25 + lcelld2.pdsch_trans_using_mcs26 + lcelld2.pdsch_trans_using_mcs27 + lcelld2.pdsch_trans_using_mcs28 + nvl(lcelld2.pdsch_trans_using_mcs29,0) + nvl(lcelld2.pdsch_trans_using_mcs30,0) + nvl(lcelld2.pdsch_trans_using_mcs31,0) + nvl(lcellr2.schdl_256qam_pdsch_qpsk,0) + nvl(lcellr2.schdl_256qam_pdsch_16qam,0) + nvl(lcellr2.schdl_256qam_pdsch_64qam,0) + nvl(lcellr2.schdl_256qam_pdsch_256qam,0)))),2) LTE_139d,
  round(to_number(100*decode((lcelld2.pusch_trans_using_mcs0 + lcelld2.pusch_trans_using_mcs1 + lcelld2.pusch_trans_using_mcs2 + lcelld2.pusch_trans_using_mcs3 + lcelld2.pusch_trans_using_mcs4 + lcelld2.pusch_trans_using_mcs5 + lcelld2.pusch_trans_using_mcs6 + lcelld2.pusch_trans_using_mcs7 + lcelld2.pusch_trans_using_mcs8 + lcelld2.pusch_trans_using_mcs9 + lcelld2.pusch_trans_using_mcs10 + lcelld2.pusch_trans_using_mcs11 + lcelld2.pusch_trans_using_mcs12 + lcelld2.pusch_trans_using_mcs13 + lcelld2.pusch_trans_using_mcs14 + lcelld2.pusch_trans_using_mcs15 + lcelld2.pusch_trans_using_mcs16 + lcelld2.pusch_trans_using_mcs17 + lcelld2.pusch_trans_using_mcs18 + lcelld2.pusch_trans_using_mcs19 + lcelld2.pusch_trans_using_mcs20 + lcelld2.pusch_trans_using_mcs21 + lcelld2.pusch_trans_using_mcs22 + lcelld2.pusch_trans_using_mcs23 + lcelld2.pusch_trans_using_mcs24 + lcelld2.pusch_trans_using_mcs25 + lcelld2.pusch_trans_using_mcs26 + lcelld2.pusch_trans_using_mcs27 + lcelld2.pusch_trans_using_mcs28),0,null, (lcelld2.pusch_trans_nack_mcs0 + lcelld2.pusch_trans_nack_mcs1 + lcelld2.pusch_trans_nack_mcs2 + lcelld2.pusch_trans_nack_mcs3 + lcelld2.pusch_trans_nack_mcs4 + lcelld2.pusch_trans_nack_mcs5 + lcelld2.pusch_trans_nack_mcs6 + lcelld2.pusch_trans_nack_mcs7 + lcelld2.pusch_trans_nack_mcs8 + lcelld2.pusch_trans_nack_mcs9 + lcelld2.pusch_trans_nack_mcs10 + lcelld2.pusch_trans_nack_mcs11 + lcelld2.pusch_trans_nack_mcs12 + lcelld2.pusch_trans_nack_mcs13 + lcelld2.pusch_trans_nack_mcs14 + lcelld2.pusch_trans_nack_mcs15 + lcelld2.pusch_trans_nack_mcs16 + lcelld2.pusch_trans_nack_mcs17 + lcelld2.pusch_trans_nack_mcs18 + lcelld2.pusch_trans_nack_mcs19 + lcelld2.pusch_trans_nack_mcs20 + lcelld2.pusch_trans_nack_mcs21 + lcelld2.pusch_trans_nack_mcs22 + lcelld2.pusch_trans_nack_mcs23 + lcelld2.pusch_trans_nack_mcs24 + lcelld2.pusch_trans_nack_mcs25 + lcelld2.pusch_trans_nack_mcs26 + lcelld2.pusch_trans_nack_mcs27 + lcelld2.pusch_trans_nack_mcs28) / (lcelld2.pusch_trans_using_mcs0 + lcelld2.pusch_trans_using_mcs1 + lcelld2.pusch_trans_using_mcs2 + lcelld2.pusch_trans_using_mcs3 + lcelld2.pusch_trans_using_mcs4 + lcelld2.pusch_trans_using_mcs5 + lcelld2.pusch_trans_using_mcs6 + lcelld2.pusch_trans_using_mcs7 + lcelld2.pusch_trans_using_mcs8 + lcelld2.pusch_trans_using_mcs9 + lcelld2.pusch_trans_using_mcs10 + lcelld2.pusch_trans_using_mcs11 + lcelld2.pusch_trans_using_mcs12 + lcelld2.pusch_trans_using_mcs13 + lcelld2.pusch_trans_using_mcs14 + lcelld2.pusch_trans_using_mcs15 + lcelld2.pusch_trans_using_mcs16 + lcelld2.pusch_trans_using_mcs17 + lcelld2.pusch_trans_using_mcs18 + lcelld2.pusch_trans_using_mcs19 + lcelld2.pusch_trans_using_mcs20 + lcelld2.pusch_trans_using_mcs21 + lcelld2.pusch_trans_using_mcs22 + lcelld2.pusch_trans_using_mcs23 + lcelld2.pusch_trans_using_mcs24 + lcelld2.pusch_trans_using_mcs25 + lcelld2.pusch_trans_using_mcs26 + lcelld2.pusch_trans_using_mcs27 + lcelld2.pusch_trans_using_mcs28))),2) LTE_140b,
  round(to_number(decode((lpqdl2.ue_rep_cqi_level_00 + nvl(lpqdl2.ue_256qam_conf_cqi_level_00,0) + lpqdl2.ue_rep_cqi_level_01 + nvl(lpqdl2.ue_256qam_conf_cqi_level_01,0) + lpqdl2.ue_rep_cqi_level_02 + nvl(lpqdl2.ue_256qam_conf_cqi_level_02,0) + lpqdl2.ue_rep_cqi_level_03 + nvl(lpqdl2.ue_256qam_conf_cqi_level_03,0) + lpqdl2.ue_rep_cqi_level_04 + nvl(lpqdl2.ue_256qam_conf_cqi_level_04,0) + lpqdl2.ue_rep_cqi_level_05 + nvl(lpqdl2.ue_256qam_conf_cqi_level_05,0) + lpqdl2.ue_rep_cqi_level_06 + nvl(lpqdl2.ue_256qam_conf_cqi_level_06,0) + lpqdl2.ue_rep_cqi_level_07 + nvl(lpqdl2.ue_256qam_conf_cqi_level_07,0) + lpqdl2.ue_rep_cqi_level_08 + nvl(lpqdl2.ue_256qam_conf_cqi_level_08,0) + lpqdl2.ue_rep_cqi_level_09 + nvl(lpqdl2.ue_256qam_conf_cqi_level_09,0) + lpqdl2.ue_rep_cqi_level_10 + nvl(lpqdl2.ue_256qam_conf_cqi_level_10,0) + lpqdl2.ue_rep_cqi_level_11 + nvl(lpqdl2.ue_256qam_conf_cqi_level_11,0) + lpqdl2.ue_rep_cqi_level_12 + nvl(lpqdl2.ue_256qam_conf_cqi_level_12,0) + lpqdl2.ue_rep_cqi_level_13 + nvl(lpqdl2.ue_256qam_conf_cqi_level_13,0) + lpqdl2.ue_rep_cqi_level_14 + nvl(lpqdl2.ue_256qam_conf_cqi_level_14,0) + lpqdl2.ue_rep_cqi_level_15 + nvl(lpqdl2.ue_256qam_conf_cqi_level_15,0)),0,null, (1*(lpqdl2.ue_rep_cqi_level_01 + nvl(lpqdl2.ue_256qam_conf_cqi_level_01,0)) + 2*(lpqdl2.ue_rep_cqi_level_02 + nvl(lpqdl2.ue_256qam_conf_cqi_level_02,0)) + 3*(lpqdl2.ue_rep_cqi_level_03 + nvl(lpqdl2.ue_256qam_conf_cqi_level_03,0)) + 4*(lpqdl2.ue_rep_cqi_level_04 + nvl(lpqdl2.ue_256qam_conf_cqi_level_04,0)) + 5*(lpqdl2.ue_rep_cqi_level_05 + nvl(lpqdl2.ue_256qam_conf_cqi_level_05,0)) + 6*(lpqdl2.ue_rep_cqi_level_06 + nvl(lpqdl2.ue_256qam_conf_cqi_level_06,0)) + 7*(lpqdl2.ue_rep_cqi_level_07 + nvl(lpqdl2.ue_256qam_conf_cqi_level_07,0)) + 8*(lpqdl2.ue_rep_cqi_level_08 + nvl(lpqdl2.ue_256qam_conf_cqi_level_08,0)) + 9*(lpqdl2.ue_rep_cqi_level_09 + nvl(lpqdl2.ue_256qam_conf_cqi_level_09,0)) + 10*(lpqdl2.ue_rep_cqi_level_10 + nvl(lpqdl2.ue_256qam_conf_cqi_level_10,0)) + 11*(lpqdl2.ue_rep_cqi_level_11 + nvl(lpqdl2.ue_256qam_conf_cqi_level_11,0)) + 12*(lpqdl2.ue_rep_cqi_level_12 + nvl(lpqdl2.ue_256qam_conf_cqi_level_12,0)) + 13*(lpqdl2.ue_rep_cqi_level_13 + nvl(lpqdl2.ue_256qam_conf_cqi_level_13,0)) + 14*(lpqdl2.ue_rep_cqi_level_14 + nvl(lpqdl2.ue_256qam_conf_cqi_level_14,0)) + 15*(lpqdl2.ue_rep_cqi_level_15 + nvl(lpqdl2.ue_256qam_conf_cqi_level_15,0))) / (lpqdl2.ue_rep_cqi_level_00 + nvl(lpqdl2.ue_256qam_conf_cqi_level_00,0) + lpqdl2.ue_rep_cqi_level_01 + nvl(lpqdl2.ue_256qam_conf_cqi_level_01,0) + lpqdl2.ue_rep_cqi_level_02 + nvl(lpqdl2.ue_256qam_conf_cqi_level_02,0) + lpqdl2.ue_rep_cqi_level_03 + nvl(lpqdl2.ue_256qam_conf_cqi_level_03,0) + lpqdl2.ue_rep_cqi_level_04 + nvl(lpqdl2.ue_256qam_conf_cqi_level_04,0) + lpqdl2.ue_rep_cqi_level_05 + nvl(lpqdl2.ue_256qam_conf_cqi_level_05,0) + lpqdl2.ue_rep_cqi_level_06 + nvl(lpqdl2.ue_256qam_conf_cqi_level_06,0) + lpqdl2.ue_rep_cqi_level_07 + nvl(lpqdl2.ue_256qam_conf_cqi_level_07,0) + lpqdl2.ue_rep_cqi_level_08 + nvl(lpqdl2.ue_256qam_conf_cqi_level_08,0) + lpqdl2.ue_rep_cqi_level_09 + nvl(lpqdl2.ue_256qam_conf_cqi_level_09,0) + lpqdl2.ue_rep_cqi_level_10 + nvl(lpqdl2.ue_256qam_conf_cqi_level_10,0) + lpqdl2.ue_rep_cqi_level_11 + nvl(lpqdl2.ue_256qam_conf_cqi_level_11,0) + lpqdl2.ue_rep_cqi_level_12 + nvl(lpqdl2.ue_256qam_conf_cqi_level_12,0) + lpqdl2.ue_rep_cqi_level_13 + nvl(lpqdl2.ue_256qam_conf_cqi_level_13,0) + lpqdl2.ue_rep_cqi_level_14 + nvl(lpqdl2.ue_256qam_conf_cqi_level_14,0) + lpqdl2.ue_rep_cqi_level_15 + nvl(lpqdl2.ue_256qam_conf_cqi_level_15,0)))),2) LTE_5427b,
  round(to_number(lpqdl2.cqi_off_mean/1000),2) LTE_5432b,
  round(to_number(decode(((lpqul2.rssi_pucch_level_01) + (lpqul2.rssi_pucch_level_02) + (lpqul2.rssi_pucch_level_03) + (lpqul2.rssi_pucch_level_04) + (lpqul2.rssi_pucch_level_05) + (lpqul2.rssi_pucch_level_06) + (lpqul2.rssi_pucch_level_07) + (lpqul2.rssi_pucch_level_08) + (lpqul2.rssi_pucch_level_09) + (lpqul2.rssi_pucch_level_10) + (lpqul2.rssi_pucch_level_11) + (lpqul2.rssi_pucch_level_12) + (lpqul2.rssi_pucch_level_13) + (lpqul2.rssi_pucch_level_14) + (lpqul2.rssi_pucch_level_15) + (lpqul2.rssi_pucch_level_16) + (lpqul2.rssi_pucch_level_17) + (lpqul2.rssi_pucch_level_18) + (lpqul2.rssi_pucch_level_19) + (lpqul2.rssi_pucch_level_20) + (lpqul2.rssi_pucch_level_21) + (lpqul2.rssi_pucch_level_22)),0,null, ( - 120*(lpqul2.rssi_pucch_level_01) - 119*(lpqul2.rssi_pucch_level_02) - 117*(lpqul2.rssi_pucch_level_03) - 115*(lpqul2.rssi_pucch_level_04) - 113*(lpqul2.rssi_pucch_level_05) - 111*(lpqul2.rssi_pucch_level_06) - 109*(lpqul2.rssi_pucch_level_07) - 107*(lpqul2.rssi_pucch_level_08) - 105*(lpqul2.rssi_pucch_level_09) - 103*(lpqul2.rssi_pucch_level_10) - 101*(lpqul2.rssi_pucch_level_11) - 99*(lpqul2.rssi_pucch_level_12) - 97*(lpqul2.rssi_pucch_level_13) - 95*(lpqul2.rssi_pucch_level_14) - 93*(lpqul2.rssi_pucch_level_15) - 91*(lpqul2.rssi_pucch_level_16) - 89*(lpqul2.rssi_pucch_level_17) - 87*(lpqul2.rssi_pucch_level_18) - 85*(lpqul2.rssi_pucch_level_19) - 83*(lpqul2.rssi_pucch_level_20) - 81*(lpqul2.rssi_pucch_level_21) - 80*(lpqul2.rssi_pucch_level_22)) / ((lpqul2.rssi_pucch_level_01) + (lpqul2.rssi_pucch_level_02) + (lpqul2.rssi_pucch_level_03) + (lpqul2.rssi_pucch_level_04) + (lpqul2.rssi_pucch_level_05) + (lpqul2.rssi_pucch_level_06) + (lpqul2.rssi_pucch_level_07) + (lpqul2.rssi_pucch_level_08) + (lpqul2.rssi_pucch_level_09) + (lpqul2.rssi_pucch_level_10) + (lpqul2.rssi_pucch_level_11) + (lpqul2.rssi_pucch_level_12) + (lpqul2.rssi_pucch_level_13) + (lpqul2.rssi_pucch_level_14) + (lpqul2.rssi_pucch_level_15) + (lpqul2.rssi_pucch_level_16) + (lpqul2.rssi_pucch_level_17) + (lpqul2.rssi_pucch_level_18) + (lpqul2.rssi_pucch_level_19) + (lpqul2.rssi_pucch_level_20) + (lpqul2.rssi_pucch_level_21) + (lpqul2.rssi_pucch_level_22)))),2) LTE_5441b,
  round(to_number(decode(((lpqul2.rssi_pusch_level_01) + (lpqul2.rssi_pusch_level_02) + (lpqul2.rssi_pusch_level_03) + (lpqul2.rssi_pusch_level_04) + (lpqul2.rssi_pusch_level_05) + (lpqul2.rssi_pusch_level_06) + (lpqul2.rssi_pusch_level_07) + (lpqul2.rssi_pusch_level_08) + (lpqul2.rssi_pusch_level_09) + (lpqul2.rssi_pusch_level_10) + (lpqul2.rssi_pusch_level_11) + (lpqul2.rssi_pusch_level_12) + (lpqul2.rssi_pusch_level_13) + (lpqul2.rssi_pusch_level_14) + (lpqul2.rssi_pusch_level_15) + (lpqul2.rssi_pusch_level_16) + (lpqul2.rssi_pusch_level_17) + (lpqul2.rssi_pusch_level_18) + (lpqul2.rssi_pusch_level_19) + (lpqul2.rssi_pusch_level_20) + (lpqul2.rssi_pusch_level_21) + (lpqul2.rssi_pusch_level_22)),0,null, ( - 120*(lpqul2.rssi_pusch_level_01) - 119*(lpqul2.rssi_pusch_level_02) - 117*(lpqul2.rssi_pusch_level_03) - 115*(lpqul2.rssi_pusch_level_04) - 113*(lpqul2.rssi_pusch_level_05) - 111*(lpqul2.rssi_pusch_level_06) - 109*(lpqul2.rssi_pusch_level_07) - 107*(lpqul2.rssi_pusch_level_08) - 105*(lpqul2.rssi_pusch_level_09) - 103*(lpqul2.rssi_pusch_level_10) - 101*(lpqul2.rssi_pusch_level_11) - 99*(lpqul2.rssi_pusch_level_12) - 97*(lpqul2.rssi_pusch_level_13) - 95*(lpqul2.rssi_pusch_level_14) - 93*(lpqul2.rssi_pusch_level_15) - 91*(lpqul2.rssi_pusch_level_16) - 89*(lpqul2.rssi_pusch_level_17) - 87*(lpqul2.rssi_pusch_level_18) - 85*(lpqul2.rssi_pusch_level_19) - 83*(lpqul2.rssi_pusch_level_20) - 81*(lpqul2.rssi_pusch_level_21) - 80*(lpqul2.rssi_pusch_level_22)) / ((lpqul2.rssi_pusch_level_01) + (lpqul2.rssi_pusch_level_02) + (lpqul2.rssi_pusch_level_03) + (lpqul2.rssi_pusch_level_04) + (lpqul2.rssi_pusch_level_05) + (lpqul2.rssi_pusch_level_06) + (lpqul2.rssi_pusch_level_07) + (lpqul2.rssi_pusch_level_08) + (lpqul2.rssi_pusch_level_09) + (lpqul2.rssi_pusch_level_10) + (lpqul2.rssi_pusch_level_11) + (lpqul2.rssi_pusch_level_12) + (lpqul2.rssi_pusch_level_13) + (lpqul2.rssi_pusch_level_14) + (lpqul2.rssi_pusch_level_15) + (lpqul2.rssi_pusch_level_16) + (lpqul2.rssi_pusch_level_17) + (lpqul2.rssi_pusch_level_18) + (lpqul2.rssi_pusch_level_19) + (lpqul2.rssi_pusch_level_20) + (lpqul2.rssi_pusch_level_21) + (lpqul2.rssi_pusch_level_22)))),2) LTE_5444b,
  round(to_number(decode(((lpqul2.sinr_pucch_level_1) + (lpqul2.sinr_pucch_level_2) + (lpqul2.sinr_pucch_level_3) + (lpqul2.sinr_pucch_level_4) + (lpqul2.sinr_pucch_level_5) + (lpqul2.sinr_pucch_level_6) + (lpqul2.sinr_pucch_level_7) + (lpqul2.sinr_pucch_level_8) + (lpqul2.sinr_pucch_level_9) + (lpqul2.sinr_pucch_level_10) + (lpqul2.sinr_pucch_level_11) + (lpqul2.sinr_pucch_level_12) + (lpqul2.sinr_pucch_level_13) + (lpqul2.sinr_pucch_level_14) + (lpqul2.sinr_pucch_level_15) + (lpqul2.sinr_pucch_level_16) + (lpqul2.sinr_pucch_level_17) + (lpqul2.sinr_pucch_level_18) + (lpqul2.sinr_pucch_level_19) + (lpqul2.sinr_pucch_level_20) + (lpqul2.sinr_pucch_level_21) + (lpqul2.sinr_pucch_level_22)),0,null, (-10*(lpqul2.sinr_pucch_level_1) - 9*(lpqul2.sinr_pucch_level_2) - 7*(lpqul2.sinr_pucch_level_3) - 5*(lpqul2.sinr_pucch_level_4) - 3*(lpqul2.sinr_pucch_level_5) - 1*(lpqul2.sinr_pucch_level_6) + 1*(lpqul2.sinr_pucch_level_7) + 3*(lpqul2.sinr_pucch_level_8) + 5*(lpqul2.sinr_pucch_level_9) + 7*(lpqul2.sinr_pucch_level_10) + 9*(lpqul2.sinr_pucch_level_11) + 11*(lpqul2.sinr_pucch_level_12) + 13*(lpqul2.sinr_pucch_level_13) + 15*(lpqul2.sinr_pucch_level_14) + 17*(lpqul2.sinr_pucch_level_15) + 19*(lpqul2.sinr_pucch_level_16) + 21*(lpqul2.sinr_pucch_level_17) + 23*(lpqul2.sinr_pucch_level_18) + 25*(lpqul2.sinr_pucch_level_19) + 27*(lpqul2.sinr_pucch_level_20) + 29*(lpqul2.sinr_pucch_level_21) + 30*(lpqul2.sinr_pucch_level_22)) / ((lpqul2.sinr_pucch_level_1) + (lpqul2.sinr_pucch_level_2) + (lpqul2.sinr_pucch_level_3) + (lpqul2.sinr_pucch_level_4) + (lpqul2.sinr_pucch_level_5) + (lpqul2.sinr_pucch_level_6) + (lpqul2.sinr_pucch_level_7) + (lpqul2.sinr_pucch_level_8) + (lpqul2.sinr_pucch_level_9) + (lpqul2.sinr_pucch_level_10) + (lpqul2.sinr_pucch_level_11) + (lpqul2.sinr_pucch_level_12) + (lpqul2.sinr_pucch_level_13) + (lpqul2.sinr_pucch_level_14) + (lpqul2.sinr_pucch_level_15) + (lpqul2.sinr_pucch_level_16) + (lpqul2.sinr_pucch_level_17) + (lpqul2.sinr_pucch_level_18) + (lpqul2.sinr_pucch_level_19) + (lpqul2.sinr_pucch_level_20) + (lpqul2.sinr_pucch_level_21) + (lpqul2.sinr_pucch_level_22)))),2) LTE_5541b,
  round(to_number(decode(((lpqul2.sinr_pusch_level_1) + (lpqul2.sinr_pusch_level_2) + (lpqul2.sinr_pusch_level_3) + (lpqul2.sinr_pusch_level_4) + (lpqul2.sinr_pusch_level_5) + (lpqul2.sinr_pusch_level_6) + (lpqul2.sinr_pusch_level_7) + (lpqul2.sinr_pusch_level_8) + (lpqul2.sinr_pusch_level_9) + (lpqul2.sinr_pusch_level_10) + (lpqul2.sinr_pusch_level_11) + (lpqul2.sinr_pusch_level_12) + (lpqul2.sinr_pusch_level_13) + (lpqul2.sinr_pusch_level_14) + (lpqul2.sinr_pusch_level_15) + (lpqul2.sinr_pusch_level_16) + (lpqul2.sinr_pusch_level_17) + (lpqul2.sinr_pusch_level_18) + (lpqul2.sinr_pusch_level_19) + (lpqul2.sinr_pusch_level_20) + (lpqul2.sinr_pusch_level_21) + (lpqul2.sinr_pusch_level_22)),0,null, (-10*(lpqul2.sinr_pusch_level_1) - 9*(lpqul2.sinr_pusch_level_2) - 7*(lpqul2.sinr_pusch_level_3) - 5*(lpqul2.sinr_pusch_level_4) - 3*(lpqul2.sinr_pusch_level_5) - 1*(lpqul2.sinr_pusch_level_6) + 1*(lpqul2.sinr_pusch_level_7) + 3*(lpqul2.sinr_pusch_level_8) + 5*(lpqul2.sinr_pusch_level_9) + 7*(lpqul2.sinr_pusch_level_10) + 9*(lpqul2.sinr_pusch_level_11) + 11*(lpqul2.sinr_pusch_level_12) + 13*(lpqul2.sinr_pusch_level_13) + 15*(lpqul2.sinr_pusch_level_14) + 17*(lpqul2.sinr_pusch_level_15) + 19*(lpqul2.sinr_pusch_level_16) + 21*(lpqul2.sinr_pusch_level_17) + 23*(lpqul2.sinr_pusch_level_18) + 25*(lpqul2.sinr_pusch_level_19) + 27*(lpqul2.sinr_pusch_level_20) + 29*(lpqul2.sinr_pusch_level_21) + 30*(lpqul2.sinr_pusch_level_22)) / ((lpqul2.sinr_pusch_level_1) + (lpqul2.sinr_pusch_level_2) + (lpqul2.sinr_pusch_level_3) + (lpqul2.sinr_pusch_level_4) + (lpqul2.sinr_pusch_level_5) + (lpqul2.sinr_pusch_level_6) + (lpqul2.sinr_pusch_level_7) + (lpqul2.sinr_pusch_level_8) + (lpqul2.sinr_pusch_level_9) + (lpqul2.sinr_pusch_level_10) + (lpqul2.sinr_pusch_level_11) + (lpqul2.sinr_pusch_level_12) + (lpqul2.sinr_pusch_level_13) + (lpqul2.sinr_pusch_level_14) + (lpqul2.sinr_pusch_level_15) + (lpqul2.sinr_pusch_level_16) + (lpqul2.sinr_pusch_level_17) + (lpqul2.sinr_pusch_level_18) + (lpqul2.sinr_pusch_level_19) + (lpqul2.sinr_pusch_level_20) + (lpqul2.sinr_pusch_level_21) + (lpqul2.sinr_pusch_level_22)))),2) LTE_5544b,
  round(to_number(decode( (lpqul2.ue_pwr_headroom_pusch_level1 + lpqul2.ue_pwr_headroom_pusch_level2 + lpqul2.ue_pwr_headroom_pusch_level3 + lpqul2.ue_pwr_headroom_pusch_level4 + lpqul2.ue_pwr_headroom_pusch_level5 + lpqul2.ue_pwr_headroom_pusch_level6 + lpqul2.ue_pwr_headroom_pusch_level7 + lpqul2.ue_pwr_headroom_pusch_level8 + lpqul2.ue_pwr_headroom_pusch_level9 + lpqul2.ue_pwr_headroom_pusch_level10 + lpqul2.ue_pwr_headroom_pusch_level11 + lpqul2.ue_pwr_headroom_pusch_level12 + lpqul2.ue_pwr_headroom_pusch_level13 + lpqul2.ue_pwr_headroom_pusch_level14 + lpqul2.ue_pwr_headroom_pusch_level15 + lpqul2.ue_pwr_headroom_pusch_level16 + lpqul2.ue_pwr_headroom_pusch_level17 + lpqul2.ue_pwr_headroom_pusch_level18 + lpqul2.ue_pwr_headroom_pusch_level19 + lpqul2.ue_pwr_headroom_pusch_level20 + lpqul2.ue_pwr_headroom_pusch_level21 + lpqul2.ue_pwr_headroom_pusch_level22 + lpqul2.ue_pwr_headroom_pusch_level23 + lpqul2.ue_pwr_headroom_pusch_level24 + lpqul2.ue_pwr_headroom_pusch_level25 + lpqul2.ue_pwr_headroom_pusch_level26 + lpqul2.ue_pwr_headroom_pusch_level27 + lpqul2.ue_pwr_headroom_pusch_level28 + lpqul2.ue_pwr_headroom_pusch_level29 + lpqul2.ue_pwr_headroom_pusch_level30 + lpqul2.ue_pwr_headroom_pusch_level31 + lpqul2.ue_pwr_headroom_pusch_level32),0,null, ( - 22*lpqul2.ue_pwr_headroom_pusch_level1 - 20*lpqul2.ue_pwr_headroom_pusch_level2 - 18*lpqul2.ue_pwr_headroom_pusch_level3 - 16*lpqul2.ue_pwr_headroom_pusch_level4 - 14*lpqul2.ue_pwr_headroom_pusch_level5 - 12*lpqul2.ue_pwr_headroom_pusch_level6 - 10*lpqul2.ue_pwr_headroom_pusch_level7 - 8*lpqul2.ue_pwr_headroom_pusch_level8 - 6*lpqul2.ue_pwr_headroom_pusch_level9 - 4*lpqul2.ue_pwr_headroom_pusch_level10 - 2*lpqul2.ue_pwr_headroom_pusch_level11 + 0*lpqul2.ue_pwr_headroom_pusch_level12 + 2*lpqul2.ue_pwr_headroom_pusch_level13 + 4*lpqul2.ue_pwr_headroom_pusch_level14 + 6*lpqul2.ue_pwr_headroom_pusch_level15 + 8*lpqul2.ue_pwr_headroom_pusch_level16 + 10*lpqul2.ue_pwr_headroom_pusch_level17 + 12*lpqul2.ue_pwr_headroom_pusch_level18 + 14*lpqul2.ue_pwr_headroom_pusch_level19 + 16*lpqul2.ue_pwr_headroom_pusch_level20 + 18*lpqul2.ue_pwr_headroom_pusch_level21 + 20*lpqul2.ue_pwr_headroom_pusch_level22 + 22*lpqul2.ue_pwr_headroom_pusch_level23 + 24*lpqul2.ue_pwr_headroom_pusch_level24 + 26*lpqul2.ue_pwr_headroom_pusch_level25 + 28*lpqul2.ue_pwr_headroom_pusch_level26 + 30*lpqul2.ue_pwr_headroom_pusch_level27 + 32*lpqul2.ue_pwr_headroom_pusch_level28 + 34*lpqul2.ue_pwr_headroom_pusch_level29 + 36*lpqul2.ue_pwr_headroom_pusch_level30 + 38*lpqul2.ue_pwr_headroom_pusch_level31 + 39*lpqul2.ue_pwr_headroom_pusch_level32) / (lpqul2.ue_pwr_headroom_pusch_level1 + lpqul2.ue_pwr_headroom_pusch_level2 + lpqul2.ue_pwr_headroom_pusch_level3 + lpqul2.ue_pwr_headroom_pusch_level4 + lpqul2.ue_pwr_headroom_pusch_level5 + lpqul2.ue_pwr_headroom_pusch_level6 + lpqul2.ue_pwr_headroom_pusch_level7 + lpqul2.ue_pwr_headroom_pusch_level8 + lpqul2.ue_pwr_headroom_pusch_level9 + lpqul2.ue_pwr_headroom_pusch_level10 + lpqul2.ue_pwr_headroom_pusch_level11 + lpqul2.ue_pwr_headroom_pusch_level12 + lpqul2.ue_pwr_headroom_pusch_level13 + lpqul2.ue_pwr_headroom_pusch_level14 + lpqul2.ue_pwr_headroom_pusch_level15 + lpqul2.ue_pwr_headroom_pusch_level16 + lpqul2.ue_pwr_headroom_pusch_level17 + lpqul2.ue_pwr_headroom_pusch_level18 + lpqul2.ue_pwr_headroom_pusch_level19 + lpqul2.ue_pwr_headroom_pusch_level20 + lpqul2.ue_pwr_headroom_pusch_level21 + lpqul2.ue_pwr_headroom_pusch_level22 + lpqul2.ue_pwr_headroom_pusch_level23 + lpqul2.ue_pwr_headroom_pusch_level24 + lpqul2.ue_pwr_headroom_pusch_level25 + lpqul2.ue_pwr_headroom_pusch_level26 + lpqul2.ue_pwr_headroom_pusch_level27 + lpqul2.ue_pwr_headroom_pusch_level28 + lpqul2.ue_pwr_headroom_pusch_level29 + lpqul2.ue_pwr_headroom_pusch_level30 + lpqul2.ue_pwr_headroom_pusch_level31 + lpqul2.ue_pwr_headroom_pusch_level32))),2) LTE_1073a,
  round(to_number(decode( (lcelld2.pdsch_trans_using_mcs0 + lcelld2.pdsch_trans_using_mcs1 + lcelld2.pdsch_trans_using_mcs2 + lcelld2.pdsch_trans_using_mcs3 + lcelld2.pdsch_trans_using_mcs4 + lcelld2.pdsch_trans_using_mcs5 + lcelld2.pdsch_trans_using_mcs6 + lcelld2.pdsch_trans_using_mcs7 + lcelld2.pdsch_trans_using_mcs8 + lcelld2.pdsch_trans_using_mcs9 + lcelld2.pdsch_trans_using_mcs10 + lcelld2.pdsch_trans_using_mcs11 + lcelld2.pdsch_trans_using_mcs12 + lcelld2.pdsch_trans_using_mcs13 + lcelld2.pdsch_trans_using_mcs14 + lcelld2.pdsch_trans_using_mcs15 + lcelld2.pdsch_trans_using_mcs16 + lcelld2.pdsch_trans_using_mcs17 + lcelld2.pdsch_trans_using_mcs18 + lcelld2.pdsch_trans_using_mcs19 + lcelld2.pdsch_trans_using_mcs20 + lcelld2.pdsch_trans_using_mcs21 + lcelld2.pdsch_trans_using_mcs22 + lcelld2.pdsch_trans_using_mcs23 + lcelld2.pdsch_trans_using_mcs24 + lcelld2.pdsch_trans_using_mcs25 + lcelld2.pdsch_trans_using_mcs26 + lcelld2.pdsch_trans_using_mcs27 + lcelld2.pdsch_trans_using_mcs28 + nvl(lcelld2.pdsch_trans_using_mcs29,0) + nvl(lcelld2.pdsch_trans_using_mcs30,0) + nvl(lcelld2.pdsch_trans_using_mcs31,0)),0,null, (0*lcelld2.pdsch_trans_using_mcs0 + 1*lcelld2.pdsch_trans_using_mcs1 + 2*lcelld2.pdsch_trans_using_mcs2 + 3*lcelld2.pdsch_trans_using_mcs3 + 4*lcelld2.pdsch_trans_using_mcs4 + 5*lcelld2.pdsch_trans_using_mcs5 + 6*lcelld2.pdsch_trans_using_mcs6 + 7*lcelld2.pdsch_trans_using_mcs7 + 8*lcelld2.pdsch_trans_using_mcs8 + 9*lcelld2.pdsch_trans_using_mcs9 + 10*lcelld2.pdsch_trans_using_mcs10 + 11*lcelld2.pdsch_trans_using_mcs11 + 12*lcelld2.pdsch_trans_using_mcs12 + 13*lcelld2.pdsch_trans_using_mcs13 + 14*lcelld2.pdsch_trans_using_mcs14 + 15*lcelld2.pdsch_trans_using_mcs15 + 16*lcelld2.pdsch_trans_using_mcs16 + 17*lcelld2.pdsch_trans_using_mcs17 + 18*lcelld2.pdsch_trans_using_mcs18 + 19*lcelld2.pdsch_trans_using_mcs19 + 20*lcelld2.pdsch_trans_using_mcs20 + 21*lcelld2.pdsch_trans_using_mcs21 + 22*lcelld2.pdsch_trans_using_mcs22 + 23*lcelld2.pdsch_trans_using_mcs23 + 24*lcelld2.pdsch_trans_using_mcs24 + 25*lcelld2.pdsch_trans_using_mcs25 + 26*lcelld2.pdsch_trans_using_mcs26 + 27*lcelld2.pdsch_trans_using_mcs27 + 28*lcelld2.pdsch_trans_using_mcs28 + 29*nvl(lcelld2.pdsch_trans_using_mcs29,0) + 30*nvl(lcelld2.pdsch_trans_using_mcs30,0) + 31*nvl(lcelld2.pdsch_trans_using_mcs31,0)) / (lcelld2.pdsch_trans_using_mcs0 + lcelld2.pdsch_trans_using_mcs1 + lcelld2.pdsch_trans_using_mcs2 + lcelld2.pdsch_trans_using_mcs3 + lcelld2.pdsch_trans_using_mcs4 + lcelld2.pdsch_trans_using_mcs5 + lcelld2.pdsch_trans_using_mcs6 + lcelld2.pdsch_trans_using_mcs7 + lcelld2.pdsch_trans_using_mcs8 + lcelld2.pdsch_trans_using_mcs9 + lcelld2.pdsch_trans_using_mcs10 + lcelld2.pdsch_trans_using_mcs11 + lcelld2.pdsch_trans_using_mcs12 + lcelld2.pdsch_trans_using_mcs13 + lcelld2.pdsch_trans_using_mcs14 + lcelld2.pdsch_trans_using_mcs15 + lcelld2.pdsch_trans_using_mcs16 + lcelld2.pdsch_trans_using_mcs17 + lcelld2.pdsch_trans_using_mcs18 + lcelld2.pdsch_trans_using_mcs19 + lcelld2.pdsch_trans_using_mcs20 + lcelld2.pdsch_trans_using_mcs21 + lcelld2.pdsch_trans_using_mcs22 + lcelld2.pdsch_trans_using_mcs23 + lcelld2.pdsch_trans_using_mcs24 + lcelld2.pdsch_trans_using_mcs25 + lcelld2.pdsch_trans_using_mcs26 + lcelld2.pdsch_trans_using_mcs27 + lcelld2.pdsch_trans_using_mcs28 + nvl(lcelld2.pdsch_trans_using_mcs29,0) + nvl(lcelld2.pdsch_trans_using_mcs30,0) + nvl(lcelld2.pdsch_trans_using_mcs31,0)))),1) LTE_1074a,
  round(to_number(decode( (lcelld2.pusch_trans_using_mcs0 + lcelld2.pusch_trans_using_mcs1 + lcelld2.pusch_trans_using_mcs2 + lcelld2.pusch_trans_using_mcs3 + lcelld2.pusch_trans_using_mcs4 + lcelld2.pusch_trans_using_mcs5 + lcelld2.pusch_trans_using_mcs6 + lcelld2.pusch_trans_using_mcs7 + lcelld2.pusch_trans_using_mcs8 + lcelld2.pusch_trans_using_mcs9 + lcelld2.pusch_trans_using_mcs10 + lcelld2.pusch_trans_using_mcs11 + lcelld2.pusch_trans_using_mcs12 + lcelld2.pusch_trans_using_mcs13 + lcelld2.pusch_trans_using_mcs14 + lcelld2.pusch_trans_using_mcs15 + lcelld2.pusch_trans_using_mcs16 + lcelld2.pusch_trans_using_mcs17 + lcelld2.pusch_trans_using_mcs18 + lcelld2.pusch_trans_using_mcs19 + lcelld2.pusch_trans_using_mcs20 + lcelld2.pusch_trans_using_mcs21 + lcelld2.pusch_trans_using_mcs22 + lcelld2.pusch_trans_using_mcs23 + lcelld2.pusch_trans_using_mcs24 + lcelld2.pusch_trans_using_mcs25 + lcelld2.pusch_trans_using_mcs26 + lcelld2.pusch_trans_using_mcs27 + lcelld2.pusch_trans_using_mcs28),0,null, (0*lcelld2.pusch_trans_using_mcs0 + 1*lcelld2.pusch_trans_using_mcs1 + 2*lcelld2.pusch_trans_using_mcs2 + 3*lcelld2.pusch_trans_using_mcs3 + 4*lcelld2.pusch_trans_using_mcs4 + 5*lcelld2.pusch_trans_using_mcs5 + 6*lcelld2.pusch_trans_using_mcs6 + 7*lcelld2.pusch_trans_using_mcs7 + 8*lcelld2.pusch_trans_using_mcs8 + 9*lcelld2.pusch_trans_using_mcs9 + 10*lcelld2.pusch_trans_using_mcs10 + 11*lcelld2.pusch_trans_using_mcs11 + 12*lcelld2.pusch_trans_using_mcs12 + 13*lcelld2.pusch_trans_using_mcs13 + 14*lcelld2.pusch_trans_using_mcs14 + 15*lcelld2.pusch_trans_using_mcs15 + 16*lcelld2.pusch_trans_using_mcs16 + 17*lcelld2.pusch_trans_using_mcs17 + 18*lcelld2.pusch_trans_using_mcs18 + 19*lcelld2.pusch_trans_using_mcs19 + 20*lcelld2.pusch_trans_using_mcs20 + 21*lcelld2.pusch_trans_using_mcs21 + 22*lcelld2.pusch_trans_using_mcs22 + 23*lcelld2.pusch_trans_using_mcs23 + 24*lcelld2.pusch_trans_using_mcs24 + 25*lcelld2.pusch_trans_using_mcs25 + 26*lcelld2.pusch_trans_using_mcs26 + 27*lcelld2.pusch_trans_using_mcs27 + 28*lcelld2.pusch_trans_using_mcs28) / (lcelld2.pusch_trans_using_mcs0 + lcelld2.pusch_trans_using_mcs1 + lcelld2.pusch_trans_using_mcs2 + lcelld2.pusch_trans_using_mcs3 + lcelld2.pusch_trans_using_mcs4 + lcelld2.pusch_trans_using_mcs5 + lcelld2.pusch_trans_using_mcs6 + lcelld2.pusch_trans_using_mcs7 + lcelld2.pusch_trans_using_mcs8 + lcelld2.pusch_trans_using_mcs9 + lcelld2.pusch_trans_using_mcs10 + lcelld2.pusch_trans_using_mcs11 + lcelld2.pusch_trans_using_mcs12 + lcelld2.pusch_trans_using_mcs13 + lcelld2.pusch_trans_using_mcs14 + lcelld2.pusch_trans_using_mcs15 + lcelld2.pusch_trans_using_mcs16 + lcelld2.pusch_trans_using_mcs17 + lcelld2.pusch_trans_using_mcs18 + lcelld2.pusch_trans_using_mcs19 + lcelld2.pusch_trans_using_mcs20 + lcelld2.pusch_trans_using_mcs21 + lcelld2.pusch_trans_using_mcs22 + lcelld2.pusch_trans_using_mcs23 + lcelld2.pusch_trans_using_mcs24 + lcelld2.pusch_trans_using_mcs25 + lcelld2.pusch_trans_using_mcs26 + lcelld2.pusch_trans_using_mcs27 + lcelld2.pusch_trans_using_mcs28))),1) LTE_1075a,
  round(to_number(decode((lcellr2.agg1_used_pdcch + lcellr2.agg2_used_pdcch + lcellr2.agg4_used_pdcch + lcellr2.agg8_used_pdcch),0,null, (lcellr2.agg1_used_pdcch + 2*lcellr2.agg2_used_pdcch + 4*lcellr2.agg4_used_pdcch + 8*lcellr2.agg8_used_pdcch) / (lcellr2.agg1_used_pdcch + lcellr2.agg2_used_pdcch + lcellr2.agg4_used_pdcch + lcellr2.agg8_used_pdcch))),2) LTE_1084a,
  round(to_number(decode((lcellr2.pdcch_1_ofdm_symbol + lcellr2.pdcch_2_ofdm_symbols + lcellr2.pdcch_3_ofdm_symbols),0,null, (lcellr2.pdcch_3_ofdm_symbols) / (lcellr2.pdcch_1_ofdm_symbol + lcellr2.pdcch_2_ofdm_symbols + lcellr2.pdcch_3_ofdm_symbols))),2) LTE_1085b,
  to_number(ls1ap2.s1_setup_att) LTE_5121a,
  round(to_number(100*decode((ls1ap2.s1_setup_att),0,null, (ls1ap2.s1_setup_succ) / (ls1ap2.s1_setup_att))),2) LTE_5014a,
  to_number(lip_ext.ifoutoctets15/1000) LTE_5072b,
  to_number((lip_ext.ifinoctets15 / 1000)) LTE_5073a,
  round(to_number(100*decode((lip_ext.ifinpackets15 + lip_ext.ifinerrors15),0,null, lip_ext.ifinerrors15 / (lip_ext.ifinpackets15 + lip_ext.ifinerrors15))),2) LTE_5076b,
  round(to_number(lvlip_ext.ifoutoctets15/1000),3) LTE_5663b,
  round(to_number((lvlip_ext.ifinoctets15)/1000),3) LTE_5662a,
  round(to_number(100*decode( lvlip_ext.ifinpackets15,0,null, lvlip_ext.ifinerrors15 / lvlip_ext.ifinpackets15)),2) LTE_755a,
  to_number(objcount.mrbts_count) LTE_750a,
  to_number(objcount.lnbts_count) LTE_751a,
  to_number(objcount.lncel_count) LTE_752a,
  to_number(alarms_ext.nbr_ca_crit) LTE_7001a,
  to_number(alarms_ext.nbr_ca_majr) LTE_7002a,
  to_number(alarms_ext.nbr_ca_minr) LTE_7003a,
  to_number(alarms_ext.nbr_ca_warn) LTE_7004a,
  to_number(alarms_ext.dur_ca_crit) LTE_7005a,
  to_number(alarms_ext.dur_ca_majr) LTE_7006a,
  to_number(alarms_ext.dur_ca_minr) LTE_7007a,
  to_number(alarms_ext.dur_ca_warn) LTE_7008a,
  round(to_number(decode(objcount.lncel_count,0,null, alarms_ext.nbr_ca_crit/objcount.lncel_count)),1) LTE_7021a,
  round(to_number(decode(objcount.lncel_count,0,null, alarms_ext.nbr_ca_majr/objcount.lncel_count)),1) LTE_7022a,
  round(to_number(decode(objcount.lncel_count,0,null, alarms_ext.nbr_ca_minr/objcount.lncel_count)),1) LTE_7023a,
  round(to_number(decode(objcount.lncel_count,0,null, alarms_ext.nbr_ca_warn/objcount.lncel_count)),1) LTE_7024a,
  to_number(alarms_ext.nbr_ca_com) LTE_7009a,
  to_number(alarms_ext.nbr_ca_env) LTE_7010a,
  to_number(alarms_ext.nbr_ca_equi) LTE_7011a,
  to_number(alarms_ext.nbr_ca_pros) LTE_7012a,
  to_number(alarms_ext.nbr_ca_qos) LTE_7013a,
  to_number(alarms_ext.nbr_alarms_ext) LTE_7400a,
  to_number(alarms_ext.nbr_alarms_bsf) LTE_7650a,
  to_number(alarms_ext.nbr_alarms_bsd) LTE_7651a,
  to_number(alarms_ext.nbr_alarms_bsn) LTE_7652a,
  to_number(alarms_ext.nbr_alarms_cf) LTE_7653a,
  to_number(alarms_ext.nbr_alarms_cd) LTE_7654a,
  to_number(alarms_ext.nbr_alarms_cn) LTE_7655a,
  to_number(alarms_ext.nbr_alarms_bscl) LTE_7656a,
  to_number(alarms_ext.nbr_alarms_bscd) LTE_7657a,
  to_number(alarms_ext.nbr_alarms_omcf) LTE_7658a
from
  utp_common_objects plmn,
  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(RACH_MSG3_CONTENTION) RACH_MSG3_CONTENTION
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(RACH_MSG3_CONTENTION) RACH_MSG3_CONTENTION
    from      
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lmac_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16      
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129   
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LMAC2,
  
  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(UE_REP_CQI_LEVEL_00) UE_REP_CQI_LEVEL_00,
    SUM(UE_REP_CQI_LEVEL_01) UE_REP_CQI_LEVEL_01,
    SUM(UE_REP_CQI_LEVEL_02) UE_REP_CQI_LEVEL_02,
    SUM(UE_REP_CQI_LEVEL_03) UE_REP_CQI_LEVEL_03,
    SUM(UE_REP_CQI_LEVEL_04) UE_REP_CQI_LEVEL_04,
    SUM(UE_REP_CQI_LEVEL_05) UE_REP_CQI_LEVEL_05,
    SUM(UE_REP_CQI_LEVEL_06) UE_REP_CQI_LEVEL_06,
    SUM(UE_REP_CQI_LEVEL_07) UE_REP_CQI_LEVEL_07,
    SUM(UE_REP_CQI_LEVEL_08) UE_REP_CQI_LEVEL_08,
    SUM(UE_REP_CQI_LEVEL_09) UE_REP_CQI_LEVEL_09,
    SUM(UE_REP_CQI_LEVEL_10) UE_REP_CQI_LEVEL_10,
    SUM(UE_REP_CQI_LEVEL_11) UE_REP_CQI_LEVEL_11,
    SUM(UE_REP_CQI_LEVEL_12) UE_REP_CQI_LEVEL_12,
    SUM(UE_REP_CQI_LEVEL_13) UE_REP_CQI_LEVEL_13,
    SUM(UE_REP_CQI_LEVEL_14) UE_REP_CQI_LEVEL_14,
    SUM(UE_REP_CQI_LEVEL_15) UE_REP_CQI_LEVEL_15,
    AVG(CQI_OFF_MEAN) CQI_OFF_MEAN,
    SUM(UE_256QAM_CONF_CQI_LEVEL_00) UE_256QAM_CONF_CQI_LEVEL_00,
    SUM(UE_256QAM_CONF_CQI_LEVEL_02) UE_256QAM_CONF_CQI_LEVEL_02,
    SUM(UE_256QAM_CONF_CQI_LEVEL_03) UE_256QAM_CONF_CQI_LEVEL_03,
    SUM(UE_256QAM_CONF_CQI_LEVEL_06) UE_256QAM_CONF_CQI_LEVEL_06,
    SUM(UE_256QAM_CONF_CQI_LEVEL_07) UE_256QAM_CONF_CQI_LEVEL_07,
    SUM(UE_256QAM_CONF_CQI_LEVEL_10) UE_256QAM_CONF_CQI_LEVEL_10,
    SUM(UE_256QAM_CONF_CQI_LEVEL_11) UE_256QAM_CONF_CQI_LEVEL_11,
    SUM(UE_256QAM_CONF_CQI_LEVEL_15) UE_256QAM_CONF_CQI_LEVEL_15,
    SUM(UE_256QAM_CONF_CQI_LEVEL_01) UE_256QAM_CONF_CQI_LEVEL_01,
    SUM(UE_256QAM_CONF_CQI_LEVEL_04) UE_256QAM_CONF_CQI_LEVEL_04,
    SUM(UE_256QAM_CONF_CQI_LEVEL_05) UE_256QAM_CONF_CQI_LEVEL_05,
    SUM(UE_256QAM_CONF_CQI_LEVEL_08) UE_256QAM_CONF_CQI_LEVEL_08,
    SUM(UE_256QAM_CONF_CQI_LEVEL_09) UE_256QAM_CONF_CQI_LEVEL_09,
    SUM(UE_256QAM_CONF_CQI_LEVEL_12) UE_256QAM_CONF_CQI_LEVEL_12,
    SUM(UE_256QAM_CONF_CQI_LEVEL_13) UE_256QAM_CONF_CQI_LEVEL_13,
    SUM(UE_256QAM_CONF_CQI_LEVEL_14) UE_256QAM_CONF_CQI_LEVEL_14
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(UE_REP_CQI_LEVEL_00) UE_REP_CQI_LEVEL_00,
      SUM(UE_REP_CQI_LEVEL_01) UE_REP_CQI_LEVEL_01,
      SUM(UE_REP_CQI_LEVEL_02) UE_REP_CQI_LEVEL_02,
      SUM(UE_REP_CQI_LEVEL_03) UE_REP_CQI_LEVEL_03,
      SUM(UE_REP_CQI_LEVEL_04) UE_REP_CQI_LEVEL_04,
      SUM(UE_REP_CQI_LEVEL_05) UE_REP_CQI_LEVEL_05,
      SUM(UE_REP_CQI_LEVEL_06) UE_REP_CQI_LEVEL_06,
      SUM(UE_REP_CQI_LEVEL_07) UE_REP_CQI_LEVEL_07,
      SUM(UE_REP_CQI_LEVEL_08) UE_REP_CQI_LEVEL_08,
      SUM(UE_REP_CQI_LEVEL_09) UE_REP_CQI_LEVEL_09,
      SUM(UE_REP_CQI_LEVEL_10) UE_REP_CQI_LEVEL_10,
      SUM(UE_REP_CQI_LEVEL_11) UE_REP_CQI_LEVEL_11,
      SUM(UE_REP_CQI_LEVEL_12) UE_REP_CQI_LEVEL_12,
      SUM(UE_REP_CQI_LEVEL_13) UE_REP_CQI_LEVEL_13,
      SUM(UE_REP_CQI_LEVEL_14) UE_REP_CQI_LEVEL_14,
      SUM(UE_REP_CQI_LEVEL_15) UE_REP_CQI_LEVEL_15,
      AVG(CQI_OFF_MEAN) CQI_OFF_MEAN,
      SUM(UE_256QAM_CONF_CQI_LEVEL_00) UE_256QAM_CONF_CQI_LEVEL_00,
      SUM(UE_256QAM_CONF_CQI_LEVEL_02) UE_256QAM_CONF_CQI_LEVEL_02,
      SUM(UE_256QAM_CONF_CQI_LEVEL_03) UE_256QAM_CONF_CQI_LEVEL_03,
      SUM(UE_256QAM_CONF_CQI_LEVEL_06) UE_256QAM_CONF_CQI_LEVEL_06,
      SUM(UE_256QAM_CONF_CQI_LEVEL_07) UE_256QAM_CONF_CQI_LEVEL_07,
      SUM(UE_256QAM_CONF_CQI_LEVEL_10) UE_256QAM_CONF_CQI_LEVEL_10,
      SUM(UE_256QAM_CONF_CQI_LEVEL_11) UE_256QAM_CONF_CQI_LEVEL_11,
      SUM(UE_256QAM_CONF_CQI_LEVEL_15) UE_256QAM_CONF_CQI_LEVEL_15,
      SUM(UE_256QAM_CONF_CQI_LEVEL_01) UE_256QAM_CONF_CQI_LEVEL_01,
      SUM(UE_256QAM_CONF_CQI_LEVEL_04) UE_256QAM_CONF_CQI_LEVEL_04,
      SUM(UE_256QAM_CONF_CQI_LEVEL_05) UE_256QAM_CONF_CQI_LEVEL_05,
      SUM(UE_256QAM_CONF_CQI_LEVEL_08) UE_256QAM_CONF_CQI_LEVEL_08,
      SUM(UE_256QAM_CONF_CQI_LEVEL_09) UE_256QAM_CONF_CQI_LEVEL_09,
      SUM(UE_256QAM_CONF_CQI_LEVEL_12) UE_256QAM_CONF_CQI_LEVEL_12,
      SUM(UE_256QAM_CONF_CQI_LEVEL_13) UE_256QAM_CONF_CQI_LEVEL_13,
      SUM(UE_256QAM_CONF_CQI_LEVEL_14) UE_256QAM_CONF_CQI_LEVEL_14
    from          
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",
      noklte_ps_lpqdl_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LPQDL2,
  
  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(SIGN_CONN_ESTAB_COMP) SIGN_CONN_ESTAB_COMP,
    SUM(EPC_INIT_TO_IDLE_UE_NORM_REL) EPC_INIT_TO_IDLE_UE_NORM_REL,
    SUM(EPC_INIT_TO_IDLE_DETACH) EPC_INIT_TO_IDLE_DETACH,
    SUM(EPC_INIT_TO_IDLE_RNL) EPC_INIT_TO_IDLE_RNL,
    SUM(EPC_INIT_TO_IDLE_OTHER) EPC_INIT_TO_IDLE_OTHER,
    SUM(ENB_INIT_TO_IDLE_NORM_REL) ENB_INIT_TO_IDLE_NORM_REL,
    SUM(ENB_INIT_TO_IDLE_RNL) ENB_INIT_TO_IDLE_RNL,
    SUM(ENB_INIT_TO_IDLE_OTHER) ENB_INIT_TO_IDLE_OTHER,
    SUM(SIGN_CONN_ESTAB_ATT_MO_S) SIGN_CONN_ESTAB_ATT_MO_S,
    SUM(SIGN_CONN_ESTAB_ATT_MT) SIGN_CONN_ESTAB_ATT_MT,
    SUM(SIGN_CONN_ESTAB_ATT_MO_D) SIGN_CONN_ESTAB_ATT_MO_D,
    SUM(SIGN_CONN_ESTAB_ATT_OTHERS) SIGN_CONN_ESTAB_ATT_OTHERS,
    SUM(SIGN_CONN_ESTAB_ATT_EMG) SIGN_CONN_ESTAB_ATT_EMG,
    SUM(PRE_EMPT_UE_CONTEXT_NON_GBR) PRE_EMPT_UE_CONTEXT_NON_GBR,
    SUM(SIGN_CONN_ESTAB_ATT_HIPRIO) SIGN_CONN_ESTAB_ATT_HIPRIO,
    SUM(SIGN_CONN_ESTAB_ATT_DEL_TOL) SIGN_CONN_ESTAB_ATT_DEL_TOL,
    SUM(S1_SIGN_CONN_ESTAB_ATT_UE) S1_SIGN_CONN_ESTAB_ATT_UE,
    SUM(S1_SIGN_CONN_ESTAB_SUCC_UE) S1_SIGN_CONN_ESTAB_SUCC_UE
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(SIGN_CONN_ESTAB_COMP) SIGN_CONN_ESTAB_COMP,
      SUM(EPC_INIT_TO_IDLE_UE_NORM_REL) EPC_INIT_TO_IDLE_UE_NORM_REL,
      SUM(EPC_INIT_TO_IDLE_DETACH) EPC_INIT_TO_IDLE_DETACH,
      SUM(EPC_INIT_TO_IDLE_RNL) EPC_INIT_TO_IDLE_RNL,
      SUM(EPC_INIT_TO_IDLE_OTHER) EPC_INIT_TO_IDLE_OTHER,
      SUM(ENB_INIT_TO_IDLE_NORM_REL) ENB_INIT_TO_IDLE_NORM_REL,
      SUM(ENB_INIT_TO_IDLE_RNL) ENB_INIT_TO_IDLE_RNL,
      SUM(ENB_INIT_TO_IDLE_OTHER) ENB_INIT_TO_IDLE_OTHER,
      SUM(SIGN_CONN_ESTAB_ATT_MO_S) SIGN_CONN_ESTAB_ATT_MO_S,
      SUM(SIGN_CONN_ESTAB_ATT_MT) SIGN_CONN_ESTAB_ATT_MT,
      SUM(SIGN_CONN_ESTAB_ATT_MO_D) SIGN_CONN_ESTAB_ATT_MO_D,
      SUM(SIGN_CONN_ESTAB_ATT_OTHERS) SIGN_CONN_ESTAB_ATT_OTHERS,
      SUM(SIGN_CONN_ESTAB_ATT_EMG) SIGN_CONN_ESTAB_ATT_EMG,
      SUM(PRE_EMPT_UE_CONTEXT_NON_GBR) PRE_EMPT_UE_CONTEXT_NON_GBR,
      SUM(SIGN_CONN_ESTAB_ATT_HIPRIO) SIGN_CONN_ESTAB_ATT_HIPRIO,
      SUM(SIGN_CONN_ESTAB_ATT_DEL_TOL) SIGN_CONN_ESTAB_ATT_DEL_TOL,
      SUM(S1_SIGN_CONN_ESTAB_ATT_UE) S1_SIGN_CONN_ESTAB_ATT_UE,
      SUM(S1_SIGN_CONN_ESTAB_SUCC_UE) S1_SIGN_CONN_ESTAB_SUCC_UE
    from
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",
      noklte_ps_luest_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16
      
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129   
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LUEST2,
  
  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(INTRA_ENB_HO_PREP) INTRA_ENB_HO_PREP,
    SUM(ATT_INTRA_ENB_HO) ATT_INTRA_ENB_HO,
    SUM(SUCC_INTRA_ENB_HO) SUCC_INTRA_ENB_HO
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(INTRA_ENB_HO_PREP) INTRA_ENB_HO_PREP,
      SUM(ATT_INTRA_ENB_HO) ATT_INTRA_ENB_HO,
      SUM(SUCC_INTRA_ENB_HO) SUCC_INTRA_ENB_HO
    from    
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",      
      noklte_ps_lianbho_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129      
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LIANBHO2,
    
  (
  select
    a.period_start_time,
    a.plmn_gid,
    MAX(ENB_LOAD_ACT_UE_MAX) ENB_LOAD_ACT_UE_MAX,
    SUM(SUM_ACTIVE_UE_ENB) SUM_ACTIVE_UE_ENB,
    SUM(DENOM_ACTIVE_UE_ENB) DENOM_ACTIVE_UE_ENB
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      MAX(ENB_LOAD_ACT_UE_MAX) ENB_LOAD_ACT_UE_MAX,
      SUM(SUM_ACTIVE_UE_ENB) SUM_ACTIVE_UE_ENB,
      SUM(DENOM_ACTIVE_UE_ENB) DENOM_ACTIVE_UE_ENB
    from
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",
      noklte_ps_lenbld_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16
      
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129
    
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LENBLD2,
  
  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(SAMPLES_CELL_AVAIL) SAMPLES_CELL_AVAIL,
    SUM(SAMPLES_CELL_PLAN_UNAVAIL) SAMPLES_CELL_PLAN_UNAVAIL,
    SUM(DENOM_CELL_AVAIL) DENOM_CELL_AVAIL
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(SAMPLES_CELL_AVAIL) SAMPLES_CELL_AVAIL,
      SUM(SAMPLES_CELL_PLAN_UNAVAIL) SAMPLES_CELL_PLAN_UNAVAIL,
      SUM(DENOM_CELL_AVAIL) DENOM_CELL_AVAIL
    from
      
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",
    
      noklte_ps_lcelav_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16
      
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129
    
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LCELAV2,
  
  
  (
  select
    a.period_start_time,
    a.plmn_gid,
    AVG(UE_DRB_DL_DATA_QCI_1) UE_DRB_DL_DATA_QCI_1,
    SUM(PDSCH_TRANS_USING_MCS29) PDSCH_TRANS_USING_MCS29,
    SUM(PDSCH_TRANS_USING_MCS30) PDSCH_TRANS_USING_MCS30,
    SUM(PDSCH_TRANS_USING_MCS31) PDSCH_TRANS_USING_MCS31,
    SUM(PDSCH_TRANS_NACK_MCS29) PDSCH_TRANS_NACK_MCS29,
    SUM(PDSCH_TRANS_NACK_MCS30) PDSCH_TRANS_NACK_MCS30,
    SUM(PDSCH_TRANS_NACK_MCS31) PDSCH_TRANS_NACK_MCS31,
    SUM(TB_BUND2_NACK_PDSCH_MCS29) TB_BUND2_NACK_PDSCH_MCS29,
    SUM(TB_BUND3_NACK_PDSCH_MCS29) TB_BUND3_NACK_PDSCH_MCS29,
    SUM(TB_BUND4_NACK_PDSCH_MCS29) TB_BUND4_NACK_PDSCH_MCS29,
    SUM(TB_BUND2_NACK_PDSCH_MCS30) TB_BUND2_NACK_PDSCH_MCS30,
    SUM(TB_BUND3_NACK_PDSCH_MCS30) TB_BUND3_NACK_PDSCH_MCS30,
    SUM(TB_BUND4_NACK_PDSCH_MCS30) TB_BUND4_NACK_PDSCH_MCS30,
    SUM(TB_BUND2_NACK_PDSCH_MCS31) TB_BUND2_NACK_PDSCH_MCS31,
    SUM(TB_BUND3_NACK_PDSCH_MCS31) TB_BUND3_NACK_PDSCH_MCS31,
    SUM(TB_BUND4_NACK_PDSCH_MCS31) TB_BUND4_NACK_PDSCH_MCS31,
    SUM(SUM_ACTIVE_UE_DATA_DL) SUM_ACTIVE_UE_DATA_DL,
    SUM(DENOM_ACTIVE_UE_DATA_DL) DENOM_ACTIVE_UE_DATA_DL,
    SUM(SUM_ACTIVE_UE_DATA_UL) SUM_ACTIVE_UE_DATA_UL,
    SUM(DENOM_ACTIVE_UE_DATA_UL) DENOM_ACTIVE_UE_DATA_UL,
    AVG(PDCP_RET_DL_DEL_MEAN_QCI_1) PDCP_RET_DL_DEL_MEAN_QCI_1,
    AVG(PDCP_RET_DL_DEL_MEAN_QCI_2) PDCP_RET_DL_DEL_MEAN_QCI_2,
    AVG(PDCP_RET_DL_DEL_MEAN_QCI_3) PDCP_RET_DL_DEL_MEAN_QCI_3,
    AVG(PDCP_RET_DL_DEL_MEAN_QCI_4) PDCP_RET_DL_DEL_MEAN_QCI_4,
    SUM(RACH_STP_ATT_DEDICATED) RACH_STP_ATT_DEDICATED,
    AVG(PDCP_RET_DL_DEL_MEAN_QCI_5) PDCP_RET_DL_DEL_MEAN_QCI_5,
    AVG(PDCP_RET_DL_DEL_MEAN_QCI_6) PDCP_RET_DL_DEL_MEAN_QCI_6,
    AVG(PDCP_RET_DL_DEL_MEAN_QCI_7) PDCP_RET_DL_DEL_MEAN_QCI_7,
    AVG(PDCP_RET_DL_DEL_MEAN_QCI_8) PDCP_RET_DL_DEL_MEAN_QCI_8,
    AVG(PDCP_RET_DL_DEL_MEAN_QCI_9) PDCP_RET_DL_DEL_MEAN_QCI_9,
    SUM(SUM_RRC_CONN_UE) SUM_RRC_CONN_UE,
    SUM(DENOM_RRC_CONN_UE) DENOM_RRC_CONN_UE,
    SUM(TB_BUND2_NACK_PDSCH_MCS0) TB_BUND2_NACK_PDSCH_MCS0,
    SUM(TB_BUND2_NACK_PDSCH_MCS1) TB_BUND2_NACK_PDSCH_MCS1,
    SUM(TB_BUND2_NACK_PDSCH_MCS2) TB_BUND2_NACK_PDSCH_MCS2,
    SUM(TB_BUND2_NACK_PDSCH_MCS3) TB_BUND2_NACK_PDSCH_MCS3,
    SUM(TB_BUND2_NACK_PDSCH_MCS4) TB_BUND2_NACK_PDSCH_MCS4,
    SUM(TB_BUND2_NACK_PDSCH_MCS5) TB_BUND2_NACK_PDSCH_MCS5,
    SUM(TB_BUND2_NACK_PDSCH_MCS6) TB_BUND2_NACK_PDSCH_MCS6,
    SUM(TB_BUND2_NACK_PDSCH_MCS7) TB_BUND2_NACK_PDSCH_MCS7,
    SUM(TB_BUND2_NACK_PDSCH_MCS8) TB_BUND2_NACK_PDSCH_MCS8,
    SUM(TB_BUND2_NACK_PDSCH_MCS9) TB_BUND2_NACK_PDSCH_MCS9,
    SUM(TB_BUND2_NACK_PDSCH_MCS10) TB_BUND2_NACK_PDSCH_MCS10,
    SUM(TB_BUND2_NACK_PDSCH_MCS11) TB_BUND2_NACK_PDSCH_MCS11,
    SUM(TB_BUND2_NACK_PDSCH_MCS12) TB_BUND2_NACK_PDSCH_MCS12,
    SUM(TB_BUND2_NACK_PDSCH_MCS13) TB_BUND2_NACK_PDSCH_MCS13,
    SUM(TB_BUND2_NACK_PDSCH_MCS14) TB_BUND2_NACK_PDSCH_MCS14,
    SUM(TB_BUND2_NACK_PDSCH_MCS15) TB_BUND2_NACK_PDSCH_MCS15,
    SUM(TB_BUND2_NACK_PDSCH_MCS16) TB_BUND2_NACK_PDSCH_MCS16,
    SUM(TB_BUND2_NACK_PDSCH_MCS17) TB_BUND2_NACK_PDSCH_MCS17,
    SUM(TB_BUND2_NACK_PDSCH_MCS18) TB_BUND2_NACK_PDSCH_MCS18,
    SUM(TB_BUND2_NACK_PDSCH_MCS19) TB_BUND2_NACK_PDSCH_MCS19,
    SUM(TB_BUND2_NACK_PDSCH_MCS20) TB_BUND2_NACK_PDSCH_MCS20,
    SUM(TB_BUND2_NACK_PDSCH_MCS21) TB_BUND2_NACK_PDSCH_MCS21,
    SUM(TB_BUND2_NACK_PDSCH_MCS22) TB_BUND2_NACK_PDSCH_MCS22,
    SUM(TB_BUND2_NACK_PDSCH_MCS23) TB_BUND2_NACK_PDSCH_MCS23,
    SUM(TB_BUND2_NACK_PDSCH_MCS24) TB_BUND2_NACK_PDSCH_MCS24,
    SUM(TB_BUND2_NACK_PDSCH_MCS25) TB_BUND2_NACK_PDSCH_MCS25,
    SUM(TB_BUND2_NACK_PDSCH_MCS26) TB_BUND2_NACK_PDSCH_MCS26,
    SUM(TB_BUND2_NACK_PDSCH_MCS27) TB_BUND2_NACK_PDSCH_MCS27,
    SUM(TB_BUND2_NACK_PDSCH_MCS28) TB_BUND2_NACK_PDSCH_MCS28,
    SUM(TB_BUND3_NACK_PDSCH_MCS0) TB_BUND3_NACK_PDSCH_MCS0,
    SUM(TB_BUND3_NACK_PDSCH_MCS1) TB_BUND3_NACK_PDSCH_MCS1,
    SUM(TB_BUND3_NACK_PDSCH_MCS2) TB_BUND3_NACK_PDSCH_MCS2,
    SUM(TB_BUND3_NACK_PDSCH_MCS3) TB_BUND3_NACK_PDSCH_MCS3,
    SUM(TB_BUND3_NACK_PDSCH_MCS4) TB_BUND3_NACK_PDSCH_MCS4,
    SUM(TB_BUND3_NACK_PDSCH_MCS5) TB_BUND3_NACK_PDSCH_MCS5,
    SUM(TB_BUND3_NACK_PDSCH_MCS6) TB_BUND3_NACK_PDSCH_MCS6,
    SUM(TB_BUND3_NACK_PDSCH_MCS7) TB_BUND3_NACK_PDSCH_MCS7,
    SUM(TB_BUND3_NACK_PDSCH_MCS8) TB_BUND3_NACK_PDSCH_MCS8,
    SUM(TB_BUND3_NACK_PDSCH_MCS9) TB_BUND3_NACK_PDSCH_MCS9,
    SUM(TB_BUND3_NACK_PDSCH_MCS10) TB_BUND3_NACK_PDSCH_MCS10,
    SUM(TB_BUND3_NACK_PDSCH_MCS11) TB_BUND3_NACK_PDSCH_MCS11,
    SUM(TB_BUND3_NACK_PDSCH_MCS12) TB_BUND3_NACK_PDSCH_MCS12,
    SUM(TB_BUND3_NACK_PDSCH_MCS13) TB_BUND3_NACK_PDSCH_MCS13,
    SUM(TB_BUND3_NACK_PDSCH_MCS14) TB_BUND3_NACK_PDSCH_MCS14,
    SUM(TB_BUND3_NACK_PDSCH_MCS15) TB_BUND3_NACK_PDSCH_MCS15,
    SUM(TB_BUND3_NACK_PDSCH_MCS16) TB_BUND3_NACK_PDSCH_MCS16,
    SUM(TB_BUND3_NACK_PDSCH_MCS17) TB_BUND3_NACK_PDSCH_MCS17,
    SUM(TB_BUND3_NACK_PDSCH_MCS18) TB_BUND3_NACK_PDSCH_MCS18,
    SUM(TB_BUND3_NACK_PDSCH_MCS19) TB_BUND3_NACK_PDSCH_MCS19,
    SUM(TB_BUND3_NACK_PDSCH_MCS20) TB_BUND3_NACK_PDSCH_MCS20,
    SUM(TB_BUND3_NACK_PDSCH_MCS21) TB_BUND3_NACK_PDSCH_MCS21,
    SUM(TB_BUND3_NACK_PDSCH_MCS22) TB_BUND3_NACK_PDSCH_MCS22,
    SUM(TB_BUND3_NACK_PDSCH_MCS23) TB_BUND3_NACK_PDSCH_MCS23,
    SUM(TB_BUND3_NACK_PDSCH_MCS24) TB_BUND3_NACK_PDSCH_MCS24,
    SUM(TB_BUND3_NACK_PDSCH_MCS25) TB_BUND3_NACK_PDSCH_MCS25,
    SUM(TB_BUND3_NACK_PDSCH_MCS26) TB_BUND3_NACK_PDSCH_MCS26,
    SUM(TB_BUND3_NACK_PDSCH_MCS27) TB_BUND3_NACK_PDSCH_MCS27,
    SUM(TB_BUND3_NACK_PDSCH_MCS28) TB_BUND3_NACK_PDSCH_MCS28,
    SUM(TB_BUND4_NACK_PDSCH_MCS0) TB_BUND4_NACK_PDSCH_MCS0,
    SUM(TB_BUND4_NACK_PDSCH_MCS1) TB_BUND4_NACK_PDSCH_MCS1,
    SUM(TB_BUND4_NACK_PDSCH_MCS2) TB_BUND4_NACK_PDSCH_MCS2,
    SUM(TB_BUND4_NACK_PDSCH_MCS3) TB_BUND4_NACK_PDSCH_MCS3,
    SUM(TB_BUND4_NACK_PDSCH_MCS4) TB_BUND4_NACK_PDSCH_MCS4,
    SUM(TB_BUND4_NACK_PDSCH_MCS5) TB_BUND4_NACK_PDSCH_MCS5,
    SUM(TB_BUND4_NACK_PDSCH_MCS6) TB_BUND4_NACK_PDSCH_MCS6,
    SUM(TB_BUND4_NACK_PDSCH_MCS7) TB_BUND4_NACK_PDSCH_MCS7,
    SUM(TB_BUND4_NACK_PDSCH_MCS8) TB_BUND4_NACK_PDSCH_MCS8,
    SUM(TB_BUND4_NACK_PDSCH_MCS9) TB_BUND4_NACK_PDSCH_MCS9,
    SUM(TB_BUND4_NACK_PDSCH_MCS10) TB_BUND4_NACK_PDSCH_MCS10,
    SUM(TB_BUND4_NACK_PDSCH_MCS11) TB_BUND4_NACK_PDSCH_MCS11,
    SUM(TB_BUND4_NACK_PDSCH_MCS12) TB_BUND4_NACK_PDSCH_MCS12,
    SUM(TB_BUND4_NACK_PDSCH_MCS13) TB_BUND4_NACK_PDSCH_MCS13,
    SUM(TB_BUND4_NACK_PDSCH_MCS14) TB_BUND4_NACK_PDSCH_MCS14,
    SUM(TB_BUND4_NACK_PDSCH_MCS15) TB_BUND4_NACK_PDSCH_MCS15,
    SUM(TB_BUND4_NACK_PDSCH_MCS16) TB_BUND4_NACK_PDSCH_MCS16,
    SUM(TB_BUND4_NACK_PDSCH_MCS17) TB_BUND4_NACK_PDSCH_MCS17,
    SUM(TB_BUND4_NACK_PDSCH_MCS18) TB_BUND4_NACK_PDSCH_MCS18,
    SUM(TB_BUND4_NACK_PDSCH_MCS19) TB_BUND4_NACK_PDSCH_MCS19,
    SUM(TB_BUND4_NACK_PDSCH_MCS20) TB_BUND4_NACK_PDSCH_MCS20,
    SUM(TB_BUND4_NACK_PDSCH_MCS21) TB_BUND4_NACK_PDSCH_MCS21,
    SUM(TB_BUND4_NACK_PDSCH_MCS22) TB_BUND4_NACK_PDSCH_MCS22,
    SUM(TB_BUND4_NACK_PDSCH_MCS23) TB_BUND4_NACK_PDSCH_MCS23,
    SUM(TB_BUND4_NACK_PDSCH_MCS24) TB_BUND4_NACK_PDSCH_MCS24,
    SUM(TB_BUND4_NACK_PDSCH_MCS25) TB_BUND4_NACK_PDSCH_MCS25,
    SUM(TB_BUND4_NACK_PDSCH_MCS26) TB_BUND4_NACK_PDSCH_MCS26,
    SUM(TB_BUND4_NACK_PDSCH_MCS27) TB_BUND4_NACK_PDSCH_MCS27,
    SUM(TB_BUND4_NACK_PDSCH_MCS28) TB_BUND4_NACK_PDSCH_MCS28,
    AVG(UE_DRB_UL_DATA_QCI_1) UE_DRB_UL_DATA_QCI_1,
    AVG(CA_DL_CAP_UE_AVG) CA_DL_CAP_UE_AVG,
    AVG(CA_SCELL_ACTIVE_UE_AVG) CA_SCELL_ACTIVE_UE_AVG,
    AVG(CA_DL_CAP_UE_3CC_AVG) CA_DL_CAP_UE_3CC_AVG,
    AVG(CA_2SCELLS_ACTIVE_UE_AVG) CA_2SCELLS_ACTIVE_UE_AVG,
    AVG(PDCP_SDU_DELAY_DL_DTCH_MEAN) PDCP_SDU_DELAY_DL_DTCH_MEAN,
    AVG(PDCP_SDU_DELAY_UL_DTCH_MEAN) PDCP_SDU_DELAY_UL_DTCH_MEAN,
    SUM(RACH_STP_ATT_SMALL_MSG) RACH_STP_ATT_SMALL_MSG,
    SUM(RACH_STP_ATT_LARGE_MSG) RACH_STP_ATT_LARGE_MSG,
    SUM(RACH_STP_COMPLETIONS) RACH_STP_COMPLETIONS,
    SUM(PUSCH_TRANS_USING_MCS0) PUSCH_TRANS_USING_MCS0,
    SUM(PUSCH_TRANS_USING_MCS1) PUSCH_TRANS_USING_MCS1,
    SUM(PUSCH_TRANS_USING_MCS2) PUSCH_TRANS_USING_MCS2,
    SUM(PUSCH_TRANS_USING_MCS3) PUSCH_TRANS_USING_MCS3,
    SUM(PUSCH_TRANS_USING_MCS4) PUSCH_TRANS_USING_MCS4,
    SUM(PUSCH_TRANS_USING_MCS5) PUSCH_TRANS_USING_MCS5,
    SUM(PUSCH_TRANS_USING_MCS6) PUSCH_TRANS_USING_MCS6,
    SUM(PUSCH_TRANS_USING_MCS7) PUSCH_TRANS_USING_MCS7,
    SUM(PUSCH_TRANS_USING_MCS8) PUSCH_TRANS_USING_MCS8,
    SUM(PUSCH_TRANS_USING_MCS9) PUSCH_TRANS_USING_MCS9,
    SUM(PUSCH_TRANS_USING_MCS10) PUSCH_TRANS_USING_MCS10,
    SUM(PUSCH_TRANS_USING_MCS11) PUSCH_TRANS_USING_MCS11,
    SUM(PUSCH_TRANS_USING_MCS12) PUSCH_TRANS_USING_MCS12,
    SUM(PUSCH_TRANS_USING_MCS13) PUSCH_TRANS_USING_MCS13,
    SUM(PUSCH_TRANS_USING_MCS14) PUSCH_TRANS_USING_MCS14,
    SUM(PUSCH_TRANS_USING_MCS15) PUSCH_TRANS_USING_MCS15,
    SUM(PUSCH_TRANS_USING_MCS16) PUSCH_TRANS_USING_MCS16,
    SUM(PUSCH_TRANS_USING_MCS17) PUSCH_TRANS_USING_MCS17,
    SUM(PUSCH_TRANS_USING_MCS18) PUSCH_TRANS_USING_MCS18,
    SUM(PUSCH_TRANS_USING_MCS19) PUSCH_TRANS_USING_MCS19,
    SUM(PUSCH_TRANS_USING_MCS20) PUSCH_TRANS_USING_MCS20,
    SUM(PUSCH_TRANS_USING_MCS21) PUSCH_TRANS_USING_MCS21,
    SUM(PUSCH_TRANS_USING_MCS22) PUSCH_TRANS_USING_MCS22,
    SUM(PUSCH_TRANS_USING_MCS23) PUSCH_TRANS_USING_MCS23,
    SUM(PUSCH_TRANS_USING_MCS24) PUSCH_TRANS_USING_MCS24,
    SUM(PUSCH_TRANS_USING_MCS25) PUSCH_TRANS_USING_MCS25,
    SUM(PUSCH_TRANS_USING_MCS26) PUSCH_TRANS_USING_MCS26,
    SUM(PUSCH_TRANS_USING_MCS27) PUSCH_TRANS_USING_MCS27,
    SUM(PUSCH_TRANS_USING_MCS28) PUSCH_TRANS_USING_MCS28,
    SUM(PDSCH_TRANS_USING_MCS0) PDSCH_TRANS_USING_MCS0,
    SUM(PDSCH_TRANS_USING_MCS1) PDSCH_TRANS_USING_MCS1,
    SUM(PDSCH_TRANS_USING_MCS2) PDSCH_TRANS_USING_MCS2,
    SUM(PDSCH_TRANS_USING_MCS3) PDSCH_TRANS_USING_MCS3,
    SUM(PDSCH_TRANS_USING_MCS4) PDSCH_TRANS_USING_MCS4,
    SUM(PDSCH_TRANS_USING_MCS5) PDSCH_TRANS_USING_MCS5,
    SUM(PDSCH_TRANS_USING_MCS6) PDSCH_TRANS_USING_MCS6,
    SUM(PDSCH_TRANS_USING_MCS7) PDSCH_TRANS_USING_MCS7,
    SUM(PDSCH_TRANS_USING_MCS8) PDSCH_TRANS_USING_MCS8,
    SUM(PDSCH_TRANS_USING_MCS9) PDSCH_TRANS_USING_MCS9,
    SUM(PDSCH_TRANS_USING_MCS10) PDSCH_TRANS_USING_MCS10,
    SUM(PDSCH_TRANS_USING_MCS11) PDSCH_TRANS_USING_MCS11,
    SUM(PDSCH_TRANS_USING_MCS12) PDSCH_TRANS_USING_MCS12,
    SUM(PDSCH_TRANS_USING_MCS13) PDSCH_TRANS_USING_MCS13,
    SUM(PDSCH_TRANS_USING_MCS14) PDSCH_TRANS_USING_MCS14,
    SUM(PDSCH_TRANS_USING_MCS15) PDSCH_TRANS_USING_MCS15,
    SUM(PDSCH_TRANS_USING_MCS16) PDSCH_TRANS_USING_MCS16,
    SUM(PDSCH_TRANS_USING_MCS17) PDSCH_TRANS_USING_MCS17,
    SUM(PDSCH_TRANS_USING_MCS18) PDSCH_TRANS_USING_MCS18,
    SUM(PDSCH_TRANS_USING_MCS19) PDSCH_TRANS_USING_MCS19,
    SUM(PDSCH_TRANS_USING_MCS20) PDSCH_TRANS_USING_MCS20,
    SUM(PDSCH_TRANS_USING_MCS21) PDSCH_TRANS_USING_MCS21,
    SUM(PDSCH_TRANS_USING_MCS22) PDSCH_TRANS_USING_MCS22,
    SUM(PDSCH_TRANS_USING_MCS23) PDSCH_TRANS_USING_MCS23,
    SUM(PDSCH_TRANS_USING_MCS24) PDSCH_TRANS_USING_MCS24,
    SUM(PDSCH_TRANS_USING_MCS25) PDSCH_TRANS_USING_MCS25,
    SUM(PDSCH_TRANS_USING_MCS26) PDSCH_TRANS_USING_MCS26,
    SUM(PDSCH_TRANS_USING_MCS27) PDSCH_TRANS_USING_MCS27,
    SUM(PDSCH_TRANS_USING_MCS28) PDSCH_TRANS_USING_MCS28,
    SUM(PUSCH_TRANS_NACK_MCS0) PUSCH_TRANS_NACK_MCS0,
    SUM(PUSCH_TRANS_NACK_MCS1) PUSCH_TRANS_NACK_MCS1,
    SUM(PUSCH_TRANS_NACK_MCS2) PUSCH_TRANS_NACK_MCS2,
    SUM(PUSCH_TRANS_NACK_MCS3) PUSCH_TRANS_NACK_MCS3,
    SUM(PUSCH_TRANS_NACK_MCS4) PUSCH_TRANS_NACK_MCS4,
    SUM(PUSCH_TRANS_NACK_MCS5) PUSCH_TRANS_NACK_MCS5,
    SUM(PUSCH_TRANS_NACK_MCS6) PUSCH_TRANS_NACK_MCS6,
    SUM(PUSCH_TRANS_NACK_MCS7) PUSCH_TRANS_NACK_MCS7,
    SUM(PUSCH_TRANS_NACK_MCS8) PUSCH_TRANS_NACK_MCS8,
    SUM(PUSCH_TRANS_NACK_MCS9) PUSCH_TRANS_NACK_MCS9,
    SUM(PUSCH_TRANS_NACK_MCS10) PUSCH_TRANS_NACK_MCS10,
    SUM(PUSCH_TRANS_NACK_MCS11) PUSCH_TRANS_NACK_MCS11,
    SUM(PUSCH_TRANS_NACK_MCS12) PUSCH_TRANS_NACK_MCS12,
    SUM(PUSCH_TRANS_NACK_MCS13) PUSCH_TRANS_NACK_MCS13,
    SUM(PUSCH_TRANS_NACK_MCS14) PUSCH_TRANS_NACK_MCS14,
    SUM(PUSCH_TRANS_NACK_MCS15) PUSCH_TRANS_NACK_MCS15,
    SUM(PUSCH_TRANS_NACK_MCS16) PUSCH_TRANS_NACK_MCS16,
    SUM(PUSCH_TRANS_NACK_MCS17) PUSCH_TRANS_NACK_MCS17,
    SUM(PUSCH_TRANS_NACK_MCS18) PUSCH_TRANS_NACK_MCS18,
    SUM(PUSCH_TRANS_NACK_MCS19) PUSCH_TRANS_NACK_MCS19,
    SUM(PUSCH_TRANS_NACK_MCS20) PUSCH_TRANS_NACK_MCS20,
    SUM(PUSCH_TRANS_NACK_MCS21) PUSCH_TRANS_NACK_MCS21,
    SUM(PUSCH_TRANS_NACK_MCS22) PUSCH_TRANS_NACK_MCS22,
    SUM(PUSCH_TRANS_NACK_MCS23) PUSCH_TRANS_NACK_MCS23,
    SUM(PUSCH_TRANS_NACK_MCS24) PUSCH_TRANS_NACK_MCS24,
    SUM(PUSCH_TRANS_NACK_MCS25) PUSCH_TRANS_NACK_MCS25,
    SUM(PUSCH_TRANS_NACK_MCS26) PUSCH_TRANS_NACK_MCS26,
    SUM(PUSCH_TRANS_NACK_MCS27) PUSCH_TRANS_NACK_MCS27,
    SUM(PUSCH_TRANS_NACK_MCS28) PUSCH_TRANS_NACK_MCS28,
    SUM(PDSCH_TRANS_NACK_MCS0) PDSCH_TRANS_NACK_MCS0,
    SUM(PDSCH_TRANS_NACK_MCS1) PDSCH_TRANS_NACK_MCS1,
    SUM(PDSCH_TRANS_NACK_MCS2) PDSCH_TRANS_NACK_MCS2,
    SUM(PDSCH_TRANS_NACK_MCS3) PDSCH_TRANS_NACK_MCS3,
    SUM(PDSCH_TRANS_NACK_MCS4) PDSCH_TRANS_NACK_MCS4,
    SUM(PDSCH_TRANS_NACK_MCS5) PDSCH_TRANS_NACK_MCS5,
    SUM(PDSCH_TRANS_NACK_MCS6) PDSCH_TRANS_NACK_MCS6,
    SUM(PDSCH_TRANS_NACK_MCS7) PDSCH_TRANS_NACK_MCS7,
    SUM(PDSCH_TRANS_NACK_MCS8) PDSCH_TRANS_NACK_MCS8,
    SUM(PDSCH_TRANS_NACK_MCS9) PDSCH_TRANS_NACK_MCS9,
    SUM(PDSCH_TRANS_NACK_MCS10) PDSCH_TRANS_NACK_MCS10,
    SUM(PDSCH_TRANS_NACK_MCS11) PDSCH_TRANS_NACK_MCS11,
    SUM(PDSCH_TRANS_NACK_MCS12) PDSCH_TRANS_NACK_MCS12,
    SUM(PDSCH_TRANS_NACK_MCS13) PDSCH_TRANS_NACK_MCS13,
    SUM(PDSCH_TRANS_NACK_MCS14) PDSCH_TRANS_NACK_MCS14,
    SUM(PDSCH_TRANS_NACK_MCS15) PDSCH_TRANS_NACK_MCS15,
    SUM(PDSCH_TRANS_NACK_MCS16) PDSCH_TRANS_NACK_MCS16,
    SUM(PDSCH_TRANS_NACK_MCS17) PDSCH_TRANS_NACK_MCS17,
    SUM(PDSCH_TRANS_NACK_MCS18) PDSCH_TRANS_NACK_MCS18,
    SUM(PDSCH_TRANS_NACK_MCS19) PDSCH_TRANS_NACK_MCS19,
    SUM(PDSCH_TRANS_NACK_MCS20) PDSCH_TRANS_NACK_MCS20,
    SUM(PDSCH_TRANS_NACK_MCS21) PDSCH_TRANS_NACK_MCS21,
    SUM(PDSCH_TRANS_NACK_MCS22) PDSCH_TRANS_NACK_MCS22,
    SUM(PDSCH_TRANS_NACK_MCS23) PDSCH_TRANS_NACK_MCS23,
    SUM(PDSCH_TRANS_NACK_MCS24) PDSCH_TRANS_NACK_MCS24,
    SUM(PDSCH_TRANS_NACK_MCS25) PDSCH_TRANS_NACK_MCS25,
    SUM(PDSCH_TRANS_NACK_MCS26) PDSCH_TRANS_NACK_MCS26,
    SUM(PDSCH_TRANS_NACK_MCS27) PDSCH_TRANS_NACK_MCS27,
    SUM(PDSCH_TRANS_NACK_MCS28) PDSCH_TRANS_NACK_MCS28,
    SUM(RLC_PDU_FIRST_TRANS) RLC_PDU_FIRST_TRANS,
    SUM(RLC_PDU_RE_TRANS) RLC_PDU_RE_TRANS,
    SUM(UL_RLC_PDU_REC_TOT) UL_RLC_PDU_REC_TOT,
    SUM(UL_RLC_PDU_RETR_REQ) UL_RLC_PDU_RETR_REQ
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      AVG(UE_DRB_DL_DATA_QCI_1) UE_DRB_DL_DATA_QCI_1,
      SUM(PDSCH_TRANS_USING_MCS29) PDSCH_TRANS_USING_MCS29,
      SUM(PDSCH_TRANS_USING_MCS30) PDSCH_TRANS_USING_MCS30,
      SUM(PDSCH_TRANS_USING_MCS31) PDSCH_TRANS_USING_MCS31,
      SUM(PDSCH_TRANS_NACK_MCS29) PDSCH_TRANS_NACK_MCS29,
      SUM(PDSCH_TRANS_NACK_MCS30) PDSCH_TRANS_NACK_MCS30,
      SUM(PDSCH_TRANS_NACK_MCS31) PDSCH_TRANS_NACK_MCS31,
      SUM(TB_BUND2_NACK_PDSCH_MCS29) TB_BUND2_NACK_PDSCH_MCS29,
      SUM(TB_BUND3_NACK_PDSCH_MCS29) TB_BUND3_NACK_PDSCH_MCS29,
      SUM(TB_BUND4_NACK_PDSCH_MCS29) TB_BUND4_NACK_PDSCH_MCS29,
      SUM(TB_BUND2_NACK_PDSCH_MCS30) TB_BUND2_NACK_PDSCH_MCS30,
      SUM(TB_BUND3_NACK_PDSCH_MCS30) TB_BUND3_NACK_PDSCH_MCS30,
      SUM(TB_BUND4_NACK_PDSCH_MCS30) TB_BUND4_NACK_PDSCH_MCS30,
      SUM(TB_BUND2_NACK_PDSCH_MCS31) TB_BUND2_NACK_PDSCH_MCS31,
      SUM(TB_BUND3_NACK_PDSCH_MCS31) TB_BUND3_NACK_PDSCH_MCS31,
      SUM(TB_BUND4_NACK_PDSCH_MCS31) TB_BUND4_NACK_PDSCH_MCS31,
      SUM(SUM_ACTIVE_UE_DATA_DL) SUM_ACTIVE_UE_DATA_DL,
      SUM(DENOM_ACTIVE_UE_DATA_DL) DENOM_ACTIVE_UE_DATA_DL,
      SUM(SUM_ACTIVE_UE_DATA_UL) SUM_ACTIVE_UE_DATA_UL,
      SUM(DENOM_ACTIVE_UE_DATA_UL) DENOM_ACTIVE_UE_DATA_UL,
      AVG(PDCP_RET_DL_DEL_MEAN_QCI_1) PDCP_RET_DL_DEL_MEAN_QCI_1,
      AVG(PDCP_RET_DL_DEL_MEAN_QCI_2) PDCP_RET_DL_DEL_MEAN_QCI_2,
      AVG(PDCP_RET_DL_DEL_MEAN_QCI_3) PDCP_RET_DL_DEL_MEAN_QCI_3,
      AVG(PDCP_RET_DL_DEL_MEAN_QCI_4) PDCP_RET_DL_DEL_MEAN_QCI_4,
      SUM(RACH_STP_ATT_DEDICATED) RACH_STP_ATT_DEDICATED,
      AVG(PDCP_RET_DL_DEL_MEAN_QCI_5) PDCP_RET_DL_DEL_MEAN_QCI_5,
      AVG(PDCP_RET_DL_DEL_MEAN_QCI_6) PDCP_RET_DL_DEL_MEAN_QCI_6,
      AVG(PDCP_RET_DL_DEL_MEAN_QCI_7) PDCP_RET_DL_DEL_MEAN_QCI_7,
      AVG(PDCP_RET_DL_DEL_MEAN_QCI_8) PDCP_RET_DL_DEL_MEAN_QCI_8,
      AVG(PDCP_RET_DL_DEL_MEAN_QCI_9) PDCP_RET_DL_DEL_MEAN_QCI_9,
      SUM(SUM_RRC_CONN_UE) SUM_RRC_CONN_UE,
      SUM(DENOM_RRC_CONN_UE) DENOM_RRC_CONN_UE,
      SUM(TB_BUND2_NACK_PDSCH_MCS0) TB_BUND2_NACK_PDSCH_MCS0,
      SUM(TB_BUND2_NACK_PDSCH_MCS1) TB_BUND2_NACK_PDSCH_MCS1,
      SUM(TB_BUND2_NACK_PDSCH_MCS2) TB_BUND2_NACK_PDSCH_MCS2,
      SUM(TB_BUND2_NACK_PDSCH_MCS3) TB_BUND2_NACK_PDSCH_MCS3,
      SUM(TB_BUND2_NACK_PDSCH_MCS4) TB_BUND2_NACK_PDSCH_MCS4,
      SUM(TB_BUND2_NACK_PDSCH_MCS5) TB_BUND2_NACK_PDSCH_MCS5,
      SUM(TB_BUND2_NACK_PDSCH_MCS6) TB_BUND2_NACK_PDSCH_MCS6,
      SUM(TB_BUND2_NACK_PDSCH_MCS7) TB_BUND2_NACK_PDSCH_MCS7,
      SUM(TB_BUND2_NACK_PDSCH_MCS8) TB_BUND2_NACK_PDSCH_MCS8,
      SUM(TB_BUND2_NACK_PDSCH_MCS9) TB_BUND2_NACK_PDSCH_MCS9,
      SUM(TB_BUND2_NACK_PDSCH_MCS10) TB_BUND2_NACK_PDSCH_MCS10,
      SUM(TB_BUND2_NACK_PDSCH_MCS11) TB_BUND2_NACK_PDSCH_MCS11,
      SUM(TB_BUND2_NACK_PDSCH_MCS12) TB_BUND2_NACK_PDSCH_MCS12,
      SUM(TB_BUND2_NACK_PDSCH_MCS13) TB_BUND2_NACK_PDSCH_MCS13,
      SUM(TB_BUND2_NACK_PDSCH_MCS14) TB_BUND2_NACK_PDSCH_MCS14,
      SUM(TB_BUND2_NACK_PDSCH_MCS15) TB_BUND2_NACK_PDSCH_MCS15,
      SUM(TB_BUND2_NACK_PDSCH_MCS16) TB_BUND2_NACK_PDSCH_MCS16,
      SUM(TB_BUND2_NACK_PDSCH_MCS17) TB_BUND2_NACK_PDSCH_MCS17,
      SUM(TB_BUND2_NACK_PDSCH_MCS18) TB_BUND2_NACK_PDSCH_MCS18,
      SUM(TB_BUND2_NACK_PDSCH_MCS19) TB_BUND2_NACK_PDSCH_MCS19,
      SUM(TB_BUND2_NACK_PDSCH_MCS20) TB_BUND2_NACK_PDSCH_MCS20,
      SUM(TB_BUND2_NACK_PDSCH_MCS21) TB_BUND2_NACK_PDSCH_MCS21,
      SUM(TB_BUND2_NACK_PDSCH_MCS22) TB_BUND2_NACK_PDSCH_MCS22,
      SUM(TB_BUND2_NACK_PDSCH_MCS23) TB_BUND2_NACK_PDSCH_MCS23,
      SUM(TB_BUND2_NACK_PDSCH_MCS24) TB_BUND2_NACK_PDSCH_MCS24,
      SUM(TB_BUND2_NACK_PDSCH_MCS25) TB_BUND2_NACK_PDSCH_MCS25,
      SUM(TB_BUND2_NACK_PDSCH_MCS26) TB_BUND2_NACK_PDSCH_MCS26,
      SUM(TB_BUND2_NACK_PDSCH_MCS27) TB_BUND2_NACK_PDSCH_MCS27,
      SUM(TB_BUND2_NACK_PDSCH_MCS28) TB_BUND2_NACK_PDSCH_MCS28,
      SUM(TB_BUND3_NACK_PDSCH_MCS0) TB_BUND3_NACK_PDSCH_MCS0,
      SUM(TB_BUND3_NACK_PDSCH_MCS1) TB_BUND3_NACK_PDSCH_MCS1,
      SUM(TB_BUND3_NACK_PDSCH_MCS2) TB_BUND3_NACK_PDSCH_MCS2,
      SUM(TB_BUND3_NACK_PDSCH_MCS3) TB_BUND3_NACK_PDSCH_MCS3,
      SUM(TB_BUND3_NACK_PDSCH_MCS4) TB_BUND3_NACK_PDSCH_MCS4,
      SUM(TB_BUND3_NACK_PDSCH_MCS5) TB_BUND3_NACK_PDSCH_MCS5,
      SUM(TB_BUND3_NACK_PDSCH_MCS6) TB_BUND3_NACK_PDSCH_MCS6,
      SUM(TB_BUND3_NACK_PDSCH_MCS7) TB_BUND3_NACK_PDSCH_MCS7,
      SUM(TB_BUND3_NACK_PDSCH_MCS8) TB_BUND3_NACK_PDSCH_MCS8,
      SUM(TB_BUND3_NACK_PDSCH_MCS9) TB_BUND3_NACK_PDSCH_MCS9,
      SUM(TB_BUND3_NACK_PDSCH_MCS10) TB_BUND3_NACK_PDSCH_MCS10,
      SUM(TB_BUND3_NACK_PDSCH_MCS11) TB_BUND3_NACK_PDSCH_MCS11,
      SUM(TB_BUND3_NACK_PDSCH_MCS12) TB_BUND3_NACK_PDSCH_MCS12,
      SUM(TB_BUND3_NACK_PDSCH_MCS13) TB_BUND3_NACK_PDSCH_MCS13,
      SUM(TB_BUND3_NACK_PDSCH_MCS14) TB_BUND3_NACK_PDSCH_MCS14,
      SUM(TB_BUND3_NACK_PDSCH_MCS15) TB_BUND3_NACK_PDSCH_MCS15,
      SUM(TB_BUND3_NACK_PDSCH_MCS16) TB_BUND3_NACK_PDSCH_MCS16,
      SUM(TB_BUND3_NACK_PDSCH_MCS17) TB_BUND3_NACK_PDSCH_MCS17,
      SUM(TB_BUND3_NACK_PDSCH_MCS18) TB_BUND3_NACK_PDSCH_MCS18,
      SUM(TB_BUND3_NACK_PDSCH_MCS19) TB_BUND3_NACK_PDSCH_MCS19,
      SUM(TB_BUND3_NACK_PDSCH_MCS20) TB_BUND3_NACK_PDSCH_MCS20,
      SUM(TB_BUND3_NACK_PDSCH_MCS21) TB_BUND3_NACK_PDSCH_MCS21,
      SUM(TB_BUND3_NACK_PDSCH_MCS22) TB_BUND3_NACK_PDSCH_MCS22,
      SUM(TB_BUND3_NACK_PDSCH_MCS23) TB_BUND3_NACK_PDSCH_MCS23,
      SUM(TB_BUND3_NACK_PDSCH_MCS24) TB_BUND3_NACK_PDSCH_MCS24,
      SUM(TB_BUND3_NACK_PDSCH_MCS25) TB_BUND3_NACK_PDSCH_MCS25,
      SUM(TB_BUND3_NACK_PDSCH_MCS26) TB_BUND3_NACK_PDSCH_MCS26,
      SUM(TB_BUND3_NACK_PDSCH_MCS27) TB_BUND3_NACK_PDSCH_MCS27,
      SUM(TB_BUND3_NACK_PDSCH_MCS28) TB_BUND3_NACK_PDSCH_MCS28,
      SUM(TB_BUND4_NACK_PDSCH_MCS0) TB_BUND4_NACK_PDSCH_MCS0,
      SUM(TB_BUND4_NACK_PDSCH_MCS1) TB_BUND4_NACK_PDSCH_MCS1,
      SUM(TB_BUND4_NACK_PDSCH_MCS2) TB_BUND4_NACK_PDSCH_MCS2,
      SUM(TB_BUND4_NACK_PDSCH_MCS3) TB_BUND4_NACK_PDSCH_MCS3,
      SUM(TB_BUND4_NACK_PDSCH_MCS4) TB_BUND4_NACK_PDSCH_MCS4,
      SUM(TB_BUND4_NACK_PDSCH_MCS5) TB_BUND4_NACK_PDSCH_MCS5,
      SUM(TB_BUND4_NACK_PDSCH_MCS6) TB_BUND4_NACK_PDSCH_MCS6,
      SUM(TB_BUND4_NACK_PDSCH_MCS7) TB_BUND4_NACK_PDSCH_MCS7,
      SUM(TB_BUND4_NACK_PDSCH_MCS8) TB_BUND4_NACK_PDSCH_MCS8,
      SUM(TB_BUND4_NACK_PDSCH_MCS9) TB_BUND4_NACK_PDSCH_MCS9,
      SUM(TB_BUND4_NACK_PDSCH_MCS10) TB_BUND4_NACK_PDSCH_MCS10,
      SUM(TB_BUND4_NACK_PDSCH_MCS11) TB_BUND4_NACK_PDSCH_MCS11,
      SUM(TB_BUND4_NACK_PDSCH_MCS12) TB_BUND4_NACK_PDSCH_MCS12,
      SUM(TB_BUND4_NACK_PDSCH_MCS13) TB_BUND4_NACK_PDSCH_MCS13,
      SUM(TB_BUND4_NACK_PDSCH_MCS14) TB_BUND4_NACK_PDSCH_MCS14,
      SUM(TB_BUND4_NACK_PDSCH_MCS15) TB_BUND4_NACK_PDSCH_MCS15,
      SUM(TB_BUND4_NACK_PDSCH_MCS16) TB_BUND4_NACK_PDSCH_MCS16,
      SUM(TB_BUND4_NACK_PDSCH_MCS17) TB_BUND4_NACK_PDSCH_MCS17,
      SUM(TB_BUND4_NACK_PDSCH_MCS18) TB_BUND4_NACK_PDSCH_MCS18,
      SUM(TB_BUND4_NACK_PDSCH_MCS19) TB_BUND4_NACK_PDSCH_MCS19,
      SUM(TB_BUND4_NACK_PDSCH_MCS20) TB_BUND4_NACK_PDSCH_MCS20,
      SUM(TB_BUND4_NACK_PDSCH_MCS21) TB_BUND4_NACK_PDSCH_MCS21,
      SUM(TB_BUND4_NACK_PDSCH_MCS22) TB_BUND4_NACK_PDSCH_MCS22,
      SUM(TB_BUND4_NACK_PDSCH_MCS23) TB_BUND4_NACK_PDSCH_MCS23,
      SUM(TB_BUND4_NACK_PDSCH_MCS24) TB_BUND4_NACK_PDSCH_MCS24,
      SUM(TB_BUND4_NACK_PDSCH_MCS25) TB_BUND4_NACK_PDSCH_MCS25,
      SUM(TB_BUND4_NACK_PDSCH_MCS26) TB_BUND4_NACK_PDSCH_MCS26,
      SUM(TB_BUND4_NACK_PDSCH_MCS27) TB_BUND4_NACK_PDSCH_MCS27,
      SUM(TB_BUND4_NACK_PDSCH_MCS28) TB_BUND4_NACK_PDSCH_MCS28,
      AVG(UE_DRB_UL_DATA_QCI_1) UE_DRB_UL_DATA_QCI_1,
      AVG(CA_DL_CAP_UE_AVG) CA_DL_CAP_UE_AVG,
      AVG(CA_SCELL_ACTIVE_UE_AVG) CA_SCELL_ACTIVE_UE_AVG,
      AVG(CA_DL_CAP_UE_3CC_AVG) CA_DL_CAP_UE_3CC_AVG,
      AVG(CA_2SCELLS_ACTIVE_UE_AVG) CA_2SCELLS_ACTIVE_UE_AVG,
      AVG(PDCP_SDU_DELAY_DL_DTCH_MEAN) PDCP_SDU_DELAY_DL_DTCH_MEAN,
      AVG(PDCP_SDU_DELAY_UL_DTCH_MEAN) PDCP_SDU_DELAY_UL_DTCH_MEAN,
      SUM(RACH_STP_ATT_SMALL_MSG) RACH_STP_ATT_SMALL_MSG,
      SUM(RACH_STP_ATT_LARGE_MSG) RACH_STP_ATT_LARGE_MSG,
      SUM(RACH_STP_COMPLETIONS) RACH_STP_COMPLETIONS,
      SUM(PUSCH_TRANS_USING_MCS0) PUSCH_TRANS_USING_MCS0,
      SUM(PUSCH_TRANS_USING_MCS1) PUSCH_TRANS_USING_MCS1,
      SUM(PUSCH_TRANS_USING_MCS2) PUSCH_TRANS_USING_MCS2,
      SUM(PUSCH_TRANS_USING_MCS3) PUSCH_TRANS_USING_MCS3,
      SUM(PUSCH_TRANS_USING_MCS4) PUSCH_TRANS_USING_MCS4,
      SUM(PUSCH_TRANS_USING_MCS5) PUSCH_TRANS_USING_MCS5,
      SUM(PUSCH_TRANS_USING_MCS6) PUSCH_TRANS_USING_MCS6,
      SUM(PUSCH_TRANS_USING_MCS7) PUSCH_TRANS_USING_MCS7,
      SUM(PUSCH_TRANS_USING_MCS8) PUSCH_TRANS_USING_MCS8,
      SUM(PUSCH_TRANS_USING_MCS9) PUSCH_TRANS_USING_MCS9,
      SUM(PUSCH_TRANS_USING_MCS10) PUSCH_TRANS_USING_MCS10,
      SUM(PUSCH_TRANS_USING_MCS11) PUSCH_TRANS_USING_MCS11,
      SUM(PUSCH_TRANS_USING_MCS12) PUSCH_TRANS_USING_MCS12,
      SUM(PUSCH_TRANS_USING_MCS13) PUSCH_TRANS_USING_MCS13,
      SUM(PUSCH_TRANS_USING_MCS14) PUSCH_TRANS_USING_MCS14,
      SUM(PUSCH_TRANS_USING_MCS15) PUSCH_TRANS_USING_MCS15,
      SUM(PUSCH_TRANS_USING_MCS16) PUSCH_TRANS_USING_MCS16,
      SUM(PUSCH_TRANS_USING_MCS17) PUSCH_TRANS_USING_MCS17,
      SUM(PUSCH_TRANS_USING_MCS18) PUSCH_TRANS_USING_MCS18,
      SUM(PUSCH_TRANS_USING_MCS19) PUSCH_TRANS_USING_MCS19,
      SUM(PUSCH_TRANS_USING_MCS20) PUSCH_TRANS_USING_MCS20,
      SUM(PUSCH_TRANS_USING_MCS21) PUSCH_TRANS_USING_MCS21,
      SUM(PUSCH_TRANS_USING_MCS22) PUSCH_TRANS_USING_MCS22,
      SUM(PUSCH_TRANS_USING_MCS23) PUSCH_TRANS_USING_MCS23,
      SUM(PUSCH_TRANS_USING_MCS24) PUSCH_TRANS_USING_MCS24,
      SUM(PUSCH_TRANS_USING_MCS25) PUSCH_TRANS_USING_MCS25,
      SUM(PUSCH_TRANS_USING_MCS26) PUSCH_TRANS_USING_MCS26,
      SUM(PUSCH_TRANS_USING_MCS27) PUSCH_TRANS_USING_MCS27,
      SUM(PUSCH_TRANS_USING_MCS28) PUSCH_TRANS_USING_MCS28,
      SUM(PDSCH_TRANS_USING_MCS0) PDSCH_TRANS_USING_MCS0,
      SUM(PDSCH_TRANS_USING_MCS1) PDSCH_TRANS_USING_MCS1,
      SUM(PDSCH_TRANS_USING_MCS2) PDSCH_TRANS_USING_MCS2,
      SUM(PDSCH_TRANS_USING_MCS3) PDSCH_TRANS_USING_MCS3,
      SUM(PDSCH_TRANS_USING_MCS4) PDSCH_TRANS_USING_MCS4,
      SUM(PDSCH_TRANS_USING_MCS5) PDSCH_TRANS_USING_MCS5,
      SUM(PDSCH_TRANS_USING_MCS6) PDSCH_TRANS_USING_MCS6,
      SUM(PDSCH_TRANS_USING_MCS7) PDSCH_TRANS_USING_MCS7,
      SUM(PDSCH_TRANS_USING_MCS8) PDSCH_TRANS_USING_MCS8,
      SUM(PDSCH_TRANS_USING_MCS9) PDSCH_TRANS_USING_MCS9,
      SUM(PDSCH_TRANS_USING_MCS10) PDSCH_TRANS_USING_MCS10,
      SUM(PDSCH_TRANS_USING_MCS11) PDSCH_TRANS_USING_MCS11,
      SUM(PDSCH_TRANS_USING_MCS12) PDSCH_TRANS_USING_MCS12,
      SUM(PDSCH_TRANS_USING_MCS13) PDSCH_TRANS_USING_MCS13,
      SUM(PDSCH_TRANS_USING_MCS14) PDSCH_TRANS_USING_MCS14,
      SUM(PDSCH_TRANS_USING_MCS15) PDSCH_TRANS_USING_MCS15,
      SUM(PDSCH_TRANS_USING_MCS16) PDSCH_TRANS_USING_MCS16,
      SUM(PDSCH_TRANS_USING_MCS17) PDSCH_TRANS_USING_MCS17,
      SUM(PDSCH_TRANS_USING_MCS18) PDSCH_TRANS_USING_MCS18,
      SUM(PDSCH_TRANS_USING_MCS19) PDSCH_TRANS_USING_MCS19,
      SUM(PDSCH_TRANS_USING_MCS20) PDSCH_TRANS_USING_MCS20,
      SUM(PDSCH_TRANS_USING_MCS21) PDSCH_TRANS_USING_MCS21,
      SUM(PDSCH_TRANS_USING_MCS22) PDSCH_TRANS_USING_MCS22,
      SUM(PDSCH_TRANS_USING_MCS23) PDSCH_TRANS_USING_MCS23,
      SUM(PDSCH_TRANS_USING_MCS24) PDSCH_TRANS_USING_MCS24,
      SUM(PDSCH_TRANS_USING_MCS25) PDSCH_TRANS_USING_MCS25,
      SUM(PDSCH_TRANS_USING_MCS26) PDSCH_TRANS_USING_MCS26,
      SUM(PDSCH_TRANS_USING_MCS27) PDSCH_TRANS_USING_MCS27,
      SUM(PDSCH_TRANS_USING_MCS28) PDSCH_TRANS_USING_MCS28,
      SUM(PUSCH_TRANS_NACK_MCS0) PUSCH_TRANS_NACK_MCS0,
      SUM(PUSCH_TRANS_NACK_MCS1) PUSCH_TRANS_NACK_MCS1,
      SUM(PUSCH_TRANS_NACK_MCS2) PUSCH_TRANS_NACK_MCS2,
      SUM(PUSCH_TRANS_NACK_MCS3) PUSCH_TRANS_NACK_MCS3,
      SUM(PUSCH_TRANS_NACK_MCS4) PUSCH_TRANS_NACK_MCS4,
      SUM(PUSCH_TRANS_NACK_MCS5) PUSCH_TRANS_NACK_MCS5,
      SUM(PUSCH_TRANS_NACK_MCS6) PUSCH_TRANS_NACK_MCS6,
      SUM(PUSCH_TRANS_NACK_MCS7) PUSCH_TRANS_NACK_MCS7,
      SUM(PUSCH_TRANS_NACK_MCS8) PUSCH_TRANS_NACK_MCS8,
      SUM(PUSCH_TRANS_NACK_MCS9) PUSCH_TRANS_NACK_MCS9,
      SUM(PUSCH_TRANS_NACK_MCS10) PUSCH_TRANS_NACK_MCS10,
      SUM(PUSCH_TRANS_NACK_MCS11) PUSCH_TRANS_NACK_MCS11,
      SUM(PUSCH_TRANS_NACK_MCS12) PUSCH_TRANS_NACK_MCS12,
      SUM(PUSCH_TRANS_NACK_MCS13) PUSCH_TRANS_NACK_MCS13,
      SUM(PUSCH_TRANS_NACK_MCS14) PUSCH_TRANS_NACK_MCS14,
      SUM(PUSCH_TRANS_NACK_MCS15) PUSCH_TRANS_NACK_MCS15,
      SUM(PUSCH_TRANS_NACK_MCS16) PUSCH_TRANS_NACK_MCS16,
      SUM(PUSCH_TRANS_NACK_MCS17) PUSCH_TRANS_NACK_MCS17,
      SUM(PUSCH_TRANS_NACK_MCS18) PUSCH_TRANS_NACK_MCS18,
      SUM(PUSCH_TRANS_NACK_MCS19) PUSCH_TRANS_NACK_MCS19,
      SUM(PUSCH_TRANS_NACK_MCS20) PUSCH_TRANS_NACK_MCS20,
      SUM(PUSCH_TRANS_NACK_MCS21) PUSCH_TRANS_NACK_MCS21,
      SUM(PUSCH_TRANS_NACK_MCS22) PUSCH_TRANS_NACK_MCS22,
      SUM(PUSCH_TRANS_NACK_MCS23) PUSCH_TRANS_NACK_MCS23,
      SUM(PUSCH_TRANS_NACK_MCS24) PUSCH_TRANS_NACK_MCS24,
      SUM(PUSCH_TRANS_NACK_MCS25) PUSCH_TRANS_NACK_MCS25,
      SUM(PUSCH_TRANS_NACK_MCS26) PUSCH_TRANS_NACK_MCS26,
      SUM(PUSCH_TRANS_NACK_MCS27) PUSCH_TRANS_NACK_MCS27,
      SUM(PUSCH_TRANS_NACK_MCS28) PUSCH_TRANS_NACK_MCS28,
      SUM(PDSCH_TRANS_NACK_MCS0) PDSCH_TRANS_NACK_MCS0,
      SUM(PDSCH_TRANS_NACK_MCS1) PDSCH_TRANS_NACK_MCS1,
      SUM(PDSCH_TRANS_NACK_MCS2) PDSCH_TRANS_NACK_MCS2,
      SUM(PDSCH_TRANS_NACK_MCS3) PDSCH_TRANS_NACK_MCS3,
      SUM(PDSCH_TRANS_NACK_MCS4) PDSCH_TRANS_NACK_MCS4,
      SUM(PDSCH_TRANS_NACK_MCS5) PDSCH_TRANS_NACK_MCS5,
      SUM(PDSCH_TRANS_NACK_MCS6) PDSCH_TRANS_NACK_MCS6,
      SUM(PDSCH_TRANS_NACK_MCS7) PDSCH_TRANS_NACK_MCS7,
      SUM(PDSCH_TRANS_NACK_MCS8) PDSCH_TRANS_NACK_MCS8,
      SUM(PDSCH_TRANS_NACK_MCS9) PDSCH_TRANS_NACK_MCS9,
      SUM(PDSCH_TRANS_NACK_MCS10) PDSCH_TRANS_NACK_MCS10,
      SUM(PDSCH_TRANS_NACK_MCS11) PDSCH_TRANS_NACK_MCS11,
      SUM(PDSCH_TRANS_NACK_MCS12) PDSCH_TRANS_NACK_MCS12,
      SUM(PDSCH_TRANS_NACK_MCS13) PDSCH_TRANS_NACK_MCS13,
      SUM(PDSCH_TRANS_NACK_MCS14) PDSCH_TRANS_NACK_MCS14,
      SUM(PDSCH_TRANS_NACK_MCS15) PDSCH_TRANS_NACK_MCS15,
      SUM(PDSCH_TRANS_NACK_MCS16) PDSCH_TRANS_NACK_MCS16,
      SUM(PDSCH_TRANS_NACK_MCS17) PDSCH_TRANS_NACK_MCS17,
      SUM(PDSCH_TRANS_NACK_MCS18) PDSCH_TRANS_NACK_MCS18,
      SUM(PDSCH_TRANS_NACK_MCS19) PDSCH_TRANS_NACK_MCS19,
      SUM(PDSCH_TRANS_NACK_MCS20) PDSCH_TRANS_NACK_MCS20,
      SUM(PDSCH_TRANS_NACK_MCS21) PDSCH_TRANS_NACK_MCS21,
      SUM(PDSCH_TRANS_NACK_MCS22) PDSCH_TRANS_NACK_MCS22,
      SUM(PDSCH_TRANS_NACK_MCS23) PDSCH_TRANS_NACK_MCS23,
      SUM(PDSCH_TRANS_NACK_MCS24) PDSCH_TRANS_NACK_MCS24,
      SUM(PDSCH_TRANS_NACK_MCS25) PDSCH_TRANS_NACK_MCS25,
      SUM(PDSCH_TRANS_NACK_MCS26) PDSCH_TRANS_NACK_MCS26,
      SUM(PDSCH_TRANS_NACK_MCS27) PDSCH_TRANS_NACK_MCS27,
      SUM(PDSCH_TRANS_NACK_MCS28) PDSCH_TRANS_NACK_MCS28,
      SUM(RLC_PDU_FIRST_TRANS) RLC_PDU_FIRST_TRANS,
      SUM(RLC_PDU_RE_TRANS) RLC_PDU_RE_TRANS,
      SUM(UL_RLC_PDU_REC_TOT) UL_RLC_PDU_REC_TOT,
      SUM(UL_RLC_PDU_RETR_REQ) UL_RLC_PDU_RETR_REQ
    from          
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",
      noklte_ps_lcelld_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16          
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129      
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LCELLD2,
  

  (
  select
    trunc( p.period_start_time, 'dd' ) period_start_time,
    "plmn".co_gid plmn_gid,
    COUNT(DISTINCT LNBTS_ID) LNBTS_COUNT
  from
    utp_common_objects "plmn",
    utp_common_objects "vloflnbtsparent",
    utp_common_objects "lnbts",
    NOKLTE_PS_LENBLD_LNBTS_day p
  where
    "plmn".co_gid in ( '100000' ) 
    and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
    and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
    and "plmn".co_oc_id = 16
    
    and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
    and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
    and "lnbts".co_gid = p.lnbts_id
    and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
    and "lnbts".co_oc_id = 3129
  group by
    trunc( p.period_start_time, 'dd' ),
    "plmn".co_gid
  ) LENBLD_ext,
  
  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(ifInPackets15) ifInPackets15,
    SUM(ifInOctets15) ifInOctets15,
    SUM(ifOutOctets15) ifOutOctets15,
    SUM(ifInErrors15) ifInErrors15
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(ifInPackets15) ifInPackets15,
      SUM(ifInOctets15) ifInOctets15,
      SUM(ifOutOctets15) ifOutOctets15,
      SUM(ifInErrors15) ifInErrors15
    from          
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",
      noklte_ps_lvlip_ippm1_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16
      
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LVLIP_ext,
      
  (
  select
    a.period_start_time,
    a.plmn_gid,
    AVG(UL_PRB_UTIL_TTI_MEAN) UL_PRB_UTIL_TTI_MEAN,
    AVG(DL_PRB_UTIL_TTI_MEAN) DL_PRB_UTIL_TTI_MEAN,
    SUM(AGG1_USED_PDCCH) AGG1_USED_PDCCH,
    SUM(AGG2_USED_PDCCH) AGG2_USED_PDCCH,
    SUM(AGG4_USED_PDCCH) AGG4_USED_PDCCH,
    SUM(AGG8_USED_PDCCH) AGG8_USED_PDCCH,
    SUM(PRB_USED_PUSCH) PRB_USED_PUSCH,
    SUM(PRB_USED_PDSCH) PRB_USED_PDSCH,
    SUM(PDCCH_1_OFDM_SYMBOL) PDCCH_1_OFDM_SYMBOL,
    SUM(PDCCH_2_OFDM_SYMBOLS) PDCCH_2_OFDM_SYMBOLS,
    SUM(PDCCH_3_OFDM_SYMBOLS) PDCCH_3_OFDM_SYMBOLS,
    AVG(TTI_BUNDLING_MODE_UE_AVG) TTI_BUNDLING_MODE_UE_AVG,
    SUM(CA_SCELL_CONFIG_ATT) CA_SCELL_CONFIG_ATT,
    SUM(CA_SCELL_CONFIG_SUCC) CA_SCELL_CONFIG_SUCC,
    SUM(HIGH_CELL_LOAD_LB) HIGH_CELL_LOAD_LB,
    SUM(SCHDL_256QAM_PDSCH_64QAM) SCHDL_256QAM_PDSCH_64QAM,
    SUM(SCHDL_256QAM_PDSCH_16QAM) SCHDL_256QAM_PDSCH_16QAM,
    SUM(SCHDL_256QAM_PDSCH_NACK_256QAM) SCHDL_256QAM_PDSCH_NACK_256QAM,
    SUM(SCHDL_256QAM_PDSCH_NACK_16QAM) SCHDL_256QAM_PDSCH_NACK_16QAM,
    SUM(SCHDL_256QAM_PDSCH_NACK_QPSK) SCHDL_256QAM_PDSCH_NACK_QPSK,
    SUM(SCHDL_256QAM_PDSCH_QPSK) SCHDL_256QAM_PDSCH_QPSK,
    SUM(SCHDL_256QAM_PDSCH_NACK_64QAM) SCHDL_256QAM_PDSCH_NACK_64QAM,
    SUM(SCHDL_256QAM_PDSCH_256QAM) SCHDL_256QAM_PDSCH_256QAM,
    SUM(period_duration_sum) period_duration_sum
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      AVG(UL_PRB_UTIL_TTI_MEAN) UL_PRB_UTIL_TTI_MEAN,
      AVG(DL_PRB_UTIL_TTI_MEAN) DL_PRB_UTIL_TTI_MEAN,
      SUM(AGG1_USED_PDCCH) AGG1_USED_PDCCH,
      SUM(AGG2_USED_PDCCH) AGG2_USED_PDCCH,
      SUM(AGG4_USED_PDCCH) AGG4_USED_PDCCH,
      SUM(AGG8_USED_PDCCH) AGG8_USED_PDCCH,
      SUM(PRB_USED_PUSCH) PRB_USED_PUSCH,
      SUM(PRB_USED_PDSCH) PRB_USED_PDSCH,
      SUM(PDCCH_1_OFDM_SYMBOL) PDCCH_1_OFDM_SYMBOL,
      SUM(PDCCH_2_OFDM_SYMBOLS) PDCCH_2_OFDM_SYMBOLS,
      SUM(PDCCH_3_OFDM_SYMBOLS) PDCCH_3_OFDM_SYMBOLS,
      AVG(TTI_BUNDLING_MODE_UE_AVG) TTI_BUNDLING_MODE_UE_AVG,
      SUM(CA_SCELL_CONFIG_ATT) CA_SCELL_CONFIG_ATT,
      SUM(CA_SCELL_CONFIG_SUCC) CA_SCELL_CONFIG_SUCC,
      SUM(HIGH_CELL_LOAD_LB) HIGH_CELL_LOAD_LB,
      SUM(SCHDL_256QAM_PDSCH_64QAM) SCHDL_256QAM_PDSCH_64QAM,
      SUM(SCHDL_256QAM_PDSCH_16QAM) SCHDL_256QAM_PDSCH_16QAM,
      SUM(SCHDL_256QAM_PDSCH_NACK_256QAM) SCHDL_256QAM_PDSCH_NACK_256QAM,
      SUM(SCHDL_256QAM_PDSCH_NACK_16QAM) SCHDL_256QAM_PDSCH_NACK_16QAM,
      SUM(SCHDL_256QAM_PDSCH_NACK_QPSK) SCHDL_256QAM_PDSCH_NACK_QPSK,
      SUM(SCHDL_256QAM_PDSCH_QPSK) SCHDL_256QAM_PDSCH_QPSK,
      SUM(SCHDL_256QAM_PDSCH_NACK_64QAM) SCHDL_256QAM_PDSCH_NACK_64QAM,
      SUM(SCHDL_256QAM_PDSCH_256QAM) SCHDL_256QAM_PDSCH_256QAM,
      SUM(period_duration_sum) period_duration_sum
    from          
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts", 
      noklte_ps_lcellr_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16          
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129   
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LCELLR2,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(INTER_ENB_HO_PREP) INTER_ENB_HO_PREP,
    SUM(ATT_INTER_ENB_HO) ATT_INTER_ENB_HO,
    SUM(SUCC_INTER_ENB_HO) SUCC_INTER_ENB_HO,
    SUM(INTER_ENB_S1_HO_PREP) INTER_ENB_S1_HO_PREP,
    SUM(INTER_ENB_S1_HO_ATT) INTER_ENB_S1_HO_ATT,
    SUM(INTER_ENB_S1_HO_SUCC) INTER_ENB_S1_HO_SUCC,
    SUM(INTER_X2_LB_PREP_FAIL_AC) INTER_X2_LB_PREP_FAIL_AC,
    SUM(INTER_S1_LB_PREP_FAIL_AC) INTER_S1_LB_PREP_FAIL_AC
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(INTER_ENB_HO_PREP) INTER_ENB_HO_PREP,
      SUM(ATT_INTER_ENB_HO) ATT_INTER_ENB_HO,
      SUM(SUCC_INTER_ENB_HO) SUCC_INTER_ENB_HO,
      SUM(INTER_ENB_S1_HO_PREP) INTER_ENB_S1_HO_PREP,
      SUM(INTER_ENB_S1_HO_ATT) INTER_ENB_S1_HO_ATT,
      SUM(INTER_ENB_S1_HO_SUCC) INTER_ENB_S1_HO_SUCC,
      SUM(INTER_X2_LB_PREP_FAIL_AC) INTER_X2_LB_PREP_FAIL_AC,
      SUM(INTER_S1_LB_PREP_FAIL_AC) INTER_S1_LB_PREP_FAIL_AC
    from          
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",      
      noklte_ps_lienbho_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129      
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LIENBHO2,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(RRC_CON_RE_ESTAB_ATT) RRC_CON_RE_ESTAB_ATT,
    SUM(RRC_CON_RE_ESTAB_SUCC) RRC_CON_RE_ESTAB_SUCC
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(RRC_CON_RE_ESTAB_ATT) RRC_CON_RE_ESTAB_ATT,
      SUM(RRC_CON_RE_ESTAB_SUCC) RRC_CON_RE_ESTAB_SUCC
    from          
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",      
      noklte_ps_lrrc_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16
      
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
  ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LRRC2,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(HO_INTFREQ_ATT) HO_INTFREQ_ATT,
    SUM(HO_INTFREQ_GAP_ATT) HO_INTFREQ_GAP_ATT,
    SUM(HO_INTFREQ_SUCC) HO_INTFREQ_SUCC,
    SUM(HO_INTFREQ_GAP_SUCC) HO_INTFREQ_GAP_SUCC,
    SUM(HO_LB_ATT) HO_LB_ATT,
    SUM(HO_LB_SUCC) HO_LB_SUCC
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(HO_INTFREQ_ATT) HO_INTFREQ_ATT,
      SUM(HO_INTFREQ_GAP_ATT) HO_INTFREQ_GAP_ATT,
      SUM(HO_INTFREQ_SUCC) HO_INTFREQ_SUCC,
      SUM(HO_INTFREQ_GAP_SUCC) HO_INTFREQ_GAP_SUCC,
      SUM(HO_LB_ATT) HO_LB_ATT,
      SUM(HO_LB_SUCC) HO_LB_SUCC
    from    
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lho_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129   
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LHO2,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(PDCP_SDU_VOL_DL) PDCP_SDU_VOL_DL,
    SUM(PDCP_SDU_VOL_UL) PDCP_SDU_VOL_UL
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(DECODE(ACTIVE_TTI_DL,NULL,0, PDCP_SDU_VOL_DL)) PDCP_SDU_VOL_DL,
      SUM(DECODE(ACTIVE_TTI_UL,NULL,0, PDCP_SDU_VOL_UL)) PDCP_SDU_VOL_UL
    from    
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lcellt_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129      
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LCELLT_ext2,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(DENOM_RRC_CONNECTED_UE) DENOM_RRC_CONNECTED_UE,
    SUM(SUM_RRC_CONNECTED_UE) SUM_RRC_CONNECTED_UE,
    AVG(CA_2SCELLS_ACT_UE_AVG) CA_2SCELLS_ACT_UE_AVG,
    AVG(CA_SCELL_ACT_UE_AVG) CA_SCELL_ACT_UE_AVG,
    SUM(DENOM_ACT_UE_DATA_DL) DENOM_ACT_UE_DATA_DL,
    SUM(DENOM_ACT_UE_DATA_UL) DENOM_ACT_UE_DATA_UL,
    MAX(DL_UE_DATA_BUFFER_MAX) DL_UE_DATA_BUFFER_MAX,
    SUM(SUM_ACT_UE_DATA_DL) SUM_ACT_UE_DATA_DL,
    SUM(SUM_ACT_UE_DATA_UL) SUM_ACT_UE_DATA_UL,
    AVG(UE_DRB_BUF_DL_DATA_QCI_1) UE_DRB_BUF_DL_DATA_QCI_1,
    AVG(UE_DRB_BUF_UL_DATA_QCI_1) UE_DRB_BUF_UL_DATA_QCI_1,
    MAX(UL_UE_DATA_BUFFER_MAX) UL_UE_DATA_BUFFER_MAX,
    AVG(CA_DL_CAP_UE_2CC_AVG) CA_DL_CAP_UE_2CC_AVG,
    AVG(CA_DL_CAPAB_UE_3CC_AVG) CA_DL_CAPAB_UE_3CC_AVG
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(DENOM_RRC_CONNECTED_UE) DENOM_RRC_CONNECTED_UE,
      SUM(SUM_RRC_CONNECTED_UE) SUM_RRC_CONNECTED_UE,
      AVG(CA_2SCELLS_ACT_UE_AVG) CA_2SCELLS_ACT_UE_AVG,
      AVG(CA_SCELL_ACT_UE_AVG) CA_SCELL_ACT_UE_AVG,
      SUM(DENOM_ACT_UE_DATA_DL) DENOM_ACT_UE_DATA_DL,
      SUM(DENOM_ACT_UE_DATA_UL) DENOM_ACT_UE_DATA_UL,
      MAX(DL_UE_DATA_BUFFER_MAX) DL_UE_DATA_BUFFER_MAX,
      SUM(SUM_ACT_UE_DATA_DL) SUM_ACT_UE_DATA_DL,
      SUM(SUM_ACT_UE_DATA_UL) SUM_ACT_UE_DATA_UL,
      AVG(UE_DRB_BUF_DL_DATA_QCI_1) UE_DRB_BUF_DL_DATA_QCI_1,
      AVG(UE_DRB_BUF_UL_DATA_QCI_1) UE_DRB_BUF_UL_DATA_QCI_1,
      MAX(UL_UE_DATA_BUFFER_MAX) UL_UE_DATA_BUFFER_MAX,
      AVG(CA_DL_CAP_UE_2CC_AVG) CA_DL_CAP_UE_2CC_AVG,
      AVG(CA_DL_CAPAB_UE_3CC_AVG) CA_DL_CAPAB_UE_3CC_AVG
    from
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lueq_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129   
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
  ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LUEQ_ext,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(S1_SETUP_ATT) S1_SETUP_ATT,
    SUM(S1_SETUP_SUCC) S1_SETUP_SUCC
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(S1_SETUP_ATT) S1_SETUP_ATT,
      SUM(S1_SETUP_SUCC) S1_SETUP_SUCC
    from    
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_ls1ap_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129   
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LS1AP2,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(ifInPackets15) ifInPackets15,
    SUM(ifInOctets15) ifInOctets15,
    SUM(ifOutOctets15) ifOutOctets15,
    SUM(ifInErrors15) ifInErrors15
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(ifInPackets15) ifInPackets15,
      SUM(ifInOctets15) ifInOctets15,
      SUM(ifOutOctets15) ifOutOctets15,
      SUM(ifInErrors15) ifInErrors15
    from    
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lip_ippm_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129   
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LIP_ext,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(PDCP_SDU_VOL_UL) PDCP_SDU_VOL_UL,
    SUM(PDCP_SDU_VOL_DL) PDCP_SDU_VOL_DL,
    MAX(PDCP_DATA_RATE_MAX_UL) PDCP_DATA_RATE_MAX_UL,
    MAX(PDCP_DATA_RATE_MAX_DL) PDCP_DATA_RATE_MAX_DL,
    SUM(ACTIVE_TTI_UL) ACTIVE_TTI_UL,
    SUM(ACTIVE_TTI_DL) ACTIVE_TTI_DL,
    SUM(IP_TPUT_VOL_UL_QCI_5) IP_TPUT_VOL_UL_QCI_5,
    SUM(IP_TPUT_TIME_UL_QCI_5) IP_TPUT_TIME_UL_QCI_5,
    SUM(IP_TPUT_VOL_UL_QCI_6) IP_TPUT_VOL_UL_QCI_6,
    SUM(IP_TPUT_TIME_UL_QCI_6) IP_TPUT_TIME_UL_QCI_6,
    SUM(IP_TPUT_VOL_UL_QCI_7) IP_TPUT_VOL_UL_QCI_7,
    SUM(IP_TPUT_TIME_UL_QCI_7) IP_TPUT_TIME_UL_QCI_7,
    SUM(IP_TPUT_VOL_UL_QCI_8) IP_TPUT_VOL_UL_QCI_8,
    SUM(IP_TPUT_TIME_UL_QCI_8) IP_TPUT_TIME_UL_QCI_8,
    SUM(IP_TPUT_VOL_UL_QCI_9) IP_TPUT_VOL_UL_QCI_9,
    SUM(IP_TPUT_TIME_UL_QCI_9) IP_TPUT_TIME_UL_QCI_9,
    AVG(PDCP_DATA_RATE_MEAN_UL_QCI_1) PDCP_DATA_RATE_MEAN_UL_QCI_1,
    SUM(IP_TPUT_VOL_DL_QCI_5) IP_TPUT_VOL_DL_QCI_5,
    SUM(IP_TPUT_TIME_DL_QCI_5) IP_TPUT_TIME_DL_QCI_5,
    SUM(IP_TPUT_VOL_DL_QCI_6) IP_TPUT_VOL_DL_QCI_6,
    SUM(IP_TPUT_TIME_DL_QCI_6) IP_TPUT_TIME_DL_QCI_6,
    SUM(IP_TPUT_VOL_DL_QCI_7) IP_TPUT_VOL_DL_QCI_7,
    SUM(IP_TPUT_TIME_DL_QCI_7) IP_TPUT_TIME_DL_QCI_7,
    SUM(IP_TPUT_VOL_DL_QCI_8) IP_TPUT_VOL_DL_QCI_8,
    SUM(IP_TPUT_TIME_DL_QCI_8) IP_TPUT_TIME_DL_QCI_8,
    SUM(IP_TPUT_VOL_DL_QCI_9) IP_TPUT_VOL_DL_QCI_9,
    SUM(IP_TPUT_TIME_DL_QCI_9) IP_TPUT_TIME_DL_QCI_9,
    AVG(PDCP_DATA_RATE_MEAN_DL_QCI_1) PDCP_DATA_RATE_MEAN_DL_QCI_1,
    SUM(RLC_PDU_DL_VOL_CA_SCELL) RLC_PDU_DL_VOL_CA_SCELL
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(PDCP_SDU_VOL_UL) PDCP_SDU_VOL_UL,
      SUM(PDCP_SDU_VOL_DL) PDCP_SDU_VOL_DL,
      MAX(PDCP_DATA_RATE_MAX_UL) PDCP_DATA_RATE_MAX_UL,
      MAX(PDCP_DATA_RATE_MAX_DL) PDCP_DATA_RATE_MAX_DL,
      SUM(ACTIVE_TTI_UL) ACTIVE_TTI_UL,
      SUM(ACTIVE_TTI_DL) ACTIVE_TTI_DL,
      SUM(IP_TPUT_VOL_UL_QCI_5) IP_TPUT_VOL_UL_QCI_5,
      SUM(IP_TPUT_TIME_UL_QCI_5) IP_TPUT_TIME_UL_QCI_5,
      SUM(IP_TPUT_VOL_UL_QCI_6) IP_TPUT_VOL_UL_QCI_6,
      SUM(IP_TPUT_TIME_UL_QCI_6) IP_TPUT_TIME_UL_QCI_6,
      SUM(IP_TPUT_VOL_UL_QCI_7) IP_TPUT_VOL_UL_QCI_7,
      SUM(IP_TPUT_TIME_UL_QCI_7) IP_TPUT_TIME_UL_QCI_7,
      SUM(IP_TPUT_VOL_UL_QCI_8) IP_TPUT_VOL_UL_QCI_8,
      SUM(IP_TPUT_TIME_UL_QCI_8) IP_TPUT_TIME_UL_QCI_8,
      SUM(IP_TPUT_VOL_UL_QCI_9) IP_TPUT_VOL_UL_QCI_9,
      SUM(IP_TPUT_TIME_UL_QCI_9) IP_TPUT_TIME_UL_QCI_9,
      AVG(PDCP_DATA_RATE_MEAN_UL_QCI_1) PDCP_DATA_RATE_MEAN_UL_QCI_1,
      SUM(IP_TPUT_VOL_DL_QCI_5) IP_TPUT_VOL_DL_QCI_5,
      SUM(IP_TPUT_TIME_DL_QCI_5) IP_TPUT_TIME_DL_QCI_5,
      SUM(IP_TPUT_VOL_DL_QCI_6) IP_TPUT_VOL_DL_QCI_6,
      SUM(IP_TPUT_TIME_DL_QCI_6) IP_TPUT_TIME_DL_QCI_6,
      SUM(IP_TPUT_VOL_DL_QCI_7) IP_TPUT_VOL_DL_QCI_7,
      SUM(IP_TPUT_TIME_DL_QCI_7) IP_TPUT_TIME_DL_QCI_7,
      SUM(IP_TPUT_VOL_DL_QCI_8) IP_TPUT_VOL_DL_QCI_8,
      SUM(IP_TPUT_TIME_DL_QCI_8) IP_TPUT_TIME_DL_QCI_8,
      SUM(IP_TPUT_VOL_DL_QCI_9) IP_TPUT_VOL_DL_QCI_9,
      SUM(IP_TPUT_TIME_DL_QCI_9) IP_TPUT_TIME_DL_QCI_9,
      AVG(PDCP_DATA_RATE_MEAN_DL_QCI_1) PDCP_DATA_RATE_MEAN_DL_QCI_1,
      SUM(RLC_PDU_DL_VOL_CA_SCELL) RLC_PDU_DL_VOL_CA_SCELL
    from          
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lcellt_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129      
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LCELLT2,

  (
  select
    trunc( p.period_start_time, 'dd' ) period_start_time,
    "plmn".co_gid plmn_gid,
    SUM(CASE WHEN SEVERITY_ID = '1' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_CRIT,
    SUM(CASE WHEN SEVERITY_ID = '2' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_MAJR,
    SUM(CASE WHEN SEVERITY_ID = '3' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_MINR,
    SUM(CASE WHEN SEVERITY_ID = '4' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_WARN,
    SUM(CASE WHEN SEVERITY_ID = '1' THEN DUR_CREATED_ALARMS ELSE 0 END) DUR_CA_CRIT,
    SUM(CASE WHEN SEVERITY_ID = '2' THEN DUR_CREATED_ALARMS ELSE 0 END) DUR_CA_MAJR,
    SUM(CASE WHEN SEVERITY_ID = '3' THEN DUR_CREATED_ALARMS ELSE 0 END) DUR_CA_MINR,
    SUM(CASE WHEN SEVERITY_ID = '4' THEN DUR_CREATED_ALARMS ELSE 0 END) DUR_CA_WARN,
    SUM(CASE WHEN ALARM_TYPE_ID = '1' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_COM,
    SUM(CASE WHEN ALARM_TYPE_ID = '2' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_ENV,
    SUM(CASE WHEN ALARM_TYPE_ID = '3' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_EQUI,
    SUM(CASE WHEN ALARM_TYPE_ID = '4' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_PROS,
    SUM(CASE WHEN ALARM_TYPE_ID = '5' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_QOS,
    SUM(CASE WHEN ALARM_NUMBER BETWEEN 7400 AND 7430 THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_EXT,
    SUM(CASE WHEN ALARM_NUMBER = '7650' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_BSF,
    SUM(CASE WHEN ALARM_NUMBER = '7651' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_BSD,
    SUM(CASE WHEN ALARM_NUMBER = '7652' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_BSN,
    SUM(CASE WHEN ALARM_NUMBER = '7653' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_CF,
    SUM(CASE WHEN ALARM_NUMBER = '7654' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_CD,
    SUM(CASE WHEN ALARM_NUMBER = '7655' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_CN,
    SUM(CASE WHEN ALARM_NUMBER = '7656' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_BSCL,
    SUM(CASE WHEN ALARM_NUMBER = '7657' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_BSCD,
    SUM(CASE WHEN ALARM_NUMBER = '71058' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_OMCF
  from        
    utp_common_objects "plmn",
    utp_common_objects "vloflnbtsparent",
    REPALS_D_ALARM_MEMBERS alrm,
    (
    select 
      connect_by_root "vloflnbtsparent".co_gid vloflnbtsparent_gid, "vloflnbtsparent".co_gid
    from
      utp_common_objects "vloflnbtsparent"
    start with "vloflnbtsparent".co_gid in 
    (
      select
        "vloflnbtsparent".co_gid
      from 
        utp_common_objects "plmn",
        utp_common_objects "vloflnbtsparent"
      where 
        "vloflnbtsparent".co_parent_gid = "plmn".co_gid and
        ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 ) and
        "plmn".co_oc_id = 16         
    )
  connect by 
    prior "vloflnbtsparent".co_gid = "vloflnbtsparent".co_parent_gid) alrmobj,
    REPALS_P_ALARMS_RAW  p
  where
    "plmn".co_gid in ( '100000' )  and
    period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')  and
    period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss') and
    p.alarm_id = alrm.alarm_id and
    "vloflnbtsparent".co_gid = alrmobj.vloflnbtsparent_gid and
    alrmobj.co_gid = p.co_gid and
    "vloflnbtsparent".co_parent_gid = "plmn".co_gid and
    "plmn".co_oc_id=16 and
    ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 ) 
  group by
    trunc( p.period_start_time, 'dd' ),
    "plmn".co_gid
  ) ALARMS_EXT,

  (
  select
    trunc( p.period_start_time, 'dd' ) period_start_time,
    "plmn".co_gid plmn_gid,
    COUNT(DISTINCT MRBTS_ID) MRBTS_COUNT,
    COUNT(DISTINCT LNBTS_ID) LNBTS_COUNT,
    COUNT(DISTINCT LNCEL_ID) LNCEL_COUNT
  from  
    utp_common_objects "plmn",
    utp_common_objects "vloflnbtsparent",
    utp_common_objects "lnbts", 
    noklte_ps_lrdb_lncel_day p
  where
    "plmn".co_gid in ( '100000' ) 
    and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
    and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
    and "plmn".co_oc_id = 16
    
    and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
    and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
    and "lnbts".co_gid = p.lnbts_id
    and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
    and "lnbts".co_oc_id = 3129
  group by
    trunc( p.period_start_time, 'dd' ),
    "plmn".co_gid
  ) OBJCOUNT,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(EPS_BEARER_SETUP_ATTEMPTS) EPS_BEARER_SETUP_ATTEMPTS,
    SUM(EPS_BEARER_SETUP_COMPLETIONS) EPS_BEARER_SETUP_COMPLETIONS,
    SUM(EPC_EPS_BEARER_REL_REQ_NORM) EPC_EPS_BEARER_REL_REQ_NORM,
    SUM(EPC_EPS_BEARER_REL_REQ_DETACH) EPC_EPS_BEARER_REL_REQ_DETACH,
    SUM(EPC_EPS_BEARER_REL_REQ_RNL) EPC_EPS_BEARER_REL_REQ_RNL,
    SUM(EPC_EPS_BEARER_REL_REQ_OTH) EPC_EPS_BEARER_REL_REQ_OTH,
    SUM(EPS_BEARER_STP_ATT_INI_QCI_1) EPS_BEARER_STP_ATT_INI_QCI_1,
    SUM(EPS_BEAR_STP_ATT_INI_NON_GBR) EPS_BEAR_STP_ATT_INI_NON_GBR,
    SUM(EPS_BEARER_STP_ATT_ADD_QCI_1) EPS_BEARER_STP_ATT_ADD_QCI_1,
    SUM(EPS_BEARER_STP_COM_INI_QCI1) EPS_BEARER_STP_COM_INI_QCI1,
    SUM(EPS_BEAR_STP_COM_INI_NON_GBR) EPS_BEAR_STP_COM_INI_NON_GBR,
    SUM(EPC_EPS_BEAR_REL_REQ_N_QCI1) EPC_EPS_BEAR_REL_REQ_N_QCI1,
    SUM(EPC_EPS_BEAR_REL_REQ_D_QCI1) EPC_EPS_BEAR_REL_REQ_D_QCI1,
    SUM(EPC_EPS_BEAR_REL_REQ_R_QCI1) EPC_EPS_BEAR_REL_REQ_R_QCI1,
    SUM(EPC_EPS_BEAR_REL_REQ_O_QCI1) EPC_EPS_BEAR_REL_REQ_O_QCI1,
    SUM(EPS_BEARER_STP_ATT_INI_QCI_2) EPS_BEARER_STP_ATT_INI_QCI_2,
    SUM(EPS_BEARER_STP_ATT_INI_QCI_3) EPS_BEARER_STP_ATT_INI_QCI_3,
    SUM(EPS_BEARER_STP_ATT_INI_QCI_4) EPS_BEARER_STP_ATT_INI_QCI_4,
    SUM(EPS_BEARER_STP_ATT_ADD_QCI_2) EPS_BEARER_STP_ATT_ADD_QCI_2,
    SUM(EPS_BEARER_STP_ATT_ADD_QCI_3) EPS_BEARER_STP_ATT_ADD_QCI_3,
    SUM(EPS_BEARER_STP_ATT_ADD_QCI_4) EPS_BEARER_STP_ATT_ADD_QCI_4,
    SUM(EPS_BEARER_STP_COM_INI_QCI_2) EPS_BEARER_STP_COM_INI_QCI_2,
    SUM(EPS_BEARER_STP_COM_INI_QCI_3) EPS_BEARER_STP_COM_INI_QCI_3,
    SUM(EPS_BEARER_STP_COM_INI_QCI_4) EPS_BEARER_STP_COM_INI_QCI_4,
    SUM(EPS_BEARER_STP_COM_ADD_QCI_2) EPS_BEARER_STP_COM_ADD_QCI_2,
    SUM(EPS_BEARER_STP_COM_ADD_QCI_3) EPS_BEARER_STP_COM_ADD_QCI_3,
    SUM(EPS_BEARER_STP_COM_ADD_QCI_4) EPS_BEARER_STP_COM_ADD_QCI_4,
    SUM(ERAB_REL_ENB_ACT_QCI1) ERAB_REL_ENB_ACT_QCI1,
    SUM(ERAB_REL_ENB_ACT_QCI2) ERAB_REL_ENB_ACT_QCI2,
    SUM(ERAB_REL_ENB_ACT_QCI3) ERAB_REL_ENB_ACT_QCI3,
    SUM(ERAB_REL_ENB_ACT_QCI4) ERAB_REL_ENB_ACT_QCI4,
    SUM(ERAB_REL_ENB_ACT_NON_GBR) ERAB_REL_ENB_ACT_NON_GBR,
    SUM(ERAB_IN_SESSION_TIME_QCI1) ERAB_IN_SESSION_TIME_QCI1,
    SUM(ERAB_IN_SESSION_TIME_QCI2) ERAB_IN_SESSION_TIME_QCI2,
    SUM(ERAB_IN_SESSION_TIME_QCI3) ERAB_IN_SESSION_TIME_QCI3,
    SUM(ERAB_IN_SESSION_TIME_QCI4) ERAB_IN_SESSION_TIME_QCI4,
    SUM(ERAB_IN_SESSION_TIME_NON_GBR) ERAB_IN_SESSION_TIME_NON_GBR,
    SUM(ERAB_INI_SETUP_ATT_QCI1) ERAB_INI_SETUP_ATT_QCI1,
    SUM(ERAB_INI_SETUP_ATT_QCI2) ERAB_INI_SETUP_ATT_QCI2,
    SUM(ERAB_INI_SETUP_ATT_QCI3) ERAB_INI_SETUP_ATT_QCI3,
    SUM(ERAB_INI_SETUP_ATT_QCI4) ERAB_INI_SETUP_ATT_QCI4,
    SUM(ERAB_INI_SETUP_ATT_QCI5) ERAB_INI_SETUP_ATT_QCI5,
    SUM(ERAB_INI_SETUP_ATT_QCI6) ERAB_INI_SETUP_ATT_QCI6,
    SUM(ERAB_INI_SETUP_ATT_QCI7) ERAB_INI_SETUP_ATT_QCI7,
    SUM(ERAB_INI_SETUP_ATT_QCI8) ERAB_INI_SETUP_ATT_QCI8,
    SUM(ERAB_INI_SETUP_ATT_QCI9) ERAB_INI_SETUP_ATT_QCI9,
    SUM(ERAB_ADD_SETUP_ATT_QCI1) ERAB_ADD_SETUP_ATT_QCI1,
    SUM(ERAB_ADD_SETUP_ATT_QCI2) ERAB_ADD_SETUP_ATT_QCI2,
    SUM(ERAB_ADD_SETUP_ATT_QCI3) ERAB_ADD_SETUP_ATT_QCI3,
    SUM(ERAB_ADD_SETUP_ATT_QCI4) ERAB_ADD_SETUP_ATT_QCI4,
    SUM(ERAB_ADD_SETUP_ATT_QCI5) ERAB_ADD_SETUP_ATT_QCI5,
    SUM(ERAB_ADD_SETUP_ATT_QCI6) ERAB_ADD_SETUP_ATT_QCI6,
    SUM(ERAB_ADD_SETUP_ATT_QCI7) ERAB_ADD_SETUP_ATT_QCI7,
    SUM(ERAB_ADD_SETUP_ATT_QCI8) ERAB_ADD_SETUP_ATT_QCI8,
    SUM(ERAB_ADD_SETUP_ATT_QCI9) ERAB_ADD_SETUP_ATT_QCI9,
    SUM(ERAB_INI_SETUP_SUCC_QCI1) ERAB_INI_SETUP_SUCC_QCI1,
    SUM(ERAB_INI_SETUP_SUCC_QCI2) ERAB_INI_SETUP_SUCC_QCI2,
    SUM(ERAB_INI_SETUP_SUCC_QCI3) ERAB_INI_SETUP_SUCC_QCI3,
    SUM(ERAB_INI_SETUP_SUCC_QCI4) ERAB_INI_SETUP_SUCC_QCI4,
    SUM(ERAB_INI_SETUP_SUCC_QCI5) ERAB_INI_SETUP_SUCC_QCI5,
    SUM(ERAB_INI_SETUP_SUCC_QCI6) ERAB_INI_SETUP_SUCC_QCI6,
    SUM(ERAB_INI_SETUP_SUCC_QCI7) ERAB_INI_SETUP_SUCC_QCI7,
    SUM(ERAB_INI_SETUP_SUCC_QCI8) ERAB_INI_SETUP_SUCC_QCI8,
    SUM(ERAB_INI_SETUP_SUCC_QCI9) ERAB_INI_SETUP_SUCC_QCI9,
    SUM(ERAB_ADD_SETUP_SUCC_QCI1) ERAB_ADD_SETUP_SUCC_QCI1,
    SUM(ERAB_ADD_SETUP_SUCC_QCI2) ERAB_ADD_SETUP_SUCC_QCI2,
    SUM(ERAB_ADD_SETUP_SUCC_QCI3) ERAB_ADD_SETUP_SUCC_QCI3,
    SUM(ERAB_ADD_SETUP_SUCC_QCI4) ERAB_ADD_SETUP_SUCC_QCI4,
    SUM(ERAB_ADD_SETUP_SUCC_QCI5) ERAB_ADD_SETUP_SUCC_QCI5,
    SUM(ERAB_ADD_SETUP_SUCC_QCI6) ERAB_ADD_SETUP_SUCC_QCI6,
    SUM(ERAB_ADD_SETUP_SUCC_QCI7) ERAB_ADD_SETUP_SUCC_QCI7,
    SUM(ERAB_ADD_SETUP_SUCC_QCI8) ERAB_ADD_SETUP_SUCC_QCI8,
    SUM(ERAB_ADD_SETUP_SUCC_QCI9) ERAB_ADD_SETUP_SUCC_QCI9,
    SUM(ERAB_REL_ENB) ERAB_REL_ENB,
    SUM(ERAB_REL_ENB_RNL_INA) ERAB_REL_ENB_RNL_INA,
    SUM(ERAB_REL_ENB_RNL_RED) ERAB_REL_ENB_RNL_RED,
    SUM(ERAB_REL_ENB_RNL_RRNA) ERAB_REL_ENB_RNL_RRNA,
    SUM(ERAB_REL_HO_PART) ERAB_REL_HO_PART,
    SUM(ERAB_REL_HO_SUCC) ERAB_REL_HO_SUCC,
    SUM(ERAB_REL_ENB_QCI1) ERAB_REL_ENB_QCI1,
    SUM(ERAB_REL_ENB_RNL_INA_QCI1) ERAB_REL_ENB_RNL_INA_QCI1,
    SUM(ERAB_REL_ENB_RNL_RED_QCI1) ERAB_REL_ENB_RNL_RED_QCI1,
    SUM(ERAB_REL_ENB_RNL_RRNA_QCI1) ERAB_REL_ENB_RNL_RRNA_QCI1,
    SUM(ERAB_REL_HO_PART_QCI1) ERAB_REL_HO_PART_QCI1,
    SUM(ERAB_REL_EPC_PATH_SWITCH) ERAB_REL_EPC_PATH_SWITCH,
    SUM(ERAB_REL_EPC_PATH_SWITCH_QCI1) ERAB_REL_EPC_PATH_SWITCH_QCI1,
    SUM(ERAB_REL_TEMP_QCI1) ERAB_REL_TEMP_QCI1
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(EPS_BEARER_SETUP_ATTEMPTS) EPS_BEARER_SETUP_ATTEMPTS,
      SUM(EPS_BEARER_SETUP_COMPLETIONS) EPS_BEARER_SETUP_COMPLETIONS,
      SUM(EPC_EPS_BEARER_REL_REQ_NORM) EPC_EPS_BEARER_REL_REQ_NORM,
      SUM(EPC_EPS_BEARER_REL_REQ_DETACH) EPC_EPS_BEARER_REL_REQ_DETACH,
      SUM(EPC_EPS_BEARER_REL_REQ_RNL) EPC_EPS_BEARER_REL_REQ_RNL,
      SUM(EPC_EPS_BEARER_REL_REQ_OTH) EPC_EPS_BEARER_REL_REQ_OTH,
      SUM(EPS_BEARER_STP_ATT_INI_QCI_1) EPS_BEARER_STP_ATT_INI_QCI_1,
      SUM(EPS_BEAR_STP_ATT_INI_NON_GBR) EPS_BEAR_STP_ATT_INI_NON_GBR,
      SUM(EPS_BEARER_STP_ATT_ADD_QCI_1) EPS_BEARER_STP_ATT_ADD_QCI_1,
      SUM(EPS_BEARER_STP_COM_INI_QCI1) EPS_BEARER_STP_COM_INI_QCI1,
      SUM(EPS_BEAR_STP_COM_INI_NON_GBR) EPS_BEAR_STP_COM_INI_NON_GBR,
      SUM(EPC_EPS_BEAR_REL_REQ_N_QCI1) EPC_EPS_BEAR_REL_REQ_N_QCI1,
      SUM(EPC_EPS_BEAR_REL_REQ_D_QCI1) EPC_EPS_BEAR_REL_REQ_D_QCI1,
      SUM(EPC_EPS_BEAR_REL_REQ_R_QCI1) EPC_EPS_BEAR_REL_REQ_R_QCI1,
      SUM(EPC_EPS_BEAR_REL_REQ_O_QCI1) EPC_EPS_BEAR_REL_REQ_O_QCI1,
      SUM(EPS_BEARER_STP_ATT_INI_QCI_2) EPS_BEARER_STP_ATT_INI_QCI_2,
      SUM(EPS_BEARER_STP_ATT_INI_QCI_3) EPS_BEARER_STP_ATT_INI_QCI_3,
      SUM(EPS_BEARER_STP_ATT_INI_QCI_4) EPS_BEARER_STP_ATT_INI_QCI_4,
      SUM(EPS_BEARER_STP_ATT_ADD_QCI_2) EPS_BEARER_STP_ATT_ADD_QCI_2,
      SUM(EPS_BEARER_STP_ATT_ADD_QCI_3) EPS_BEARER_STP_ATT_ADD_QCI_3,
      SUM(EPS_BEARER_STP_ATT_ADD_QCI_4) EPS_BEARER_STP_ATT_ADD_QCI_4,
      SUM(EPS_BEARER_STP_COM_INI_QCI_2) EPS_BEARER_STP_COM_INI_QCI_2,
      SUM(EPS_BEARER_STP_COM_INI_QCI_3) EPS_BEARER_STP_COM_INI_QCI_3,
      SUM(EPS_BEARER_STP_COM_INI_QCI_4) EPS_BEARER_STP_COM_INI_QCI_4,
      SUM(EPS_BEARER_STP_COM_ADD_QCI_2) EPS_BEARER_STP_COM_ADD_QCI_2,
      SUM(EPS_BEARER_STP_COM_ADD_QCI_3) EPS_BEARER_STP_COM_ADD_QCI_3,
      SUM(EPS_BEARER_STP_COM_ADD_QCI_4) EPS_BEARER_STP_COM_ADD_QCI_4,
      SUM(ERAB_REL_ENB_ACT_QCI1) ERAB_REL_ENB_ACT_QCI1,
      SUM(ERAB_REL_ENB_ACT_QCI2) ERAB_REL_ENB_ACT_QCI2,
      SUM(ERAB_REL_ENB_ACT_QCI3) ERAB_REL_ENB_ACT_QCI3,
      SUM(ERAB_REL_ENB_ACT_QCI4) ERAB_REL_ENB_ACT_QCI4,
      SUM(ERAB_REL_ENB_ACT_NON_GBR) ERAB_REL_ENB_ACT_NON_GBR,
      SUM(ERAB_IN_SESSION_TIME_QCI1) ERAB_IN_SESSION_TIME_QCI1,
      SUM(ERAB_IN_SESSION_TIME_QCI2) ERAB_IN_SESSION_TIME_QCI2,
      SUM(ERAB_IN_SESSION_TIME_QCI3) ERAB_IN_SESSION_TIME_QCI3,
      SUM(ERAB_IN_SESSION_TIME_QCI4) ERAB_IN_SESSION_TIME_QCI4,
      SUM(ERAB_IN_SESSION_TIME_NON_GBR) ERAB_IN_SESSION_TIME_NON_GBR,
      SUM(ERAB_INI_SETUP_ATT_QCI1) ERAB_INI_SETUP_ATT_QCI1,
      SUM(ERAB_INI_SETUP_ATT_QCI2) ERAB_INI_SETUP_ATT_QCI2,
      SUM(ERAB_INI_SETUP_ATT_QCI3) ERAB_INI_SETUP_ATT_QCI3,
      SUM(ERAB_INI_SETUP_ATT_QCI4) ERAB_INI_SETUP_ATT_QCI4,
      SUM(ERAB_INI_SETUP_ATT_QCI5) ERAB_INI_SETUP_ATT_QCI5,
      SUM(ERAB_INI_SETUP_ATT_QCI6) ERAB_INI_SETUP_ATT_QCI6,
      SUM(ERAB_INI_SETUP_ATT_QCI7) ERAB_INI_SETUP_ATT_QCI7,
      SUM(ERAB_INI_SETUP_ATT_QCI8) ERAB_INI_SETUP_ATT_QCI8,
      SUM(ERAB_INI_SETUP_ATT_QCI9) ERAB_INI_SETUP_ATT_QCI9,
      SUM(ERAB_ADD_SETUP_ATT_QCI1) ERAB_ADD_SETUP_ATT_QCI1,
      SUM(ERAB_ADD_SETUP_ATT_QCI2) ERAB_ADD_SETUP_ATT_QCI2,
      SUM(ERAB_ADD_SETUP_ATT_QCI3) ERAB_ADD_SETUP_ATT_QCI3,
      SUM(ERAB_ADD_SETUP_ATT_QCI4) ERAB_ADD_SETUP_ATT_QCI4,
      SUM(ERAB_ADD_SETUP_ATT_QCI5) ERAB_ADD_SETUP_ATT_QCI5,
      SUM(ERAB_ADD_SETUP_ATT_QCI6) ERAB_ADD_SETUP_ATT_QCI6,
      SUM(ERAB_ADD_SETUP_ATT_QCI7) ERAB_ADD_SETUP_ATT_QCI7,
      SUM(ERAB_ADD_SETUP_ATT_QCI8) ERAB_ADD_SETUP_ATT_QCI8,
      SUM(ERAB_ADD_SETUP_ATT_QCI9) ERAB_ADD_SETUP_ATT_QCI9,
      SUM(ERAB_INI_SETUP_SUCC_QCI1) ERAB_INI_SETUP_SUCC_QCI1,
      SUM(ERAB_INI_SETUP_SUCC_QCI2) ERAB_INI_SETUP_SUCC_QCI2,
      SUM(ERAB_INI_SETUP_SUCC_QCI3) ERAB_INI_SETUP_SUCC_QCI3,
      SUM(ERAB_INI_SETUP_SUCC_QCI4) ERAB_INI_SETUP_SUCC_QCI4,
      SUM(ERAB_INI_SETUP_SUCC_QCI5) ERAB_INI_SETUP_SUCC_QCI5,
      SUM(ERAB_INI_SETUP_SUCC_QCI6) ERAB_INI_SETUP_SUCC_QCI6,
      SUM(ERAB_INI_SETUP_SUCC_QCI7) ERAB_INI_SETUP_SUCC_QCI7,
      SUM(ERAB_INI_SETUP_SUCC_QCI8) ERAB_INI_SETUP_SUCC_QCI8,
      SUM(ERAB_INI_SETUP_SUCC_QCI9) ERAB_INI_SETUP_SUCC_QCI9,
      SUM(ERAB_ADD_SETUP_SUCC_QCI1) ERAB_ADD_SETUP_SUCC_QCI1,
      SUM(ERAB_ADD_SETUP_SUCC_QCI2) ERAB_ADD_SETUP_SUCC_QCI2,
      SUM(ERAB_ADD_SETUP_SUCC_QCI3) ERAB_ADD_SETUP_SUCC_QCI3,
      SUM(ERAB_ADD_SETUP_SUCC_QCI4) ERAB_ADD_SETUP_SUCC_QCI4,
      SUM(ERAB_ADD_SETUP_SUCC_QCI5) ERAB_ADD_SETUP_SUCC_QCI5,
      SUM(ERAB_ADD_SETUP_SUCC_QCI6) ERAB_ADD_SETUP_SUCC_QCI6,
      SUM(ERAB_ADD_SETUP_SUCC_QCI7) ERAB_ADD_SETUP_SUCC_QCI7,
      SUM(ERAB_ADD_SETUP_SUCC_QCI8) ERAB_ADD_SETUP_SUCC_QCI8,
      SUM(ERAB_ADD_SETUP_SUCC_QCI9) ERAB_ADD_SETUP_SUCC_QCI9,
      SUM(ERAB_REL_ENB) ERAB_REL_ENB,
      SUM(ERAB_REL_ENB_RNL_INA) ERAB_REL_ENB_RNL_INA,
      SUM(ERAB_REL_ENB_RNL_RED) ERAB_REL_ENB_RNL_RED,
      SUM(ERAB_REL_ENB_RNL_RRNA) ERAB_REL_ENB_RNL_RRNA,
      SUM(ERAB_REL_HO_PART) ERAB_REL_HO_PART,
      SUM(ERAB_REL_HO_SUCC) ERAB_REL_HO_SUCC,
      SUM(ERAB_REL_ENB_QCI1) ERAB_REL_ENB_QCI1,
      SUM(ERAB_REL_ENB_RNL_INA_QCI1) ERAB_REL_ENB_RNL_INA_QCI1,
      SUM(ERAB_REL_ENB_RNL_RED_QCI1) ERAB_REL_ENB_RNL_RED_QCI1,
      SUM(ERAB_REL_ENB_RNL_RRNA_QCI1) ERAB_REL_ENB_RNL_RRNA_QCI1,
      SUM(ERAB_REL_HO_PART_QCI1) ERAB_REL_HO_PART_QCI1,
      SUM(ERAB_REL_EPC_PATH_SWITCH) ERAB_REL_EPC_PATH_SWITCH,
      SUM(ERAB_REL_EPC_PATH_SWITCH_QCI1) ERAB_REL_EPC_PATH_SWITCH_QCI1,
      SUM(ERAB_REL_TEMP_QCI1) ERAB_REL_TEMP_QCI1
    from    
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lepsb_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129   
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LEPSB2,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    AVG(HARQ_DURATION_QCI1_AVG) HARQ_DURATION_QCI1_AVG,
    AVG(HARQ_DURATION_QCI2_AVG) HARQ_DURATION_QCI2_AVG,
    AVG(HARQ_DURATION_QCI3_AVG) HARQ_DURATION_QCI3_AVG,
    AVG(HARQ_DURATION_QCI4_AVG) HARQ_DURATION_QCI4_AVG,
    AVG(HARQ_DURATION_QCI5_AVG) HARQ_DURATION_QCI5_AVG,
    AVG(HARQ_DURATION_QCI6_AVG) HARQ_DURATION_QCI6_AVG,
    AVG(HARQ_DURATION_QCI7_AVG) HARQ_DURATION_QCI7_AVG,
    AVG(HARQ_DURATION_QCI8_AVG) HARQ_DURATION_QCI8_AVG,
    AVG(HARQ_DURATION_QCI9_AVG) HARQ_DURATION_QCI9_AVG
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      AVG(HARQ_DURATION_QCI1_AVG) HARQ_DURATION_QCI1_AVG,
      AVG(HARQ_DURATION_QCI2_AVG) HARQ_DURATION_QCI2_AVG,
      AVG(HARQ_DURATION_QCI3_AVG) HARQ_DURATION_QCI3_AVG,
      AVG(HARQ_DURATION_QCI4_AVG) HARQ_DURATION_QCI4_AVG,
      AVG(HARQ_DURATION_QCI5_AVG) HARQ_DURATION_QCI5_AVG,
      AVG(HARQ_DURATION_QCI6_AVG) HARQ_DURATION_QCI6_AVG,
      AVG(HARQ_DURATION_QCI7_AVG) HARQ_DURATION_QCI7_AVG,
      AVG(HARQ_DURATION_QCI8_AVG) HARQ_DURATION_QCI8_AVG,
      AVG(HARQ_DURATION_QCI9_AVG) HARQ_DURATION_QCI9_AVG
    from    
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lqos_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129      
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LQOS2,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(DATA_RB_STP_ATT) DATA_RB_STP_ATT,
    SUM(DATA_RB_STP_COMP) DATA_RB_STP_COMP
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(DATA_RB_STP_ATT) DATA_RB_STP_ATT,
      SUM(DATA_RB_STP_COMP) DATA_RB_STP_COMP
    from    
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lrdb_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16
      
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129
    
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LRDB2,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(CSFB_REDIR_CR_ATT) CSFB_REDIR_CR_ATT,
    SUM(CSFB_REDIR_CR_CMODE_ATT) CSFB_REDIR_CR_CMODE_ATT,
    SUM(ISYS_HO_PREP) ISYS_HO_PREP,
    SUM(ISYS_HO_ATT) ISYS_HO_ATT,
    SUM(ISYS_HO_SUCC) ISYS_HO_SUCC,
    SUM(ISYS_HO_UTRAN_SRVCC_ATT) ISYS_HO_UTRAN_SRVCC_ATT,
    SUM(ISYS_HO_UTRAN_SRVCC_SUCC) ISYS_HO_UTRAN_SRVCC_SUCC,
    SUM(CSFB_PSHO_UTRAN_ATT) CSFB_PSHO_UTRAN_ATT,
    SUM(ISYS_HO_GERAN_SRVCC_ATT) ISYS_HO_GERAN_SRVCC_ATT,
    SUM(ISYS_HO_GERAN_SRVCC_SUCC) ISYS_HO_GERAN_SRVCC_SUCC
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(CSFB_REDIR_CR_ATT) CSFB_REDIR_CR_ATT,
      SUM(CSFB_REDIR_CR_CMODE_ATT) CSFB_REDIR_CR_CMODE_ATT,
      SUM(ISYS_HO_PREP) ISYS_HO_PREP,
      SUM(ISYS_HO_ATT) ISYS_HO_ATT,
      SUM(ISYS_HO_SUCC) ISYS_HO_SUCC,
      SUM(ISYS_HO_UTRAN_SRVCC_ATT) ISYS_HO_UTRAN_SRVCC_ATT,
      SUM(ISYS_HO_UTRAN_SRVCC_SUCC) ISYS_HO_UTRAN_SRVCC_SUCC,
      SUM(CSFB_PSHO_UTRAN_ATT) CSFB_PSHO_UTRAN_ATT,
      SUM(ISYS_HO_GERAN_SRVCC_ATT) ISYS_HO_GERAN_SRVCC_ATT,
      SUM(ISYS_HO_GERAN_SRVCC_SUCC) ISYS_HO_GERAN_SRVCC_SUCC
    from    
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lisho_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129      
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LISHO2,

  (
  select
    a.period_start_time,
    a.plmn_gid,
    SUM(RSSI_PUCCH_LEVEL_01) RSSI_PUCCH_LEVEL_01,
    SUM(RSSI_PUCCH_LEVEL_02) RSSI_PUCCH_LEVEL_02,
    SUM(RSSI_PUCCH_LEVEL_03) RSSI_PUCCH_LEVEL_03,
    SUM(RSSI_PUCCH_LEVEL_04) RSSI_PUCCH_LEVEL_04,
    SUM(RSSI_PUCCH_LEVEL_05) RSSI_PUCCH_LEVEL_05,
    SUM(RSSI_PUCCH_LEVEL_06) RSSI_PUCCH_LEVEL_06,
    SUM(RSSI_PUCCH_LEVEL_07) RSSI_PUCCH_LEVEL_07,
    SUM(RSSI_PUCCH_LEVEL_08) RSSI_PUCCH_LEVEL_08,
    SUM(RSSI_PUCCH_LEVEL_09) RSSI_PUCCH_LEVEL_09,
    SUM(RSSI_PUCCH_LEVEL_10) RSSI_PUCCH_LEVEL_10,
    SUM(RSSI_PUCCH_LEVEL_11) RSSI_PUCCH_LEVEL_11,
    SUM(RSSI_PUCCH_LEVEL_12) RSSI_PUCCH_LEVEL_12,
    SUM(RSSI_PUCCH_LEVEL_13) RSSI_PUCCH_LEVEL_13,
    SUM(RSSI_PUCCH_LEVEL_14) RSSI_PUCCH_LEVEL_14,
    SUM(RSSI_PUCCH_LEVEL_15) RSSI_PUCCH_LEVEL_15,
    SUM(RSSI_PUCCH_LEVEL_16) RSSI_PUCCH_LEVEL_16,
    SUM(RSSI_PUCCH_LEVEL_17) RSSI_PUCCH_LEVEL_17,
    SUM(RSSI_PUCCH_LEVEL_18) RSSI_PUCCH_LEVEL_18,
    SUM(RSSI_PUCCH_LEVEL_19) RSSI_PUCCH_LEVEL_19,
    SUM(RSSI_PUCCH_LEVEL_20) RSSI_PUCCH_LEVEL_20,
    SUM(RSSI_PUCCH_LEVEL_21) RSSI_PUCCH_LEVEL_21,
    SUM(RSSI_PUCCH_LEVEL_22) RSSI_PUCCH_LEVEL_22,
    SUM(RSSI_PUSCH_LEVEL_01) RSSI_PUSCH_LEVEL_01,
    SUM(RSSI_PUSCH_LEVEL_02) RSSI_PUSCH_LEVEL_02,
    SUM(RSSI_PUSCH_LEVEL_03) RSSI_PUSCH_LEVEL_03,
    SUM(RSSI_PUSCH_LEVEL_04) RSSI_PUSCH_LEVEL_04,
    SUM(RSSI_PUSCH_LEVEL_05) RSSI_PUSCH_LEVEL_05,
    SUM(RSSI_PUSCH_LEVEL_06) RSSI_PUSCH_LEVEL_06,
    SUM(RSSI_PUSCH_LEVEL_07) RSSI_PUSCH_LEVEL_07,
    SUM(RSSI_PUSCH_LEVEL_08) RSSI_PUSCH_LEVEL_08,
    SUM(RSSI_PUSCH_LEVEL_09) RSSI_PUSCH_LEVEL_09,
    SUM(RSSI_PUSCH_LEVEL_10) RSSI_PUSCH_LEVEL_10,
    SUM(RSSI_PUSCH_LEVEL_11) RSSI_PUSCH_LEVEL_11,
    SUM(RSSI_PUSCH_LEVEL_12) RSSI_PUSCH_LEVEL_12,
    SUM(RSSI_PUSCH_LEVEL_13) RSSI_PUSCH_LEVEL_13,
    SUM(RSSI_PUSCH_LEVEL_14) RSSI_PUSCH_LEVEL_14,
    SUM(RSSI_PUSCH_LEVEL_15) RSSI_PUSCH_LEVEL_15,
    SUM(RSSI_PUSCH_LEVEL_16) RSSI_PUSCH_LEVEL_16,
    SUM(RSSI_PUSCH_LEVEL_17) RSSI_PUSCH_LEVEL_17,
    SUM(RSSI_PUSCH_LEVEL_18) RSSI_PUSCH_LEVEL_18,
    SUM(RSSI_PUSCH_LEVEL_19) RSSI_PUSCH_LEVEL_19,
    SUM(RSSI_PUSCH_LEVEL_20) RSSI_PUSCH_LEVEL_20,
    SUM(RSSI_PUSCH_LEVEL_21) RSSI_PUSCH_LEVEL_21,
    SUM(RSSI_PUSCH_LEVEL_22) RSSI_PUSCH_LEVEL_22,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL1) UE_PWR_HEADROOM_PUSCH_LEVEL1,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL2) UE_PWR_HEADROOM_PUSCH_LEVEL2,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL3) UE_PWR_HEADROOM_PUSCH_LEVEL3,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL4) UE_PWR_HEADROOM_PUSCH_LEVEL4,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL5) UE_PWR_HEADROOM_PUSCH_LEVEL5,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL6) UE_PWR_HEADROOM_PUSCH_LEVEL6,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL7) UE_PWR_HEADROOM_PUSCH_LEVEL7,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL8) UE_PWR_HEADROOM_PUSCH_LEVEL8,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL9) UE_PWR_HEADROOM_PUSCH_LEVEL9,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL10) UE_PWR_HEADROOM_PUSCH_LEVEL10,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL11) UE_PWR_HEADROOM_PUSCH_LEVEL11,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL12) UE_PWR_HEADROOM_PUSCH_LEVEL12,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL13) UE_PWR_HEADROOM_PUSCH_LEVEL13,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL14) UE_PWR_HEADROOM_PUSCH_LEVEL14,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL15) UE_PWR_HEADROOM_PUSCH_LEVEL15,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL16) UE_PWR_HEADROOM_PUSCH_LEVEL16,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL17) UE_PWR_HEADROOM_PUSCH_LEVEL17,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL18) UE_PWR_HEADROOM_PUSCH_LEVEL18,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL19) UE_PWR_HEADROOM_PUSCH_LEVEL19,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL20) UE_PWR_HEADROOM_PUSCH_LEVEL20,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL21) UE_PWR_HEADROOM_PUSCH_LEVEL21,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL22) UE_PWR_HEADROOM_PUSCH_LEVEL22,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL23) UE_PWR_HEADROOM_PUSCH_LEVEL23,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL24) UE_PWR_HEADROOM_PUSCH_LEVEL24,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL25) UE_PWR_HEADROOM_PUSCH_LEVEL25,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL26) UE_PWR_HEADROOM_PUSCH_LEVEL26,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL27) UE_PWR_HEADROOM_PUSCH_LEVEL27,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL28) UE_PWR_HEADROOM_PUSCH_LEVEL28,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL29) UE_PWR_HEADROOM_PUSCH_LEVEL29,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL30) UE_PWR_HEADROOM_PUSCH_LEVEL30,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL31) UE_PWR_HEADROOM_PUSCH_LEVEL31,
    SUM(UE_PWR_HEADROOM_PUSCH_LEVEL32) UE_PWR_HEADROOM_PUSCH_LEVEL32,
    SUM(SINR_PUCCH_LEVEL_1) SINR_PUCCH_LEVEL_1,
    SUM(SINR_PUCCH_LEVEL_2) SINR_PUCCH_LEVEL_2,
    SUM(SINR_PUCCH_LEVEL_3) SINR_PUCCH_LEVEL_3,
    SUM(SINR_PUCCH_LEVEL_4) SINR_PUCCH_LEVEL_4,
    SUM(SINR_PUCCH_LEVEL_5) SINR_PUCCH_LEVEL_5,
    SUM(SINR_PUCCH_LEVEL_6) SINR_PUCCH_LEVEL_6,
    SUM(SINR_PUCCH_LEVEL_7) SINR_PUCCH_LEVEL_7,
    SUM(SINR_PUCCH_LEVEL_8) SINR_PUCCH_LEVEL_8,
    SUM(SINR_PUCCH_LEVEL_9) SINR_PUCCH_LEVEL_9,
    SUM(SINR_PUCCH_LEVEL_10) SINR_PUCCH_LEVEL_10,
    SUM(SINR_PUCCH_LEVEL_11) SINR_PUCCH_LEVEL_11,
    SUM(SINR_PUCCH_LEVEL_12) SINR_PUCCH_LEVEL_12,
    SUM(SINR_PUCCH_LEVEL_13) SINR_PUCCH_LEVEL_13,
    SUM(SINR_PUCCH_LEVEL_14) SINR_PUCCH_LEVEL_14,
    SUM(SINR_PUCCH_LEVEL_15) SINR_PUCCH_LEVEL_15,
    SUM(SINR_PUCCH_LEVEL_16) SINR_PUCCH_LEVEL_16,
    SUM(SINR_PUCCH_LEVEL_17) SINR_PUCCH_LEVEL_17,
    SUM(SINR_PUCCH_LEVEL_18) SINR_PUCCH_LEVEL_18,
    SUM(SINR_PUCCH_LEVEL_19) SINR_PUCCH_LEVEL_19,
    SUM(SINR_PUCCH_LEVEL_20) SINR_PUCCH_LEVEL_20,
    SUM(SINR_PUCCH_LEVEL_21) SINR_PUCCH_LEVEL_21,
    SUM(SINR_PUCCH_LEVEL_22) SINR_PUCCH_LEVEL_22,
    SUM(SINR_PUSCH_LEVEL_1) SINR_PUSCH_LEVEL_1,
    SUM(SINR_PUSCH_LEVEL_2) SINR_PUSCH_LEVEL_2,
    SUM(SINR_PUSCH_LEVEL_3) SINR_PUSCH_LEVEL_3,
    SUM(SINR_PUSCH_LEVEL_4) SINR_PUSCH_LEVEL_4,
    SUM(SINR_PUSCH_LEVEL_5) SINR_PUSCH_LEVEL_5,
    SUM(SINR_PUSCH_LEVEL_6) SINR_PUSCH_LEVEL_6,
    SUM(SINR_PUSCH_LEVEL_7) SINR_PUSCH_LEVEL_7,
    SUM(SINR_PUSCH_LEVEL_8) SINR_PUSCH_LEVEL_8,
    SUM(SINR_PUSCH_LEVEL_9) SINR_PUSCH_LEVEL_9,
    SUM(SINR_PUSCH_LEVEL_10) SINR_PUSCH_LEVEL_10,
    SUM(SINR_PUSCH_LEVEL_11) SINR_PUSCH_LEVEL_11,
    SUM(SINR_PUSCH_LEVEL_12) SINR_PUSCH_LEVEL_12,
    SUM(SINR_PUSCH_LEVEL_13) SINR_PUSCH_LEVEL_13,
    SUM(SINR_PUSCH_LEVEL_14) SINR_PUSCH_LEVEL_14,
    SUM(SINR_PUSCH_LEVEL_15) SINR_PUSCH_LEVEL_15,
    SUM(SINR_PUSCH_LEVEL_16) SINR_PUSCH_LEVEL_16,
    SUM(SINR_PUSCH_LEVEL_17) SINR_PUSCH_LEVEL_17,
    SUM(SINR_PUSCH_LEVEL_18) SINR_PUSCH_LEVEL_18,
    SUM(SINR_PUSCH_LEVEL_19) SINR_PUSCH_LEVEL_19,
    SUM(SINR_PUSCH_LEVEL_20) SINR_PUSCH_LEVEL_20,
    SUM(SINR_PUSCH_LEVEL_21) SINR_PUSCH_LEVEL_21,
    SUM(SINR_PUSCH_LEVEL_22) SINR_PUSCH_LEVEL_22
  from
    (
    select
      trunc( p.period_start_time, 'dd' ) period_start_time,
      "plmn".co_gid plmn_gid,
      "vloflnbtsparent".co_gid vloflnbtsparent_gid,
      "lnbts".co_gid lnbts_gid,
      SUM(RSSI_PUCCH_LEVEL_01) RSSI_PUCCH_LEVEL_01,
      SUM(RSSI_PUCCH_LEVEL_02) RSSI_PUCCH_LEVEL_02,
      SUM(RSSI_PUCCH_LEVEL_03) RSSI_PUCCH_LEVEL_03,
      SUM(RSSI_PUCCH_LEVEL_04) RSSI_PUCCH_LEVEL_04,
      SUM(RSSI_PUCCH_LEVEL_05) RSSI_PUCCH_LEVEL_05,
      SUM(RSSI_PUCCH_LEVEL_06) RSSI_PUCCH_LEVEL_06,
      SUM(RSSI_PUCCH_LEVEL_07) RSSI_PUCCH_LEVEL_07,
      SUM(RSSI_PUCCH_LEVEL_08) RSSI_PUCCH_LEVEL_08,
      SUM(RSSI_PUCCH_LEVEL_09) RSSI_PUCCH_LEVEL_09,
      SUM(RSSI_PUCCH_LEVEL_10) RSSI_PUCCH_LEVEL_10,
      SUM(RSSI_PUCCH_LEVEL_11) RSSI_PUCCH_LEVEL_11,
      SUM(RSSI_PUCCH_LEVEL_12) RSSI_PUCCH_LEVEL_12,
      SUM(RSSI_PUCCH_LEVEL_13) RSSI_PUCCH_LEVEL_13,
      SUM(RSSI_PUCCH_LEVEL_14) RSSI_PUCCH_LEVEL_14,
      SUM(RSSI_PUCCH_LEVEL_15) RSSI_PUCCH_LEVEL_15,
      SUM(RSSI_PUCCH_LEVEL_16) RSSI_PUCCH_LEVEL_16,
      SUM(RSSI_PUCCH_LEVEL_17) RSSI_PUCCH_LEVEL_17,
      SUM(RSSI_PUCCH_LEVEL_18) RSSI_PUCCH_LEVEL_18,
      SUM(RSSI_PUCCH_LEVEL_19) RSSI_PUCCH_LEVEL_19,
      SUM(RSSI_PUCCH_LEVEL_20) RSSI_PUCCH_LEVEL_20,
      SUM(RSSI_PUCCH_LEVEL_21) RSSI_PUCCH_LEVEL_21,
      SUM(RSSI_PUCCH_LEVEL_22) RSSI_PUCCH_LEVEL_22,
      SUM(RSSI_PUSCH_LEVEL_01) RSSI_PUSCH_LEVEL_01,
      SUM(RSSI_PUSCH_LEVEL_02) RSSI_PUSCH_LEVEL_02,
      SUM(RSSI_PUSCH_LEVEL_03) RSSI_PUSCH_LEVEL_03,
      SUM(RSSI_PUSCH_LEVEL_04) RSSI_PUSCH_LEVEL_04,
      SUM(RSSI_PUSCH_LEVEL_05) RSSI_PUSCH_LEVEL_05,
      SUM(RSSI_PUSCH_LEVEL_06) RSSI_PUSCH_LEVEL_06,
      SUM(RSSI_PUSCH_LEVEL_07) RSSI_PUSCH_LEVEL_07,
      SUM(RSSI_PUSCH_LEVEL_08) RSSI_PUSCH_LEVEL_08,
      SUM(RSSI_PUSCH_LEVEL_09) RSSI_PUSCH_LEVEL_09,
      SUM(RSSI_PUSCH_LEVEL_10) RSSI_PUSCH_LEVEL_10,
      SUM(RSSI_PUSCH_LEVEL_11) RSSI_PUSCH_LEVEL_11,
      SUM(RSSI_PUSCH_LEVEL_12) RSSI_PUSCH_LEVEL_12,
      SUM(RSSI_PUSCH_LEVEL_13) RSSI_PUSCH_LEVEL_13,
      SUM(RSSI_PUSCH_LEVEL_14) RSSI_PUSCH_LEVEL_14,
      SUM(RSSI_PUSCH_LEVEL_15) RSSI_PUSCH_LEVEL_15,
      SUM(RSSI_PUSCH_LEVEL_16) RSSI_PUSCH_LEVEL_16,
      SUM(RSSI_PUSCH_LEVEL_17) RSSI_PUSCH_LEVEL_17,
      SUM(RSSI_PUSCH_LEVEL_18) RSSI_PUSCH_LEVEL_18,
      SUM(RSSI_PUSCH_LEVEL_19) RSSI_PUSCH_LEVEL_19,
      SUM(RSSI_PUSCH_LEVEL_20) RSSI_PUSCH_LEVEL_20,
      SUM(RSSI_PUSCH_LEVEL_21) RSSI_PUSCH_LEVEL_21,
      SUM(RSSI_PUSCH_LEVEL_22) RSSI_PUSCH_LEVEL_22,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL1) UE_PWR_HEADROOM_PUSCH_LEVEL1,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL2) UE_PWR_HEADROOM_PUSCH_LEVEL2,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL3) UE_PWR_HEADROOM_PUSCH_LEVEL3,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL4) UE_PWR_HEADROOM_PUSCH_LEVEL4,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL5) UE_PWR_HEADROOM_PUSCH_LEVEL5,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL6) UE_PWR_HEADROOM_PUSCH_LEVEL6,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL7) UE_PWR_HEADROOM_PUSCH_LEVEL7,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL8) UE_PWR_HEADROOM_PUSCH_LEVEL8,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL9) UE_PWR_HEADROOM_PUSCH_LEVEL9,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL10) UE_PWR_HEADROOM_PUSCH_LEVEL10,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL11) UE_PWR_HEADROOM_PUSCH_LEVEL11,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL12) UE_PWR_HEADROOM_PUSCH_LEVEL12,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL13) UE_PWR_HEADROOM_PUSCH_LEVEL13,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL14) UE_PWR_HEADROOM_PUSCH_LEVEL14,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL15) UE_PWR_HEADROOM_PUSCH_LEVEL15,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL16) UE_PWR_HEADROOM_PUSCH_LEVEL16,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL17) UE_PWR_HEADROOM_PUSCH_LEVEL17,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL18) UE_PWR_HEADROOM_PUSCH_LEVEL18,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL19) UE_PWR_HEADROOM_PUSCH_LEVEL19,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL20) UE_PWR_HEADROOM_PUSCH_LEVEL20,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL21) UE_PWR_HEADROOM_PUSCH_LEVEL21,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL22) UE_PWR_HEADROOM_PUSCH_LEVEL22,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL23) UE_PWR_HEADROOM_PUSCH_LEVEL23,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL24) UE_PWR_HEADROOM_PUSCH_LEVEL24,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL25) UE_PWR_HEADROOM_PUSCH_LEVEL25,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL26) UE_PWR_HEADROOM_PUSCH_LEVEL26,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL27) UE_PWR_HEADROOM_PUSCH_LEVEL27,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL28) UE_PWR_HEADROOM_PUSCH_LEVEL28,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL29) UE_PWR_HEADROOM_PUSCH_LEVEL29,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL30) UE_PWR_HEADROOM_PUSCH_LEVEL30,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL31) UE_PWR_HEADROOM_PUSCH_LEVEL31,
      SUM(UE_PWR_HEADROOM_PUSCH_LEVEL32) UE_PWR_HEADROOM_PUSCH_LEVEL32,
      SUM(SINR_PUCCH_LEVEL_1) SINR_PUCCH_LEVEL_1,
      SUM(SINR_PUCCH_LEVEL_2) SINR_PUCCH_LEVEL_2,
      SUM(SINR_PUCCH_LEVEL_3) SINR_PUCCH_LEVEL_3,
      SUM(SINR_PUCCH_LEVEL_4) SINR_PUCCH_LEVEL_4,
      SUM(SINR_PUCCH_LEVEL_5) SINR_PUCCH_LEVEL_5,
      SUM(SINR_PUCCH_LEVEL_6) SINR_PUCCH_LEVEL_6,
      SUM(SINR_PUCCH_LEVEL_7) SINR_PUCCH_LEVEL_7,
      SUM(SINR_PUCCH_LEVEL_8) SINR_PUCCH_LEVEL_8,
      SUM(SINR_PUCCH_LEVEL_9) SINR_PUCCH_LEVEL_9,
      SUM(SINR_PUCCH_LEVEL_10) SINR_PUCCH_LEVEL_10,
      SUM(SINR_PUCCH_LEVEL_11) SINR_PUCCH_LEVEL_11,
      SUM(SINR_PUCCH_LEVEL_12) SINR_PUCCH_LEVEL_12,
      SUM(SINR_PUCCH_LEVEL_13) SINR_PUCCH_LEVEL_13,
      SUM(SINR_PUCCH_LEVEL_14) SINR_PUCCH_LEVEL_14,
      SUM(SINR_PUCCH_LEVEL_15) SINR_PUCCH_LEVEL_15,
      SUM(SINR_PUCCH_LEVEL_16) SINR_PUCCH_LEVEL_16,
      SUM(SINR_PUCCH_LEVEL_17) SINR_PUCCH_LEVEL_17,
      SUM(SINR_PUCCH_LEVEL_18) SINR_PUCCH_LEVEL_18,
      SUM(SINR_PUCCH_LEVEL_19) SINR_PUCCH_LEVEL_19,
      SUM(SINR_PUCCH_LEVEL_20) SINR_PUCCH_LEVEL_20,
      SUM(SINR_PUCCH_LEVEL_21) SINR_PUCCH_LEVEL_21,
      SUM(SINR_PUCCH_LEVEL_22) SINR_PUCCH_LEVEL_22,
      SUM(SINR_PUSCH_LEVEL_1) SINR_PUSCH_LEVEL_1,
      SUM(SINR_PUSCH_LEVEL_2) SINR_PUSCH_LEVEL_2,
      SUM(SINR_PUSCH_LEVEL_3) SINR_PUSCH_LEVEL_3,
      SUM(SINR_PUSCH_LEVEL_4) SINR_PUSCH_LEVEL_4,
      SUM(SINR_PUSCH_LEVEL_5) SINR_PUSCH_LEVEL_5,
      SUM(SINR_PUSCH_LEVEL_6) SINR_PUSCH_LEVEL_6,
      SUM(SINR_PUSCH_LEVEL_7) SINR_PUSCH_LEVEL_7,
      SUM(SINR_PUSCH_LEVEL_8) SINR_PUSCH_LEVEL_8,
      SUM(SINR_PUSCH_LEVEL_9) SINR_PUSCH_LEVEL_9,
      SUM(SINR_PUSCH_LEVEL_10) SINR_PUSCH_LEVEL_10,
      SUM(SINR_PUSCH_LEVEL_11) SINR_PUSCH_LEVEL_11,
      SUM(SINR_PUSCH_LEVEL_12) SINR_PUSCH_LEVEL_12,
      SUM(SINR_PUSCH_LEVEL_13) SINR_PUSCH_LEVEL_13,
      SUM(SINR_PUSCH_LEVEL_14) SINR_PUSCH_LEVEL_14,
      SUM(SINR_PUSCH_LEVEL_15) SINR_PUSCH_LEVEL_15,
      SUM(SINR_PUSCH_LEVEL_16) SINR_PUSCH_LEVEL_16,
      SUM(SINR_PUSCH_LEVEL_17) SINR_PUSCH_LEVEL_17,
      SUM(SINR_PUSCH_LEVEL_18) SINR_PUSCH_LEVEL_18,
      SUM(SINR_PUSCH_LEVEL_19) SINR_PUSCH_LEVEL_19,
      SUM(SINR_PUSCH_LEVEL_20) SINR_PUSCH_LEVEL_20,
      SUM(SINR_PUSCH_LEVEL_21) SINR_PUSCH_LEVEL_21,
      SUM(SINR_PUSCH_LEVEL_22) SINR_PUSCH_LEVEL_22
    from    
      utp_common_objects "plmn",
      utp_common_objects "vloflnbtsparent",
      utp_common_objects "lnbts",   
      noklte_ps_lpqul_lnbts_day p
    where
      "plmn".co_gid in ( '100000' ) 
      and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
      and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
      and "plmn".co_oc_id = 16    
      and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
      and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
      and "lnbts".co_gid = p.lnbts_id
      and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
      and "lnbts".co_oc_id = 3129      
    group by
      trunc( p.period_start_time, 'dd' ),
      "plmn".co_gid,
      "vloflnbtsparent".co_gid,
      "lnbts".co_gid
    ) a
  group by
    a.period_start_time,
    a.plmn_gid
  ) LPQUL2,
  
  (
  select
    period_start_time,
    plmn_gid
  from
  (
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        trunc( p.period_start_time, 'dd' ) period_start_time,
        "plmn".co_gid plmn_gid,
        SUM(CASE WHEN SEVERITY_ID = '1' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_CRIT,
        SUM(CASE WHEN SEVERITY_ID = '2' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_MAJR,
        SUM(CASE WHEN SEVERITY_ID = '3' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_MINR,
        SUM(CASE WHEN SEVERITY_ID = '4' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_WARN,
        SUM(CASE WHEN SEVERITY_ID = '1' THEN DUR_CREATED_ALARMS ELSE 0 END) DUR_CA_CRIT,
        SUM(CASE WHEN SEVERITY_ID = '2' THEN DUR_CREATED_ALARMS ELSE 0 END) DUR_CA_MAJR,
        SUM(CASE WHEN SEVERITY_ID = '3' THEN DUR_CREATED_ALARMS ELSE 0 END) DUR_CA_MINR,
        SUM(CASE WHEN SEVERITY_ID = '4' THEN DUR_CREATED_ALARMS ELSE 0 END) DUR_CA_WARN,
        SUM(CASE WHEN ALARM_TYPE_ID = '1' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_COM,
        SUM(CASE WHEN ALARM_TYPE_ID = '2' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_ENV,
        SUM(CASE WHEN ALARM_TYPE_ID = '3' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_EQUI,
        SUM(CASE WHEN ALARM_TYPE_ID = '4' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_PROS,
        SUM(CASE WHEN ALARM_TYPE_ID = '5' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_CA_QOS,
        SUM(CASE WHEN ALARM_NUMBER BETWEEN 7400 AND 7430 THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_EXT,
        SUM(CASE WHEN ALARM_NUMBER = '7650' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_BSF,
        SUM(CASE WHEN ALARM_NUMBER = '7651' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_BSD,
        SUM(CASE WHEN ALARM_NUMBER = '7652' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_BSN,
        SUM(CASE WHEN ALARM_NUMBER = '7653' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_CF,
        SUM(CASE WHEN ALARM_NUMBER = '7654' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_CD,
        SUM(CASE WHEN ALARM_NUMBER = '7655' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_CN,
        SUM(CASE WHEN ALARM_NUMBER = '7656' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_BSCL,
        SUM(CASE WHEN ALARM_NUMBER = '7657' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_BSCD,
        SUM(CASE WHEN ALARM_NUMBER = '71058' THEN NBR_CREATED_ALARMS ELSE 0 END) NBR_ALARMS_OMCF
      from        
        utp_common_objects "plmn",
        utp_common_objects "vloflnbtsparent",
        REPALS_D_ALARM_MEMBERS alrm,
        (
        select 
          connect_by_root "vloflnbtsparent".co_gid vloflnbtsparent_gid, "vloflnbtsparent".co_gid
        from
          utp_common_objects "vloflnbtsparent"
        start with "vloflnbtsparent".co_gid in 
        (
          select
            "vloflnbtsparent".co_gid
          from 
            utp_common_objects "plmn",
            utp_common_objects "vloflnbtsparent"
          where 
            "vloflnbtsparent".co_parent_gid = "plmn".co_gid and
            ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 ) and
            "plmn".co_oc_id = 16         
        )
      connect by 
        prior "vloflnbtsparent".co_gid = "vloflnbtsparent".co_parent_gid) alrmobj,
        REPALS_P_ALARMS_RAW  p
      where
        "plmn".co_gid in ( '100000' )  and
        period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')  and
        period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss') and
        p.alarm_id = alrm.alarm_id and
        "vloflnbtsparent".co_gid = alrmobj.vloflnbtsparent_gid and
        alrmobj.co_gid = p.co_gid and
        "vloflnbtsparent".co_parent_gid = "plmn".co_gid and
        "plmn".co_oc_id=16 and
        ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 ) 
      group by
        trunc( p.period_start_time, 'dd' ),
        "plmn".co_gid
      ) jf_ALARMS_3018221348
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(SAMPLES_CELL_AVAIL) SAMPLES_CELL_AVAIL,
        SUM(SAMPLES_CELL_PLAN_UNAVAIL) SAMPLES_CELL_PLAN_UNAVAIL,
        SUM(DENOM_CELL_AVAIL) DENOM_CELL_AVAIL
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(SAMPLES_CELL_AVAIL) SAMPLES_CELL_AVAIL,
          SUM(SAMPLES_CELL_PLAN_UNAVAIL) SAMPLES_CELL_PLAN_UNAVAIL,
          SUM(DENOM_CELL_AVAIL) DENOM_CELL_AVAIL
        from
          
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",
        
          noklte_ps_lcelav_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16
          
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129
        
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LCELAV2_3091079593
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        AVG(UE_DRB_DL_DATA_QCI_1) UE_DRB_DL_DATA_QCI_1,
        SUM(PDSCH_TRANS_USING_MCS29) PDSCH_TRANS_USING_MCS29,
        SUM(PDSCH_TRANS_USING_MCS30) PDSCH_TRANS_USING_MCS30,
        SUM(PDSCH_TRANS_USING_MCS31) PDSCH_TRANS_USING_MCS31,
        SUM(PDSCH_TRANS_NACK_MCS29) PDSCH_TRANS_NACK_MCS29,
        SUM(PDSCH_TRANS_NACK_MCS30) PDSCH_TRANS_NACK_MCS30,
        SUM(PDSCH_TRANS_NACK_MCS31) PDSCH_TRANS_NACK_MCS31,
        SUM(TB_BUND2_NACK_PDSCH_MCS29) TB_BUND2_NACK_PDSCH_MCS29,
        SUM(TB_BUND3_NACK_PDSCH_MCS29) TB_BUND3_NACK_PDSCH_MCS29,
        SUM(TB_BUND4_NACK_PDSCH_MCS29) TB_BUND4_NACK_PDSCH_MCS29,
        SUM(TB_BUND2_NACK_PDSCH_MCS30) TB_BUND2_NACK_PDSCH_MCS30,
        SUM(TB_BUND3_NACK_PDSCH_MCS30) TB_BUND3_NACK_PDSCH_MCS30,
        SUM(TB_BUND4_NACK_PDSCH_MCS30) TB_BUND4_NACK_PDSCH_MCS30,
        SUM(TB_BUND2_NACK_PDSCH_MCS31) TB_BUND2_NACK_PDSCH_MCS31,
        SUM(TB_BUND3_NACK_PDSCH_MCS31) TB_BUND3_NACK_PDSCH_MCS31,
        SUM(TB_BUND4_NACK_PDSCH_MCS31) TB_BUND4_NACK_PDSCH_MCS31,
        SUM(SUM_ACTIVE_UE_DATA_DL) SUM_ACTIVE_UE_DATA_DL,
        SUM(DENOM_ACTIVE_UE_DATA_DL) DENOM_ACTIVE_UE_DATA_DL,
        SUM(SUM_ACTIVE_UE_DATA_UL) SUM_ACTIVE_UE_DATA_UL,
        SUM(DENOM_ACTIVE_UE_DATA_UL) DENOM_ACTIVE_UE_DATA_UL,
        AVG(PDCP_RET_DL_DEL_MEAN_QCI_1) PDCP_RET_DL_DEL_MEAN_QCI_1,
        AVG(PDCP_RET_DL_DEL_MEAN_QCI_2) PDCP_RET_DL_DEL_MEAN_QCI_2,
        AVG(PDCP_RET_DL_DEL_MEAN_QCI_3) PDCP_RET_DL_DEL_MEAN_QCI_3,
        AVG(PDCP_RET_DL_DEL_MEAN_QCI_4) PDCP_RET_DL_DEL_MEAN_QCI_4,
        SUM(RACH_STP_ATT_DEDICATED) RACH_STP_ATT_DEDICATED,
        AVG(PDCP_RET_DL_DEL_MEAN_QCI_5) PDCP_RET_DL_DEL_MEAN_QCI_5,
        AVG(PDCP_RET_DL_DEL_MEAN_QCI_6) PDCP_RET_DL_DEL_MEAN_QCI_6,
        AVG(PDCP_RET_DL_DEL_MEAN_QCI_7) PDCP_RET_DL_DEL_MEAN_QCI_7,
        AVG(PDCP_RET_DL_DEL_MEAN_QCI_8) PDCP_RET_DL_DEL_MEAN_QCI_8,
        AVG(PDCP_RET_DL_DEL_MEAN_QCI_9) PDCP_RET_DL_DEL_MEAN_QCI_9,
        SUM(SUM_RRC_CONN_UE) SUM_RRC_CONN_UE,
        SUM(DENOM_RRC_CONN_UE) DENOM_RRC_CONN_UE,
        SUM(TB_BUND2_NACK_PDSCH_MCS0) TB_BUND2_NACK_PDSCH_MCS0,
        SUM(TB_BUND2_NACK_PDSCH_MCS1) TB_BUND2_NACK_PDSCH_MCS1,
        SUM(TB_BUND2_NACK_PDSCH_MCS2) TB_BUND2_NACK_PDSCH_MCS2,
        SUM(TB_BUND2_NACK_PDSCH_MCS3) TB_BUND2_NACK_PDSCH_MCS3,
        SUM(TB_BUND2_NACK_PDSCH_MCS4) TB_BUND2_NACK_PDSCH_MCS4,
        SUM(TB_BUND2_NACK_PDSCH_MCS5) TB_BUND2_NACK_PDSCH_MCS5,
        SUM(TB_BUND2_NACK_PDSCH_MCS6) TB_BUND2_NACK_PDSCH_MCS6,
        SUM(TB_BUND2_NACK_PDSCH_MCS7) TB_BUND2_NACK_PDSCH_MCS7,
        SUM(TB_BUND2_NACK_PDSCH_MCS8) TB_BUND2_NACK_PDSCH_MCS8,
        SUM(TB_BUND2_NACK_PDSCH_MCS9) TB_BUND2_NACK_PDSCH_MCS9,
        SUM(TB_BUND2_NACK_PDSCH_MCS10) TB_BUND2_NACK_PDSCH_MCS10,
        SUM(TB_BUND2_NACK_PDSCH_MCS11) TB_BUND2_NACK_PDSCH_MCS11,
        SUM(TB_BUND2_NACK_PDSCH_MCS12) TB_BUND2_NACK_PDSCH_MCS12,
        SUM(TB_BUND2_NACK_PDSCH_MCS13) TB_BUND2_NACK_PDSCH_MCS13,
        SUM(TB_BUND2_NACK_PDSCH_MCS14) TB_BUND2_NACK_PDSCH_MCS14,
        SUM(TB_BUND2_NACK_PDSCH_MCS15) TB_BUND2_NACK_PDSCH_MCS15,
        SUM(TB_BUND2_NACK_PDSCH_MCS16) TB_BUND2_NACK_PDSCH_MCS16,
        SUM(TB_BUND2_NACK_PDSCH_MCS17) TB_BUND2_NACK_PDSCH_MCS17,
        SUM(TB_BUND2_NACK_PDSCH_MCS18) TB_BUND2_NACK_PDSCH_MCS18,
        SUM(TB_BUND2_NACK_PDSCH_MCS19) TB_BUND2_NACK_PDSCH_MCS19,
        SUM(TB_BUND2_NACK_PDSCH_MCS20) TB_BUND2_NACK_PDSCH_MCS20,
        SUM(TB_BUND2_NACK_PDSCH_MCS21) TB_BUND2_NACK_PDSCH_MCS21,
        SUM(TB_BUND2_NACK_PDSCH_MCS22) TB_BUND2_NACK_PDSCH_MCS22,
        SUM(TB_BUND2_NACK_PDSCH_MCS23) TB_BUND2_NACK_PDSCH_MCS23,
        SUM(TB_BUND2_NACK_PDSCH_MCS24) TB_BUND2_NACK_PDSCH_MCS24,
        SUM(TB_BUND2_NACK_PDSCH_MCS25) TB_BUND2_NACK_PDSCH_MCS25,
        SUM(TB_BUND2_NACK_PDSCH_MCS26) TB_BUND2_NACK_PDSCH_MCS26,
        SUM(TB_BUND2_NACK_PDSCH_MCS27) TB_BUND2_NACK_PDSCH_MCS27,
        SUM(TB_BUND2_NACK_PDSCH_MCS28) TB_BUND2_NACK_PDSCH_MCS28,
        SUM(TB_BUND3_NACK_PDSCH_MCS0) TB_BUND3_NACK_PDSCH_MCS0,
        SUM(TB_BUND3_NACK_PDSCH_MCS1) TB_BUND3_NACK_PDSCH_MCS1,
        SUM(TB_BUND3_NACK_PDSCH_MCS2) TB_BUND3_NACK_PDSCH_MCS2,
        SUM(TB_BUND3_NACK_PDSCH_MCS3) TB_BUND3_NACK_PDSCH_MCS3,
        SUM(TB_BUND3_NACK_PDSCH_MCS4) TB_BUND3_NACK_PDSCH_MCS4,
        SUM(TB_BUND3_NACK_PDSCH_MCS5) TB_BUND3_NACK_PDSCH_MCS5,
        SUM(TB_BUND3_NACK_PDSCH_MCS6) TB_BUND3_NACK_PDSCH_MCS6,
        SUM(TB_BUND3_NACK_PDSCH_MCS7) TB_BUND3_NACK_PDSCH_MCS7,
        SUM(TB_BUND3_NACK_PDSCH_MCS8) TB_BUND3_NACK_PDSCH_MCS8,
        SUM(TB_BUND3_NACK_PDSCH_MCS9) TB_BUND3_NACK_PDSCH_MCS9,
        SUM(TB_BUND3_NACK_PDSCH_MCS10) TB_BUND3_NACK_PDSCH_MCS10,
        SUM(TB_BUND3_NACK_PDSCH_MCS11) TB_BUND3_NACK_PDSCH_MCS11,
        SUM(TB_BUND3_NACK_PDSCH_MCS12) TB_BUND3_NACK_PDSCH_MCS12,
        SUM(TB_BUND3_NACK_PDSCH_MCS13) TB_BUND3_NACK_PDSCH_MCS13,
        SUM(TB_BUND3_NACK_PDSCH_MCS14) TB_BUND3_NACK_PDSCH_MCS14,
        SUM(TB_BUND3_NACK_PDSCH_MCS15) TB_BUND3_NACK_PDSCH_MCS15,
        SUM(TB_BUND3_NACK_PDSCH_MCS16) TB_BUND3_NACK_PDSCH_MCS16,
        SUM(TB_BUND3_NACK_PDSCH_MCS17) TB_BUND3_NACK_PDSCH_MCS17,
        SUM(TB_BUND3_NACK_PDSCH_MCS18) TB_BUND3_NACK_PDSCH_MCS18,
        SUM(TB_BUND3_NACK_PDSCH_MCS19) TB_BUND3_NACK_PDSCH_MCS19,
        SUM(TB_BUND3_NACK_PDSCH_MCS20) TB_BUND3_NACK_PDSCH_MCS20,
        SUM(TB_BUND3_NACK_PDSCH_MCS21) TB_BUND3_NACK_PDSCH_MCS21,
        SUM(TB_BUND3_NACK_PDSCH_MCS22) TB_BUND3_NACK_PDSCH_MCS22,
        SUM(TB_BUND3_NACK_PDSCH_MCS23) TB_BUND3_NACK_PDSCH_MCS23,
        SUM(TB_BUND3_NACK_PDSCH_MCS24) TB_BUND3_NACK_PDSCH_MCS24,
        SUM(TB_BUND3_NACK_PDSCH_MCS25) TB_BUND3_NACK_PDSCH_MCS25,
        SUM(TB_BUND3_NACK_PDSCH_MCS26) TB_BUND3_NACK_PDSCH_MCS26,
        SUM(TB_BUND3_NACK_PDSCH_MCS27) TB_BUND3_NACK_PDSCH_MCS27,
        SUM(TB_BUND3_NACK_PDSCH_MCS28) TB_BUND3_NACK_PDSCH_MCS28,
        SUM(TB_BUND4_NACK_PDSCH_MCS0) TB_BUND4_NACK_PDSCH_MCS0,
        SUM(TB_BUND4_NACK_PDSCH_MCS1) TB_BUND4_NACK_PDSCH_MCS1,
        SUM(TB_BUND4_NACK_PDSCH_MCS2) TB_BUND4_NACK_PDSCH_MCS2,
        SUM(TB_BUND4_NACK_PDSCH_MCS3) TB_BUND4_NACK_PDSCH_MCS3,
        SUM(TB_BUND4_NACK_PDSCH_MCS4) TB_BUND4_NACK_PDSCH_MCS4,
        SUM(TB_BUND4_NACK_PDSCH_MCS5) TB_BUND4_NACK_PDSCH_MCS5,
        SUM(TB_BUND4_NACK_PDSCH_MCS6) TB_BUND4_NACK_PDSCH_MCS6,
        SUM(TB_BUND4_NACK_PDSCH_MCS7) TB_BUND4_NACK_PDSCH_MCS7,
        SUM(TB_BUND4_NACK_PDSCH_MCS8) TB_BUND4_NACK_PDSCH_MCS8,
        SUM(TB_BUND4_NACK_PDSCH_MCS9) TB_BUND4_NACK_PDSCH_MCS9,
        SUM(TB_BUND4_NACK_PDSCH_MCS10) TB_BUND4_NACK_PDSCH_MCS10,
        SUM(TB_BUND4_NACK_PDSCH_MCS11) TB_BUND4_NACK_PDSCH_MCS11,
        SUM(TB_BUND4_NACK_PDSCH_MCS12) TB_BUND4_NACK_PDSCH_MCS12,
        SUM(TB_BUND4_NACK_PDSCH_MCS13) TB_BUND4_NACK_PDSCH_MCS13,
        SUM(TB_BUND4_NACK_PDSCH_MCS14) TB_BUND4_NACK_PDSCH_MCS14,
        SUM(TB_BUND4_NACK_PDSCH_MCS15) TB_BUND4_NACK_PDSCH_MCS15,
        SUM(TB_BUND4_NACK_PDSCH_MCS16) TB_BUND4_NACK_PDSCH_MCS16,
        SUM(TB_BUND4_NACK_PDSCH_MCS17) TB_BUND4_NACK_PDSCH_MCS17,
        SUM(TB_BUND4_NACK_PDSCH_MCS18) TB_BUND4_NACK_PDSCH_MCS18,
        SUM(TB_BUND4_NACK_PDSCH_MCS19) TB_BUND4_NACK_PDSCH_MCS19,
        SUM(TB_BUND4_NACK_PDSCH_MCS20) TB_BUND4_NACK_PDSCH_MCS20,
        SUM(TB_BUND4_NACK_PDSCH_MCS21) TB_BUND4_NACK_PDSCH_MCS21,
        SUM(TB_BUND4_NACK_PDSCH_MCS22) TB_BUND4_NACK_PDSCH_MCS22,
        SUM(TB_BUND4_NACK_PDSCH_MCS23) TB_BUND4_NACK_PDSCH_MCS23,
        SUM(TB_BUND4_NACK_PDSCH_MCS24) TB_BUND4_NACK_PDSCH_MCS24,
        SUM(TB_BUND4_NACK_PDSCH_MCS25) TB_BUND4_NACK_PDSCH_MCS25,
        SUM(TB_BUND4_NACK_PDSCH_MCS26) TB_BUND4_NACK_PDSCH_MCS26,
        SUM(TB_BUND4_NACK_PDSCH_MCS27) TB_BUND4_NACK_PDSCH_MCS27,
        SUM(TB_BUND4_NACK_PDSCH_MCS28) TB_BUND4_NACK_PDSCH_MCS28,
        AVG(UE_DRB_UL_DATA_QCI_1) UE_DRB_UL_DATA_QCI_1,
        AVG(CA_DL_CAP_UE_AVG) CA_DL_CAP_UE_AVG,
        AVG(CA_SCELL_ACTIVE_UE_AVG) CA_SCELL_ACTIVE_UE_AVG,
        AVG(CA_DL_CAP_UE_3CC_AVG) CA_DL_CAP_UE_3CC_AVG,
        AVG(CA_2SCELLS_ACTIVE_UE_AVG) CA_2SCELLS_ACTIVE_UE_AVG,
        AVG(PDCP_SDU_DELAY_DL_DTCH_MEAN) PDCP_SDU_DELAY_DL_DTCH_MEAN,
        AVG(PDCP_SDU_DELAY_UL_DTCH_MEAN) PDCP_SDU_DELAY_UL_DTCH_MEAN,
        SUM(RACH_STP_ATT_SMALL_MSG) RACH_STP_ATT_SMALL_MSG,
        SUM(RACH_STP_ATT_LARGE_MSG) RACH_STP_ATT_LARGE_MSG,
        SUM(RACH_STP_COMPLETIONS) RACH_STP_COMPLETIONS,
        SUM(PUSCH_TRANS_USING_MCS0) PUSCH_TRANS_USING_MCS0,
        SUM(PUSCH_TRANS_USING_MCS1) PUSCH_TRANS_USING_MCS1,
        SUM(PUSCH_TRANS_USING_MCS2) PUSCH_TRANS_USING_MCS2,
        SUM(PUSCH_TRANS_USING_MCS3) PUSCH_TRANS_USING_MCS3,
        SUM(PUSCH_TRANS_USING_MCS4) PUSCH_TRANS_USING_MCS4,
        SUM(PUSCH_TRANS_USING_MCS5) PUSCH_TRANS_USING_MCS5,
        SUM(PUSCH_TRANS_USING_MCS6) PUSCH_TRANS_USING_MCS6,
        SUM(PUSCH_TRANS_USING_MCS7) PUSCH_TRANS_USING_MCS7,
        SUM(PUSCH_TRANS_USING_MCS8) PUSCH_TRANS_USING_MCS8,
        SUM(PUSCH_TRANS_USING_MCS9) PUSCH_TRANS_USING_MCS9,
        SUM(PUSCH_TRANS_USING_MCS10) PUSCH_TRANS_USING_MCS10,
        SUM(PUSCH_TRANS_USING_MCS11) PUSCH_TRANS_USING_MCS11,
        SUM(PUSCH_TRANS_USING_MCS12) PUSCH_TRANS_USING_MCS12,
        SUM(PUSCH_TRANS_USING_MCS13) PUSCH_TRANS_USING_MCS13,
        SUM(PUSCH_TRANS_USING_MCS14) PUSCH_TRANS_USING_MCS14,
        SUM(PUSCH_TRANS_USING_MCS15) PUSCH_TRANS_USING_MCS15,
        SUM(PUSCH_TRANS_USING_MCS16) PUSCH_TRANS_USING_MCS16,
        SUM(PUSCH_TRANS_USING_MCS17) PUSCH_TRANS_USING_MCS17,
        SUM(PUSCH_TRANS_USING_MCS18) PUSCH_TRANS_USING_MCS18,
        SUM(PUSCH_TRANS_USING_MCS19) PUSCH_TRANS_USING_MCS19,
        SUM(PUSCH_TRANS_USING_MCS20) PUSCH_TRANS_USING_MCS20,
        SUM(PUSCH_TRANS_USING_MCS21) PUSCH_TRANS_USING_MCS21,
        SUM(PUSCH_TRANS_USING_MCS22) PUSCH_TRANS_USING_MCS22,
        SUM(PUSCH_TRANS_USING_MCS23) PUSCH_TRANS_USING_MCS23,
        SUM(PUSCH_TRANS_USING_MCS24) PUSCH_TRANS_USING_MCS24,
        SUM(PUSCH_TRANS_USING_MCS25) PUSCH_TRANS_USING_MCS25,
        SUM(PUSCH_TRANS_USING_MCS26) PUSCH_TRANS_USING_MCS26,
        SUM(PUSCH_TRANS_USING_MCS27) PUSCH_TRANS_USING_MCS27,
        SUM(PUSCH_TRANS_USING_MCS28) PUSCH_TRANS_USING_MCS28,
        SUM(PDSCH_TRANS_USING_MCS0) PDSCH_TRANS_USING_MCS0,
        SUM(PDSCH_TRANS_USING_MCS1) PDSCH_TRANS_USING_MCS1,
        SUM(PDSCH_TRANS_USING_MCS2) PDSCH_TRANS_USING_MCS2,
        SUM(PDSCH_TRANS_USING_MCS3) PDSCH_TRANS_USING_MCS3,
        SUM(PDSCH_TRANS_USING_MCS4) PDSCH_TRANS_USING_MCS4,
        SUM(PDSCH_TRANS_USING_MCS5) PDSCH_TRANS_USING_MCS5,
        SUM(PDSCH_TRANS_USING_MCS6) PDSCH_TRANS_USING_MCS6,
        SUM(PDSCH_TRANS_USING_MCS7) PDSCH_TRANS_USING_MCS7,
        SUM(PDSCH_TRANS_USING_MCS8) PDSCH_TRANS_USING_MCS8,
        SUM(PDSCH_TRANS_USING_MCS9) PDSCH_TRANS_USING_MCS9,
        SUM(PDSCH_TRANS_USING_MCS10) PDSCH_TRANS_USING_MCS10,
        SUM(PDSCH_TRANS_USING_MCS11) PDSCH_TRANS_USING_MCS11,
        SUM(PDSCH_TRANS_USING_MCS12) PDSCH_TRANS_USING_MCS12,
        SUM(PDSCH_TRANS_USING_MCS13) PDSCH_TRANS_USING_MCS13,
        SUM(PDSCH_TRANS_USING_MCS14) PDSCH_TRANS_USING_MCS14,
        SUM(PDSCH_TRANS_USING_MCS15) PDSCH_TRANS_USING_MCS15,
        SUM(PDSCH_TRANS_USING_MCS16) PDSCH_TRANS_USING_MCS16,
        SUM(PDSCH_TRANS_USING_MCS17) PDSCH_TRANS_USING_MCS17,
        SUM(PDSCH_TRANS_USING_MCS18) PDSCH_TRANS_USING_MCS18,
        SUM(PDSCH_TRANS_USING_MCS19) PDSCH_TRANS_USING_MCS19,
        SUM(PDSCH_TRANS_USING_MCS20) PDSCH_TRANS_USING_MCS20,
        SUM(PDSCH_TRANS_USING_MCS21) PDSCH_TRANS_USING_MCS21,
        SUM(PDSCH_TRANS_USING_MCS22) PDSCH_TRANS_USING_MCS22,
        SUM(PDSCH_TRANS_USING_MCS23) PDSCH_TRANS_USING_MCS23,
        SUM(PDSCH_TRANS_USING_MCS24) PDSCH_TRANS_USING_MCS24,
        SUM(PDSCH_TRANS_USING_MCS25) PDSCH_TRANS_USING_MCS25,
        SUM(PDSCH_TRANS_USING_MCS26) PDSCH_TRANS_USING_MCS26,
        SUM(PDSCH_TRANS_USING_MCS27) PDSCH_TRANS_USING_MCS27,
        SUM(PDSCH_TRANS_USING_MCS28) PDSCH_TRANS_USING_MCS28,
        SUM(PUSCH_TRANS_NACK_MCS0) PUSCH_TRANS_NACK_MCS0,
        SUM(PUSCH_TRANS_NACK_MCS1) PUSCH_TRANS_NACK_MCS1,
        SUM(PUSCH_TRANS_NACK_MCS2) PUSCH_TRANS_NACK_MCS2,
        SUM(PUSCH_TRANS_NACK_MCS3) PUSCH_TRANS_NACK_MCS3,
        SUM(PUSCH_TRANS_NACK_MCS4) PUSCH_TRANS_NACK_MCS4,
        SUM(PUSCH_TRANS_NACK_MCS5) PUSCH_TRANS_NACK_MCS5,
        SUM(PUSCH_TRANS_NACK_MCS6) PUSCH_TRANS_NACK_MCS6,
        SUM(PUSCH_TRANS_NACK_MCS7) PUSCH_TRANS_NACK_MCS7,
        SUM(PUSCH_TRANS_NACK_MCS8) PUSCH_TRANS_NACK_MCS8,
        SUM(PUSCH_TRANS_NACK_MCS9) PUSCH_TRANS_NACK_MCS9,
        SUM(PUSCH_TRANS_NACK_MCS10) PUSCH_TRANS_NACK_MCS10,
        SUM(PUSCH_TRANS_NACK_MCS11) PUSCH_TRANS_NACK_MCS11,
        SUM(PUSCH_TRANS_NACK_MCS12) PUSCH_TRANS_NACK_MCS12,
        SUM(PUSCH_TRANS_NACK_MCS13) PUSCH_TRANS_NACK_MCS13,
        SUM(PUSCH_TRANS_NACK_MCS14) PUSCH_TRANS_NACK_MCS14,
        SUM(PUSCH_TRANS_NACK_MCS15) PUSCH_TRANS_NACK_MCS15,
        SUM(PUSCH_TRANS_NACK_MCS16) PUSCH_TRANS_NACK_MCS16,
        SUM(PUSCH_TRANS_NACK_MCS17) PUSCH_TRANS_NACK_MCS17,
        SUM(PUSCH_TRANS_NACK_MCS18) PUSCH_TRANS_NACK_MCS18,
        SUM(PUSCH_TRANS_NACK_MCS19) PUSCH_TRANS_NACK_MCS19,
        SUM(PUSCH_TRANS_NACK_MCS20) PUSCH_TRANS_NACK_MCS20,
        SUM(PUSCH_TRANS_NACK_MCS21) PUSCH_TRANS_NACK_MCS21,
        SUM(PUSCH_TRANS_NACK_MCS22) PUSCH_TRANS_NACK_MCS22,
        SUM(PUSCH_TRANS_NACK_MCS23) PUSCH_TRANS_NACK_MCS23,
        SUM(PUSCH_TRANS_NACK_MCS24) PUSCH_TRANS_NACK_MCS24,
        SUM(PUSCH_TRANS_NACK_MCS25) PUSCH_TRANS_NACK_MCS25,
        SUM(PUSCH_TRANS_NACK_MCS26) PUSCH_TRANS_NACK_MCS26,
        SUM(PUSCH_TRANS_NACK_MCS27) PUSCH_TRANS_NACK_MCS27,
        SUM(PUSCH_TRANS_NACK_MCS28) PUSCH_TRANS_NACK_MCS28,
        SUM(PDSCH_TRANS_NACK_MCS0) PDSCH_TRANS_NACK_MCS0,
        SUM(PDSCH_TRANS_NACK_MCS1) PDSCH_TRANS_NACK_MCS1,
        SUM(PDSCH_TRANS_NACK_MCS2) PDSCH_TRANS_NACK_MCS2,
        SUM(PDSCH_TRANS_NACK_MCS3) PDSCH_TRANS_NACK_MCS3,
        SUM(PDSCH_TRANS_NACK_MCS4) PDSCH_TRANS_NACK_MCS4,
        SUM(PDSCH_TRANS_NACK_MCS5) PDSCH_TRANS_NACK_MCS5,
        SUM(PDSCH_TRANS_NACK_MCS6) PDSCH_TRANS_NACK_MCS6,
        SUM(PDSCH_TRANS_NACK_MCS7) PDSCH_TRANS_NACK_MCS7,
        SUM(PDSCH_TRANS_NACK_MCS8) PDSCH_TRANS_NACK_MCS8,
        SUM(PDSCH_TRANS_NACK_MCS9) PDSCH_TRANS_NACK_MCS9,
        SUM(PDSCH_TRANS_NACK_MCS10) PDSCH_TRANS_NACK_MCS10,
        SUM(PDSCH_TRANS_NACK_MCS11) PDSCH_TRANS_NACK_MCS11,
        SUM(PDSCH_TRANS_NACK_MCS12) PDSCH_TRANS_NACK_MCS12,
        SUM(PDSCH_TRANS_NACK_MCS13) PDSCH_TRANS_NACK_MCS13,
        SUM(PDSCH_TRANS_NACK_MCS14) PDSCH_TRANS_NACK_MCS14,
        SUM(PDSCH_TRANS_NACK_MCS15) PDSCH_TRANS_NACK_MCS15,
        SUM(PDSCH_TRANS_NACK_MCS16) PDSCH_TRANS_NACK_MCS16,
        SUM(PDSCH_TRANS_NACK_MCS17) PDSCH_TRANS_NACK_MCS17,
        SUM(PDSCH_TRANS_NACK_MCS18) PDSCH_TRANS_NACK_MCS18,
        SUM(PDSCH_TRANS_NACK_MCS19) PDSCH_TRANS_NACK_MCS19,
        SUM(PDSCH_TRANS_NACK_MCS20) PDSCH_TRANS_NACK_MCS20,
        SUM(PDSCH_TRANS_NACK_MCS21) PDSCH_TRANS_NACK_MCS21,
        SUM(PDSCH_TRANS_NACK_MCS22) PDSCH_TRANS_NACK_MCS22,
        SUM(PDSCH_TRANS_NACK_MCS23) PDSCH_TRANS_NACK_MCS23,
        SUM(PDSCH_TRANS_NACK_MCS24) PDSCH_TRANS_NACK_MCS24,
        SUM(PDSCH_TRANS_NACK_MCS25) PDSCH_TRANS_NACK_MCS25,
        SUM(PDSCH_TRANS_NACK_MCS26) PDSCH_TRANS_NACK_MCS26,
        SUM(PDSCH_TRANS_NACK_MCS27) PDSCH_TRANS_NACK_MCS27,
        SUM(PDSCH_TRANS_NACK_MCS28) PDSCH_TRANS_NACK_MCS28,
        SUM(RLC_PDU_FIRST_TRANS) RLC_PDU_FIRST_TRANS,
        SUM(RLC_PDU_RE_TRANS) RLC_PDU_RE_TRANS,
        SUM(UL_RLC_PDU_REC_TOT) UL_RLC_PDU_REC_TOT,
        SUM(UL_RLC_PDU_RETR_REQ) UL_RLC_PDU_RETR_REQ
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          AVG(UE_DRB_DL_DATA_QCI_1) UE_DRB_DL_DATA_QCI_1,
          SUM(PDSCH_TRANS_USING_MCS29) PDSCH_TRANS_USING_MCS29,
          SUM(PDSCH_TRANS_USING_MCS30) PDSCH_TRANS_USING_MCS30,
          SUM(PDSCH_TRANS_USING_MCS31) PDSCH_TRANS_USING_MCS31,
          SUM(PDSCH_TRANS_NACK_MCS29) PDSCH_TRANS_NACK_MCS29,
          SUM(PDSCH_TRANS_NACK_MCS30) PDSCH_TRANS_NACK_MCS30,
          SUM(PDSCH_TRANS_NACK_MCS31) PDSCH_TRANS_NACK_MCS31,
          SUM(TB_BUND2_NACK_PDSCH_MCS29) TB_BUND2_NACK_PDSCH_MCS29,
          SUM(TB_BUND3_NACK_PDSCH_MCS29) TB_BUND3_NACK_PDSCH_MCS29,
          SUM(TB_BUND4_NACK_PDSCH_MCS29) TB_BUND4_NACK_PDSCH_MCS29,
          SUM(TB_BUND2_NACK_PDSCH_MCS30) TB_BUND2_NACK_PDSCH_MCS30,
          SUM(TB_BUND3_NACK_PDSCH_MCS30) TB_BUND3_NACK_PDSCH_MCS30,
          SUM(TB_BUND4_NACK_PDSCH_MCS30) TB_BUND4_NACK_PDSCH_MCS30,
          SUM(TB_BUND2_NACK_PDSCH_MCS31) TB_BUND2_NACK_PDSCH_MCS31,
          SUM(TB_BUND3_NACK_PDSCH_MCS31) TB_BUND3_NACK_PDSCH_MCS31,
          SUM(TB_BUND4_NACK_PDSCH_MCS31) TB_BUND4_NACK_PDSCH_MCS31,
          SUM(SUM_ACTIVE_UE_DATA_DL) SUM_ACTIVE_UE_DATA_DL,
          SUM(DENOM_ACTIVE_UE_DATA_DL) DENOM_ACTIVE_UE_DATA_DL,
          SUM(SUM_ACTIVE_UE_DATA_UL) SUM_ACTIVE_UE_DATA_UL,
          SUM(DENOM_ACTIVE_UE_DATA_UL) DENOM_ACTIVE_UE_DATA_UL,
          AVG(PDCP_RET_DL_DEL_MEAN_QCI_1) PDCP_RET_DL_DEL_MEAN_QCI_1,
          AVG(PDCP_RET_DL_DEL_MEAN_QCI_2) PDCP_RET_DL_DEL_MEAN_QCI_2,
          AVG(PDCP_RET_DL_DEL_MEAN_QCI_3) PDCP_RET_DL_DEL_MEAN_QCI_3,
          AVG(PDCP_RET_DL_DEL_MEAN_QCI_4) PDCP_RET_DL_DEL_MEAN_QCI_4,
          SUM(RACH_STP_ATT_DEDICATED) RACH_STP_ATT_DEDICATED,
          AVG(PDCP_RET_DL_DEL_MEAN_QCI_5) PDCP_RET_DL_DEL_MEAN_QCI_5,
          AVG(PDCP_RET_DL_DEL_MEAN_QCI_6) PDCP_RET_DL_DEL_MEAN_QCI_6,
          AVG(PDCP_RET_DL_DEL_MEAN_QCI_7) PDCP_RET_DL_DEL_MEAN_QCI_7,
          AVG(PDCP_RET_DL_DEL_MEAN_QCI_8) PDCP_RET_DL_DEL_MEAN_QCI_8,
          AVG(PDCP_RET_DL_DEL_MEAN_QCI_9) PDCP_RET_DL_DEL_MEAN_QCI_9,
          SUM(SUM_RRC_CONN_UE) SUM_RRC_CONN_UE,
          SUM(DENOM_RRC_CONN_UE) DENOM_RRC_CONN_UE,
          SUM(TB_BUND2_NACK_PDSCH_MCS0) TB_BUND2_NACK_PDSCH_MCS0,
          SUM(TB_BUND2_NACK_PDSCH_MCS1) TB_BUND2_NACK_PDSCH_MCS1,
          SUM(TB_BUND2_NACK_PDSCH_MCS2) TB_BUND2_NACK_PDSCH_MCS2,
          SUM(TB_BUND2_NACK_PDSCH_MCS3) TB_BUND2_NACK_PDSCH_MCS3,
          SUM(TB_BUND2_NACK_PDSCH_MCS4) TB_BUND2_NACK_PDSCH_MCS4,
          SUM(TB_BUND2_NACK_PDSCH_MCS5) TB_BUND2_NACK_PDSCH_MCS5,
          SUM(TB_BUND2_NACK_PDSCH_MCS6) TB_BUND2_NACK_PDSCH_MCS6,
          SUM(TB_BUND2_NACK_PDSCH_MCS7) TB_BUND2_NACK_PDSCH_MCS7,
          SUM(TB_BUND2_NACK_PDSCH_MCS8) TB_BUND2_NACK_PDSCH_MCS8,
          SUM(TB_BUND2_NACK_PDSCH_MCS9) TB_BUND2_NACK_PDSCH_MCS9,
          SUM(TB_BUND2_NACK_PDSCH_MCS10) TB_BUND2_NACK_PDSCH_MCS10,
          SUM(TB_BUND2_NACK_PDSCH_MCS11) TB_BUND2_NACK_PDSCH_MCS11,
          SUM(TB_BUND2_NACK_PDSCH_MCS12) TB_BUND2_NACK_PDSCH_MCS12,
          SUM(TB_BUND2_NACK_PDSCH_MCS13) TB_BUND2_NACK_PDSCH_MCS13,
          SUM(TB_BUND2_NACK_PDSCH_MCS14) TB_BUND2_NACK_PDSCH_MCS14,
          SUM(TB_BUND2_NACK_PDSCH_MCS15) TB_BUND2_NACK_PDSCH_MCS15,
          SUM(TB_BUND2_NACK_PDSCH_MCS16) TB_BUND2_NACK_PDSCH_MCS16,
          SUM(TB_BUND2_NACK_PDSCH_MCS17) TB_BUND2_NACK_PDSCH_MCS17,
          SUM(TB_BUND2_NACK_PDSCH_MCS18) TB_BUND2_NACK_PDSCH_MCS18,
          SUM(TB_BUND2_NACK_PDSCH_MCS19) TB_BUND2_NACK_PDSCH_MCS19,
          SUM(TB_BUND2_NACK_PDSCH_MCS20) TB_BUND2_NACK_PDSCH_MCS20,
          SUM(TB_BUND2_NACK_PDSCH_MCS21) TB_BUND2_NACK_PDSCH_MCS21,
          SUM(TB_BUND2_NACK_PDSCH_MCS22) TB_BUND2_NACK_PDSCH_MCS22,
          SUM(TB_BUND2_NACK_PDSCH_MCS23) TB_BUND2_NACK_PDSCH_MCS23,
          SUM(TB_BUND2_NACK_PDSCH_MCS24) TB_BUND2_NACK_PDSCH_MCS24,
          SUM(TB_BUND2_NACK_PDSCH_MCS25) TB_BUND2_NACK_PDSCH_MCS25,
          SUM(TB_BUND2_NACK_PDSCH_MCS26) TB_BUND2_NACK_PDSCH_MCS26,
          SUM(TB_BUND2_NACK_PDSCH_MCS27) TB_BUND2_NACK_PDSCH_MCS27,
          SUM(TB_BUND2_NACK_PDSCH_MCS28) TB_BUND2_NACK_PDSCH_MCS28,
          SUM(TB_BUND3_NACK_PDSCH_MCS0) TB_BUND3_NACK_PDSCH_MCS0,
          SUM(TB_BUND3_NACK_PDSCH_MCS1) TB_BUND3_NACK_PDSCH_MCS1,
          SUM(TB_BUND3_NACK_PDSCH_MCS2) TB_BUND3_NACK_PDSCH_MCS2,
          SUM(TB_BUND3_NACK_PDSCH_MCS3) TB_BUND3_NACK_PDSCH_MCS3,
          SUM(TB_BUND3_NACK_PDSCH_MCS4) TB_BUND3_NACK_PDSCH_MCS4,
          SUM(TB_BUND3_NACK_PDSCH_MCS5) TB_BUND3_NACK_PDSCH_MCS5,
          SUM(TB_BUND3_NACK_PDSCH_MCS6) TB_BUND3_NACK_PDSCH_MCS6,
          SUM(TB_BUND3_NACK_PDSCH_MCS7) TB_BUND3_NACK_PDSCH_MCS7,
          SUM(TB_BUND3_NACK_PDSCH_MCS8) TB_BUND3_NACK_PDSCH_MCS8,
          SUM(TB_BUND3_NACK_PDSCH_MCS9) TB_BUND3_NACK_PDSCH_MCS9,
          SUM(TB_BUND3_NACK_PDSCH_MCS10) TB_BUND3_NACK_PDSCH_MCS10,
          SUM(TB_BUND3_NACK_PDSCH_MCS11) TB_BUND3_NACK_PDSCH_MCS11,
          SUM(TB_BUND3_NACK_PDSCH_MCS12) TB_BUND3_NACK_PDSCH_MCS12,
          SUM(TB_BUND3_NACK_PDSCH_MCS13) TB_BUND3_NACK_PDSCH_MCS13,
          SUM(TB_BUND3_NACK_PDSCH_MCS14) TB_BUND3_NACK_PDSCH_MCS14,
          SUM(TB_BUND3_NACK_PDSCH_MCS15) TB_BUND3_NACK_PDSCH_MCS15,
          SUM(TB_BUND3_NACK_PDSCH_MCS16) TB_BUND3_NACK_PDSCH_MCS16,
          SUM(TB_BUND3_NACK_PDSCH_MCS17) TB_BUND3_NACK_PDSCH_MCS17,
          SUM(TB_BUND3_NACK_PDSCH_MCS18) TB_BUND3_NACK_PDSCH_MCS18,
          SUM(TB_BUND3_NACK_PDSCH_MCS19) TB_BUND3_NACK_PDSCH_MCS19,
          SUM(TB_BUND3_NACK_PDSCH_MCS20) TB_BUND3_NACK_PDSCH_MCS20,
          SUM(TB_BUND3_NACK_PDSCH_MCS21) TB_BUND3_NACK_PDSCH_MCS21,
          SUM(TB_BUND3_NACK_PDSCH_MCS22) TB_BUND3_NACK_PDSCH_MCS22,
          SUM(TB_BUND3_NACK_PDSCH_MCS23) TB_BUND3_NACK_PDSCH_MCS23,
          SUM(TB_BUND3_NACK_PDSCH_MCS24) TB_BUND3_NACK_PDSCH_MCS24,
          SUM(TB_BUND3_NACK_PDSCH_MCS25) TB_BUND3_NACK_PDSCH_MCS25,
          SUM(TB_BUND3_NACK_PDSCH_MCS26) TB_BUND3_NACK_PDSCH_MCS26,
          SUM(TB_BUND3_NACK_PDSCH_MCS27) TB_BUND3_NACK_PDSCH_MCS27,
          SUM(TB_BUND3_NACK_PDSCH_MCS28) TB_BUND3_NACK_PDSCH_MCS28,
          SUM(TB_BUND4_NACK_PDSCH_MCS0) TB_BUND4_NACK_PDSCH_MCS0,
          SUM(TB_BUND4_NACK_PDSCH_MCS1) TB_BUND4_NACK_PDSCH_MCS1,
          SUM(TB_BUND4_NACK_PDSCH_MCS2) TB_BUND4_NACK_PDSCH_MCS2,
          SUM(TB_BUND4_NACK_PDSCH_MCS3) TB_BUND4_NACK_PDSCH_MCS3,
          SUM(TB_BUND4_NACK_PDSCH_MCS4) TB_BUND4_NACK_PDSCH_MCS4,
          SUM(TB_BUND4_NACK_PDSCH_MCS5) TB_BUND4_NACK_PDSCH_MCS5,
          SUM(TB_BUND4_NACK_PDSCH_MCS6) TB_BUND4_NACK_PDSCH_MCS6,
          SUM(TB_BUND4_NACK_PDSCH_MCS7) TB_BUND4_NACK_PDSCH_MCS7,
          SUM(TB_BUND4_NACK_PDSCH_MCS8) TB_BUND4_NACK_PDSCH_MCS8,
          SUM(TB_BUND4_NACK_PDSCH_MCS9) TB_BUND4_NACK_PDSCH_MCS9,
          SUM(TB_BUND4_NACK_PDSCH_MCS10) TB_BUND4_NACK_PDSCH_MCS10,
          SUM(TB_BUND4_NACK_PDSCH_MCS11) TB_BUND4_NACK_PDSCH_MCS11,
          SUM(TB_BUND4_NACK_PDSCH_MCS12) TB_BUND4_NACK_PDSCH_MCS12,
          SUM(TB_BUND4_NACK_PDSCH_MCS13) TB_BUND4_NACK_PDSCH_MCS13,
          SUM(TB_BUND4_NACK_PDSCH_MCS14) TB_BUND4_NACK_PDSCH_MCS14,
          SUM(TB_BUND4_NACK_PDSCH_MCS15) TB_BUND4_NACK_PDSCH_MCS15,
          SUM(TB_BUND4_NACK_PDSCH_MCS16) TB_BUND4_NACK_PDSCH_MCS16,
          SUM(TB_BUND4_NACK_PDSCH_MCS17) TB_BUND4_NACK_PDSCH_MCS17,
          SUM(TB_BUND4_NACK_PDSCH_MCS18) TB_BUND4_NACK_PDSCH_MCS18,
          SUM(TB_BUND4_NACK_PDSCH_MCS19) TB_BUND4_NACK_PDSCH_MCS19,
          SUM(TB_BUND4_NACK_PDSCH_MCS20) TB_BUND4_NACK_PDSCH_MCS20,
          SUM(TB_BUND4_NACK_PDSCH_MCS21) TB_BUND4_NACK_PDSCH_MCS21,
          SUM(TB_BUND4_NACK_PDSCH_MCS22) TB_BUND4_NACK_PDSCH_MCS22,
          SUM(TB_BUND4_NACK_PDSCH_MCS23) TB_BUND4_NACK_PDSCH_MCS23,
          SUM(TB_BUND4_NACK_PDSCH_MCS24) TB_BUND4_NACK_PDSCH_MCS24,
          SUM(TB_BUND4_NACK_PDSCH_MCS25) TB_BUND4_NACK_PDSCH_MCS25,
          SUM(TB_BUND4_NACK_PDSCH_MCS26) TB_BUND4_NACK_PDSCH_MCS26,
          SUM(TB_BUND4_NACK_PDSCH_MCS27) TB_BUND4_NACK_PDSCH_MCS27,
          SUM(TB_BUND4_NACK_PDSCH_MCS28) TB_BUND4_NACK_PDSCH_MCS28,
          AVG(UE_DRB_UL_DATA_QCI_1) UE_DRB_UL_DATA_QCI_1,
          AVG(CA_DL_CAP_UE_AVG) CA_DL_CAP_UE_AVG,
          AVG(CA_SCELL_ACTIVE_UE_AVG) CA_SCELL_ACTIVE_UE_AVG,
          AVG(CA_DL_CAP_UE_3CC_AVG) CA_DL_CAP_UE_3CC_AVG,
          AVG(CA_2SCELLS_ACTIVE_UE_AVG) CA_2SCELLS_ACTIVE_UE_AVG,
          AVG(PDCP_SDU_DELAY_DL_DTCH_MEAN) PDCP_SDU_DELAY_DL_DTCH_MEAN,
          AVG(PDCP_SDU_DELAY_UL_DTCH_MEAN) PDCP_SDU_DELAY_UL_DTCH_MEAN,
          SUM(RACH_STP_ATT_SMALL_MSG) RACH_STP_ATT_SMALL_MSG,
          SUM(RACH_STP_ATT_LARGE_MSG) RACH_STP_ATT_LARGE_MSG,
          SUM(RACH_STP_COMPLETIONS) RACH_STP_COMPLETIONS,
          SUM(PUSCH_TRANS_USING_MCS0) PUSCH_TRANS_USING_MCS0,
          SUM(PUSCH_TRANS_USING_MCS1) PUSCH_TRANS_USING_MCS1,
          SUM(PUSCH_TRANS_USING_MCS2) PUSCH_TRANS_USING_MCS2,
          SUM(PUSCH_TRANS_USING_MCS3) PUSCH_TRANS_USING_MCS3,
          SUM(PUSCH_TRANS_USING_MCS4) PUSCH_TRANS_USING_MCS4,
          SUM(PUSCH_TRANS_USING_MCS5) PUSCH_TRANS_USING_MCS5,
          SUM(PUSCH_TRANS_USING_MCS6) PUSCH_TRANS_USING_MCS6,
          SUM(PUSCH_TRANS_USING_MCS7) PUSCH_TRANS_USING_MCS7,
          SUM(PUSCH_TRANS_USING_MCS8) PUSCH_TRANS_USING_MCS8,
          SUM(PUSCH_TRANS_USING_MCS9) PUSCH_TRANS_USING_MCS9,
          SUM(PUSCH_TRANS_USING_MCS10) PUSCH_TRANS_USING_MCS10,
          SUM(PUSCH_TRANS_USING_MCS11) PUSCH_TRANS_USING_MCS11,
          SUM(PUSCH_TRANS_USING_MCS12) PUSCH_TRANS_USING_MCS12,
          SUM(PUSCH_TRANS_USING_MCS13) PUSCH_TRANS_USING_MCS13,
          SUM(PUSCH_TRANS_USING_MCS14) PUSCH_TRANS_USING_MCS14,
          SUM(PUSCH_TRANS_USING_MCS15) PUSCH_TRANS_USING_MCS15,
          SUM(PUSCH_TRANS_USING_MCS16) PUSCH_TRANS_USING_MCS16,
          SUM(PUSCH_TRANS_USING_MCS17) PUSCH_TRANS_USING_MCS17,
          SUM(PUSCH_TRANS_USING_MCS18) PUSCH_TRANS_USING_MCS18,
          SUM(PUSCH_TRANS_USING_MCS19) PUSCH_TRANS_USING_MCS19,
          SUM(PUSCH_TRANS_USING_MCS20) PUSCH_TRANS_USING_MCS20,
          SUM(PUSCH_TRANS_USING_MCS21) PUSCH_TRANS_USING_MCS21,
          SUM(PUSCH_TRANS_USING_MCS22) PUSCH_TRANS_USING_MCS22,
          SUM(PUSCH_TRANS_USING_MCS23) PUSCH_TRANS_USING_MCS23,
          SUM(PUSCH_TRANS_USING_MCS24) PUSCH_TRANS_USING_MCS24,
          SUM(PUSCH_TRANS_USING_MCS25) PUSCH_TRANS_USING_MCS25,
          SUM(PUSCH_TRANS_USING_MCS26) PUSCH_TRANS_USING_MCS26,
          SUM(PUSCH_TRANS_USING_MCS27) PUSCH_TRANS_USING_MCS27,
          SUM(PUSCH_TRANS_USING_MCS28) PUSCH_TRANS_USING_MCS28,
          SUM(PDSCH_TRANS_USING_MCS0) PDSCH_TRANS_USING_MCS0,
          SUM(PDSCH_TRANS_USING_MCS1) PDSCH_TRANS_USING_MCS1,
          SUM(PDSCH_TRANS_USING_MCS2) PDSCH_TRANS_USING_MCS2,
          SUM(PDSCH_TRANS_USING_MCS3) PDSCH_TRANS_USING_MCS3,
          SUM(PDSCH_TRANS_USING_MCS4) PDSCH_TRANS_USING_MCS4,
          SUM(PDSCH_TRANS_USING_MCS5) PDSCH_TRANS_USING_MCS5,
          SUM(PDSCH_TRANS_USING_MCS6) PDSCH_TRANS_USING_MCS6,
          SUM(PDSCH_TRANS_USING_MCS7) PDSCH_TRANS_USING_MCS7,
          SUM(PDSCH_TRANS_USING_MCS8) PDSCH_TRANS_USING_MCS8,
          SUM(PDSCH_TRANS_USING_MCS9) PDSCH_TRANS_USING_MCS9,
          SUM(PDSCH_TRANS_USING_MCS10) PDSCH_TRANS_USING_MCS10,
          SUM(PDSCH_TRANS_USING_MCS11) PDSCH_TRANS_USING_MCS11,
          SUM(PDSCH_TRANS_USING_MCS12) PDSCH_TRANS_USING_MCS12,
          SUM(PDSCH_TRANS_USING_MCS13) PDSCH_TRANS_USING_MCS13,
          SUM(PDSCH_TRANS_USING_MCS14) PDSCH_TRANS_USING_MCS14,
          SUM(PDSCH_TRANS_USING_MCS15) PDSCH_TRANS_USING_MCS15,
          SUM(PDSCH_TRANS_USING_MCS16) PDSCH_TRANS_USING_MCS16,
          SUM(PDSCH_TRANS_USING_MCS17) PDSCH_TRANS_USING_MCS17,
          SUM(PDSCH_TRANS_USING_MCS18) PDSCH_TRANS_USING_MCS18,
          SUM(PDSCH_TRANS_USING_MCS19) PDSCH_TRANS_USING_MCS19,
          SUM(PDSCH_TRANS_USING_MCS20) PDSCH_TRANS_USING_MCS20,
          SUM(PDSCH_TRANS_USING_MCS21) PDSCH_TRANS_USING_MCS21,
          SUM(PDSCH_TRANS_USING_MCS22) PDSCH_TRANS_USING_MCS22,
          SUM(PDSCH_TRANS_USING_MCS23) PDSCH_TRANS_USING_MCS23,
          SUM(PDSCH_TRANS_USING_MCS24) PDSCH_TRANS_USING_MCS24,
          SUM(PDSCH_TRANS_USING_MCS25) PDSCH_TRANS_USING_MCS25,
          SUM(PDSCH_TRANS_USING_MCS26) PDSCH_TRANS_USING_MCS26,
          SUM(PDSCH_TRANS_USING_MCS27) PDSCH_TRANS_USING_MCS27,
          SUM(PDSCH_TRANS_USING_MCS28) PDSCH_TRANS_USING_MCS28,
          SUM(PUSCH_TRANS_NACK_MCS0) PUSCH_TRANS_NACK_MCS0,
          SUM(PUSCH_TRANS_NACK_MCS1) PUSCH_TRANS_NACK_MCS1,
          SUM(PUSCH_TRANS_NACK_MCS2) PUSCH_TRANS_NACK_MCS2,
          SUM(PUSCH_TRANS_NACK_MCS3) PUSCH_TRANS_NACK_MCS3,
          SUM(PUSCH_TRANS_NACK_MCS4) PUSCH_TRANS_NACK_MCS4,
          SUM(PUSCH_TRANS_NACK_MCS5) PUSCH_TRANS_NACK_MCS5,
          SUM(PUSCH_TRANS_NACK_MCS6) PUSCH_TRANS_NACK_MCS6,
          SUM(PUSCH_TRANS_NACK_MCS7) PUSCH_TRANS_NACK_MCS7,
          SUM(PUSCH_TRANS_NACK_MCS8) PUSCH_TRANS_NACK_MCS8,
          SUM(PUSCH_TRANS_NACK_MCS9) PUSCH_TRANS_NACK_MCS9,
          SUM(PUSCH_TRANS_NACK_MCS10) PUSCH_TRANS_NACK_MCS10,
          SUM(PUSCH_TRANS_NACK_MCS11) PUSCH_TRANS_NACK_MCS11,
          SUM(PUSCH_TRANS_NACK_MCS12) PUSCH_TRANS_NACK_MCS12,
          SUM(PUSCH_TRANS_NACK_MCS13) PUSCH_TRANS_NACK_MCS13,
          SUM(PUSCH_TRANS_NACK_MCS14) PUSCH_TRANS_NACK_MCS14,
          SUM(PUSCH_TRANS_NACK_MCS15) PUSCH_TRANS_NACK_MCS15,
          SUM(PUSCH_TRANS_NACK_MCS16) PUSCH_TRANS_NACK_MCS16,
          SUM(PUSCH_TRANS_NACK_MCS17) PUSCH_TRANS_NACK_MCS17,
          SUM(PUSCH_TRANS_NACK_MCS18) PUSCH_TRANS_NACK_MCS18,
          SUM(PUSCH_TRANS_NACK_MCS19) PUSCH_TRANS_NACK_MCS19,
          SUM(PUSCH_TRANS_NACK_MCS20) PUSCH_TRANS_NACK_MCS20,
          SUM(PUSCH_TRANS_NACK_MCS21) PUSCH_TRANS_NACK_MCS21,
          SUM(PUSCH_TRANS_NACK_MCS22) PUSCH_TRANS_NACK_MCS22,
          SUM(PUSCH_TRANS_NACK_MCS23) PUSCH_TRANS_NACK_MCS23,
          SUM(PUSCH_TRANS_NACK_MCS24) PUSCH_TRANS_NACK_MCS24,
          SUM(PUSCH_TRANS_NACK_MCS25) PUSCH_TRANS_NACK_MCS25,
          SUM(PUSCH_TRANS_NACK_MCS26) PUSCH_TRANS_NACK_MCS26,
          SUM(PUSCH_TRANS_NACK_MCS27) PUSCH_TRANS_NACK_MCS27,
          SUM(PUSCH_TRANS_NACK_MCS28) PUSCH_TRANS_NACK_MCS28,
          SUM(PDSCH_TRANS_NACK_MCS0) PDSCH_TRANS_NACK_MCS0,
          SUM(PDSCH_TRANS_NACK_MCS1) PDSCH_TRANS_NACK_MCS1,
          SUM(PDSCH_TRANS_NACK_MCS2) PDSCH_TRANS_NACK_MCS2,
          SUM(PDSCH_TRANS_NACK_MCS3) PDSCH_TRANS_NACK_MCS3,
          SUM(PDSCH_TRANS_NACK_MCS4) PDSCH_TRANS_NACK_MCS4,
          SUM(PDSCH_TRANS_NACK_MCS5) PDSCH_TRANS_NACK_MCS5,
          SUM(PDSCH_TRANS_NACK_MCS6) PDSCH_TRANS_NACK_MCS6,
          SUM(PDSCH_TRANS_NACK_MCS7) PDSCH_TRANS_NACK_MCS7,
          SUM(PDSCH_TRANS_NACK_MCS8) PDSCH_TRANS_NACK_MCS8,
          SUM(PDSCH_TRANS_NACK_MCS9) PDSCH_TRANS_NACK_MCS9,
          SUM(PDSCH_TRANS_NACK_MCS10) PDSCH_TRANS_NACK_MCS10,
          SUM(PDSCH_TRANS_NACK_MCS11) PDSCH_TRANS_NACK_MCS11,
          SUM(PDSCH_TRANS_NACK_MCS12) PDSCH_TRANS_NACK_MCS12,
          SUM(PDSCH_TRANS_NACK_MCS13) PDSCH_TRANS_NACK_MCS13,
          SUM(PDSCH_TRANS_NACK_MCS14) PDSCH_TRANS_NACK_MCS14,
          SUM(PDSCH_TRANS_NACK_MCS15) PDSCH_TRANS_NACK_MCS15,
          SUM(PDSCH_TRANS_NACK_MCS16) PDSCH_TRANS_NACK_MCS16,
          SUM(PDSCH_TRANS_NACK_MCS17) PDSCH_TRANS_NACK_MCS17,
          SUM(PDSCH_TRANS_NACK_MCS18) PDSCH_TRANS_NACK_MCS18,
          SUM(PDSCH_TRANS_NACK_MCS19) PDSCH_TRANS_NACK_MCS19,
          SUM(PDSCH_TRANS_NACK_MCS20) PDSCH_TRANS_NACK_MCS20,
          SUM(PDSCH_TRANS_NACK_MCS21) PDSCH_TRANS_NACK_MCS21,
          SUM(PDSCH_TRANS_NACK_MCS22) PDSCH_TRANS_NACK_MCS22,
          SUM(PDSCH_TRANS_NACK_MCS23) PDSCH_TRANS_NACK_MCS23,
          SUM(PDSCH_TRANS_NACK_MCS24) PDSCH_TRANS_NACK_MCS24,
          SUM(PDSCH_TRANS_NACK_MCS25) PDSCH_TRANS_NACK_MCS25,
          SUM(PDSCH_TRANS_NACK_MCS26) PDSCH_TRANS_NACK_MCS26,
          SUM(PDSCH_TRANS_NACK_MCS27) PDSCH_TRANS_NACK_MCS27,
          SUM(PDSCH_TRANS_NACK_MCS28) PDSCH_TRANS_NACK_MCS28,
          SUM(RLC_PDU_FIRST_TRANS) RLC_PDU_FIRST_TRANS,
          SUM(RLC_PDU_RE_TRANS) RLC_PDU_RE_TRANS,
          SUM(UL_RLC_PDU_REC_TOT) UL_RLC_PDU_REC_TOT,
          SUM(UL_RLC_PDU_RETR_REQ) UL_RLC_PDU_RETR_REQ
        from          
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",
          noklte_ps_lcelld_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16          
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129      
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LCELLD2_3031613682
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        AVG(UL_PRB_UTIL_TTI_MEAN) UL_PRB_UTIL_TTI_MEAN,
        AVG(DL_PRB_UTIL_TTI_MEAN) DL_PRB_UTIL_TTI_MEAN,
        SUM(AGG1_USED_PDCCH) AGG1_USED_PDCCH,
        SUM(AGG2_USED_PDCCH) AGG2_USED_PDCCH,
        SUM(AGG4_USED_PDCCH) AGG4_USED_PDCCH,
        SUM(AGG8_USED_PDCCH) AGG8_USED_PDCCH,
        SUM(PRB_USED_PUSCH) PRB_USED_PUSCH,
        SUM(PRB_USED_PDSCH) PRB_USED_PDSCH,
        SUM(PDCCH_1_OFDM_SYMBOL) PDCCH_1_OFDM_SYMBOL,
        SUM(PDCCH_2_OFDM_SYMBOLS) PDCCH_2_OFDM_SYMBOLS,
        SUM(PDCCH_3_OFDM_SYMBOLS) PDCCH_3_OFDM_SYMBOLS,
        AVG(TTI_BUNDLING_MODE_UE_AVG) TTI_BUNDLING_MODE_UE_AVG,
        SUM(CA_SCELL_CONFIG_ATT) CA_SCELL_CONFIG_ATT,
        SUM(CA_SCELL_CONFIG_SUCC) CA_SCELL_CONFIG_SUCC,
        SUM(HIGH_CELL_LOAD_LB) HIGH_CELL_LOAD_LB,
        SUM(SCHDL_256QAM_PDSCH_64QAM) SCHDL_256QAM_PDSCH_64QAM,
        SUM(SCHDL_256QAM_PDSCH_16QAM) SCHDL_256QAM_PDSCH_16QAM,
        SUM(SCHDL_256QAM_PDSCH_NACK_256QAM) SCHDL_256QAM_PDSCH_NACK_256QAM,
        SUM(SCHDL_256QAM_PDSCH_NACK_16QAM) SCHDL_256QAM_PDSCH_NACK_16QAM,
        SUM(SCHDL_256QAM_PDSCH_NACK_QPSK) SCHDL_256QAM_PDSCH_NACK_QPSK,
        SUM(SCHDL_256QAM_PDSCH_QPSK) SCHDL_256QAM_PDSCH_QPSK,
        SUM(SCHDL_256QAM_PDSCH_NACK_64QAM) SCHDL_256QAM_PDSCH_NACK_64QAM,
        SUM(SCHDL_256QAM_PDSCH_256QAM) SCHDL_256QAM_PDSCH_256QAM,
        SUM(period_duration_sum) period_duration_sum
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          AVG(UL_PRB_UTIL_TTI_MEAN) UL_PRB_UTIL_TTI_MEAN,
          AVG(DL_PRB_UTIL_TTI_MEAN) DL_PRB_UTIL_TTI_MEAN,
          SUM(AGG1_USED_PDCCH) AGG1_USED_PDCCH,
          SUM(AGG2_USED_PDCCH) AGG2_USED_PDCCH,
          SUM(AGG4_USED_PDCCH) AGG4_USED_PDCCH,
          SUM(AGG8_USED_PDCCH) AGG8_USED_PDCCH,
          SUM(PRB_USED_PUSCH) PRB_USED_PUSCH,
          SUM(PRB_USED_PDSCH) PRB_USED_PDSCH,
          SUM(PDCCH_1_OFDM_SYMBOL) PDCCH_1_OFDM_SYMBOL,
          SUM(PDCCH_2_OFDM_SYMBOLS) PDCCH_2_OFDM_SYMBOLS,
          SUM(PDCCH_3_OFDM_SYMBOLS) PDCCH_3_OFDM_SYMBOLS,
          AVG(TTI_BUNDLING_MODE_UE_AVG) TTI_BUNDLING_MODE_UE_AVG,
          SUM(CA_SCELL_CONFIG_ATT) CA_SCELL_CONFIG_ATT,
          SUM(CA_SCELL_CONFIG_SUCC) CA_SCELL_CONFIG_SUCC,
          SUM(HIGH_CELL_LOAD_LB) HIGH_CELL_LOAD_LB,
          SUM(SCHDL_256QAM_PDSCH_64QAM) SCHDL_256QAM_PDSCH_64QAM,
          SUM(SCHDL_256QAM_PDSCH_16QAM) SCHDL_256QAM_PDSCH_16QAM,
          SUM(SCHDL_256QAM_PDSCH_NACK_256QAM) SCHDL_256QAM_PDSCH_NACK_256QAM,
          SUM(SCHDL_256QAM_PDSCH_NACK_16QAM) SCHDL_256QAM_PDSCH_NACK_16QAM,
          SUM(SCHDL_256QAM_PDSCH_NACK_QPSK) SCHDL_256QAM_PDSCH_NACK_QPSK,
          SUM(SCHDL_256QAM_PDSCH_QPSK) SCHDL_256QAM_PDSCH_QPSK,
          SUM(SCHDL_256QAM_PDSCH_NACK_64QAM) SCHDL_256QAM_PDSCH_NACK_64QAM,
          SUM(SCHDL_256QAM_PDSCH_256QAM) SCHDL_256QAM_PDSCH_256QAM,
          SUM(period_duration_sum) period_duration_sum
        from          
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts", 
          noklte_ps_lcellr_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16          
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129   
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LCELLR2_3043532938
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(PDCP_SDU_VOL_UL) PDCP_SDU_VOL_UL,
        SUM(PDCP_SDU_VOL_DL) PDCP_SDU_VOL_DL,
        MAX(PDCP_DATA_RATE_MAX_UL) PDCP_DATA_RATE_MAX_UL,
        MAX(PDCP_DATA_RATE_MAX_DL) PDCP_DATA_RATE_MAX_DL,
        SUM(ACTIVE_TTI_UL) ACTIVE_TTI_UL,
        SUM(ACTIVE_TTI_DL) ACTIVE_TTI_DL,
        SUM(IP_TPUT_VOL_UL_QCI_5) IP_TPUT_VOL_UL_QCI_5,
        SUM(IP_TPUT_TIME_UL_QCI_5) IP_TPUT_TIME_UL_QCI_5,
        SUM(IP_TPUT_VOL_UL_QCI_6) IP_TPUT_VOL_UL_QCI_6,
        SUM(IP_TPUT_TIME_UL_QCI_6) IP_TPUT_TIME_UL_QCI_6,
        SUM(IP_TPUT_VOL_UL_QCI_7) IP_TPUT_VOL_UL_QCI_7,
        SUM(IP_TPUT_TIME_UL_QCI_7) IP_TPUT_TIME_UL_QCI_7,
        SUM(IP_TPUT_VOL_UL_QCI_8) IP_TPUT_VOL_UL_QCI_8,
        SUM(IP_TPUT_TIME_UL_QCI_8) IP_TPUT_TIME_UL_QCI_8,
        SUM(IP_TPUT_VOL_UL_QCI_9) IP_TPUT_VOL_UL_QCI_9,
        SUM(IP_TPUT_TIME_UL_QCI_9) IP_TPUT_TIME_UL_QCI_9,
        AVG(PDCP_DATA_RATE_MEAN_UL_QCI_1) PDCP_DATA_RATE_MEAN_UL_QCI_1,
        SUM(IP_TPUT_VOL_DL_QCI_5) IP_TPUT_VOL_DL_QCI_5,
        SUM(IP_TPUT_TIME_DL_QCI_5) IP_TPUT_TIME_DL_QCI_5,
        SUM(IP_TPUT_VOL_DL_QCI_6) IP_TPUT_VOL_DL_QCI_6,
        SUM(IP_TPUT_TIME_DL_QCI_6) IP_TPUT_TIME_DL_QCI_6,
        SUM(IP_TPUT_VOL_DL_QCI_7) IP_TPUT_VOL_DL_QCI_7,
        SUM(IP_TPUT_TIME_DL_QCI_7) IP_TPUT_TIME_DL_QCI_7,
        SUM(IP_TPUT_VOL_DL_QCI_8) IP_TPUT_VOL_DL_QCI_8,
        SUM(IP_TPUT_TIME_DL_QCI_8) IP_TPUT_TIME_DL_QCI_8,
        SUM(IP_TPUT_VOL_DL_QCI_9) IP_TPUT_VOL_DL_QCI_9,
        SUM(IP_TPUT_TIME_DL_QCI_9) IP_TPUT_TIME_DL_QCI_9,
        AVG(PDCP_DATA_RATE_MEAN_DL_QCI_1) PDCP_DATA_RATE_MEAN_DL_QCI_1,
        SUM(RLC_PDU_DL_VOL_CA_SCELL) RLC_PDU_DL_VOL_CA_SCELL
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(PDCP_SDU_VOL_UL) PDCP_SDU_VOL_UL,
          SUM(PDCP_SDU_VOL_DL) PDCP_SDU_VOL_DL,
          MAX(PDCP_DATA_RATE_MAX_UL) PDCP_DATA_RATE_MAX_UL,
          MAX(PDCP_DATA_RATE_MAX_DL) PDCP_DATA_RATE_MAX_DL,
          SUM(ACTIVE_TTI_UL) ACTIVE_TTI_UL,
          SUM(ACTIVE_TTI_DL) ACTIVE_TTI_DL,
          SUM(IP_TPUT_VOL_UL_QCI_5) IP_TPUT_VOL_UL_QCI_5,
          SUM(IP_TPUT_TIME_UL_QCI_5) IP_TPUT_TIME_UL_QCI_5,
          SUM(IP_TPUT_VOL_UL_QCI_6) IP_TPUT_VOL_UL_QCI_6,
          SUM(IP_TPUT_TIME_UL_QCI_6) IP_TPUT_TIME_UL_QCI_6,
          SUM(IP_TPUT_VOL_UL_QCI_7) IP_TPUT_VOL_UL_QCI_7,
          SUM(IP_TPUT_TIME_UL_QCI_7) IP_TPUT_TIME_UL_QCI_7,
          SUM(IP_TPUT_VOL_UL_QCI_8) IP_TPUT_VOL_UL_QCI_8,
          SUM(IP_TPUT_TIME_UL_QCI_8) IP_TPUT_TIME_UL_QCI_8,
          SUM(IP_TPUT_VOL_UL_QCI_9) IP_TPUT_VOL_UL_QCI_9,
          SUM(IP_TPUT_TIME_UL_QCI_9) IP_TPUT_TIME_UL_QCI_9,
          AVG(PDCP_DATA_RATE_MEAN_UL_QCI_1) PDCP_DATA_RATE_MEAN_UL_QCI_1,
          SUM(IP_TPUT_VOL_DL_QCI_5) IP_TPUT_VOL_DL_QCI_5,
          SUM(IP_TPUT_TIME_DL_QCI_5) IP_TPUT_TIME_DL_QCI_5,
          SUM(IP_TPUT_VOL_DL_QCI_6) IP_TPUT_VOL_DL_QCI_6,
          SUM(IP_TPUT_TIME_DL_QCI_6) IP_TPUT_TIME_DL_QCI_6,
          SUM(IP_TPUT_VOL_DL_QCI_7) IP_TPUT_VOL_DL_QCI_7,
          SUM(IP_TPUT_TIME_DL_QCI_7) IP_TPUT_TIME_DL_QCI_7,
          SUM(IP_TPUT_VOL_DL_QCI_8) IP_TPUT_VOL_DL_QCI_8,
          SUM(IP_TPUT_TIME_DL_QCI_8) IP_TPUT_TIME_DL_QCI_8,
          SUM(IP_TPUT_VOL_DL_QCI_9) IP_TPUT_VOL_DL_QCI_9,
          SUM(IP_TPUT_TIME_DL_QCI_9) IP_TPUT_TIME_DL_QCI_9,
          AVG(PDCP_DATA_RATE_MEAN_DL_QCI_1) PDCP_DATA_RATE_MEAN_DL_QCI_1,
          SUM(RLC_PDU_DL_VOL_CA_SCELL) RLC_PDU_DL_VOL_CA_SCELL
        from          
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lcellt_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129      
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LCELLT2_305186229
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(PDCP_SDU_VOL_DL) PDCP_SDU_VOL_DL,
        SUM(PDCP_SDU_VOL_UL) PDCP_SDU_VOL_UL
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(DECODE(ACTIVE_TTI_DL,NULL,0, PDCP_SDU_VOL_DL)) PDCP_SDU_VOL_DL,
          SUM(DECODE(ACTIVE_TTI_UL,NULL,0, PDCP_SDU_VOL_UL)) PDCP_SDU_VOL_UL
        from    
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lcellt_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129      
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LCELLT_ext2_3072456742
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        MAX(ENB_LOAD_ACT_UE_MAX) ENB_LOAD_ACT_UE_MAX,
        SUM(SUM_ACTIVE_UE_ENB) SUM_ACTIVE_UE_ENB,
        SUM(DENOM_ACTIVE_UE_ENB) DENOM_ACTIVE_UE_ENB
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          MAX(ENB_LOAD_ACT_UE_MAX) ENB_LOAD_ACT_UE_MAX,
          SUM(SUM_ACTIVE_UE_ENB) SUM_ACTIVE_UE_ENB,
          SUM(DENOM_ACTIVE_UE_ENB) DENOM_ACTIVE_UE_ENB
        from
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",
          noklte_ps_lenbld_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16
          
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129
        
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LENBLD2_3083528029
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        trunc( p.period_start_time, 'dd' ) period_start_time,
        "plmn".co_gid plmn_gid,
        COUNT(DISTINCT LNBTS_ID) LNBTS_COUNT
      from
        utp_common_objects "plmn",
        utp_common_objects "vloflnbtsparent",
        utp_common_objects "lnbts",
        NOKLTE_PS_LENBLD_LNBTS_day p
      where
        "plmn".co_gid in ( '100000' ) 
        and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
        and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
        and "plmn".co_oc_id = 16
        
        and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
        and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
        and "lnbts".co_gid = p.lnbts_id
        and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
        and "lnbts".co_oc_id = 3129
      group by
        trunc( p.period_start_time, 'dd' ),
        "plmn".co_gid
      ) jf_LENBLD_ext_3095240177
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(EPS_BEARER_SETUP_ATTEMPTS) EPS_BEARER_SETUP_ATTEMPTS,
        SUM(EPS_BEARER_SETUP_COMPLETIONS) EPS_BEARER_SETUP_COMPLETIONS,
        SUM(EPC_EPS_BEARER_REL_REQ_NORM) EPC_EPS_BEARER_REL_REQ_NORM,
        SUM(EPC_EPS_BEARER_REL_REQ_DETACH) EPC_EPS_BEARER_REL_REQ_DETACH,
        SUM(EPC_EPS_BEARER_REL_REQ_RNL) EPC_EPS_BEARER_REL_REQ_RNL,
        SUM(EPC_EPS_BEARER_REL_REQ_OTH) EPC_EPS_BEARER_REL_REQ_OTH,
        SUM(EPS_BEARER_STP_ATT_INI_QCI_1) EPS_BEARER_STP_ATT_INI_QCI_1,
        SUM(EPS_BEAR_STP_ATT_INI_NON_GBR) EPS_BEAR_STP_ATT_INI_NON_GBR,
        SUM(EPS_BEARER_STP_ATT_ADD_QCI_1) EPS_BEARER_STP_ATT_ADD_QCI_1,
        SUM(EPS_BEARER_STP_COM_INI_QCI1) EPS_BEARER_STP_COM_INI_QCI1,
        SUM(EPS_BEAR_STP_COM_INI_NON_GBR) EPS_BEAR_STP_COM_INI_NON_GBR,
        SUM(EPC_EPS_BEAR_REL_REQ_N_QCI1) EPC_EPS_BEAR_REL_REQ_N_QCI1,
        SUM(EPC_EPS_BEAR_REL_REQ_D_QCI1) EPC_EPS_BEAR_REL_REQ_D_QCI1,
        SUM(EPC_EPS_BEAR_REL_REQ_R_QCI1) EPC_EPS_BEAR_REL_REQ_R_QCI1,
        SUM(EPC_EPS_BEAR_REL_REQ_O_QCI1) EPC_EPS_BEAR_REL_REQ_O_QCI1,
        SUM(EPS_BEARER_STP_ATT_INI_QCI_2) EPS_BEARER_STP_ATT_INI_QCI_2,
        SUM(EPS_BEARER_STP_ATT_INI_QCI_3) EPS_BEARER_STP_ATT_INI_QCI_3,
        SUM(EPS_BEARER_STP_ATT_INI_QCI_4) EPS_BEARER_STP_ATT_INI_QCI_4,
        SUM(EPS_BEARER_STP_ATT_ADD_QCI_2) EPS_BEARER_STP_ATT_ADD_QCI_2,
        SUM(EPS_BEARER_STP_ATT_ADD_QCI_3) EPS_BEARER_STP_ATT_ADD_QCI_3,
        SUM(EPS_BEARER_STP_ATT_ADD_QCI_4) EPS_BEARER_STP_ATT_ADD_QCI_4,
        SUM(EPS_BEARER_STP_COM_INI_QCI_2) EPS_BEARER_STP_COM_INI_QCI_2,
        SUM(EPS_BEARER_STP_COM_INI_QCI_3) EPS_BEARER_STP_COM_INI_QCI_3,
        SUM(EPS_BEARER_STP_COM_INI_QCI_4) EPS_BEARER_STP_COM_INI_QCI_4,
        SUM(EPS_BEARER_STP_COM_ADD_QCI_2) EPS_BEARER_STP_COM_ADD_QCI_2,
        SUM(EPS_BEARER_STP_COM_ADD_QCI_3) EPS_BEARER_STP_COM_ADD_QCI_3,
        SUM(EPS_BEARER_STP_COM_ADD_QCI_4) EPS_BEARER_STP_COM_ADD_QCI_4,
        SUM(ERAB_REL_ENB_ACT_QCI1) ERAB_REL_ENB_ACT_QCI1,
        SUM(ERAB_REL_ENB_ACT_QCI2) ERAB_REL_ENB_ACT_QCI2,
        SUM(ERAB_REL_ENB_ACT_QCI3) ERAB_REL_ENB_ACT_QCI3,
        SUM(ERAB_REL_ENB_ACT_QCI4) ERAB_REL_ENB_ACT_QCI4,
        SUM(ERAB_REL_ENB_ACT_NON_GBR) ERAB_REL_ENB_ACT_NON_GBR,
        SUM(ERAB_IN_SESSION_TIME_QCI1) ERAB_IN_SESSION_TIME_QCI1,
        SUM(ERAB_IN_SESSION_TIME_QCI2) ERAB_IN_SESSION_TIME_QCI2,
        SUM(ERAB_IN_SESSION_TIME_QCI3) ERAB_IN_SESSION_TIME_QCI3,
        SUM(ERAB_IN_SESSION_TIME_QCI4) ERAB_IN_SESSION_TIME_QCI4,
        SUM(ERAB_IN_SESSION_TIME_NON_GBR) ERAB_IN_SESSION_TIME_NON_GBR,
        SUM(ERAB_INI_SETUP_ATT_QCI1) ERAB_INI_SETUP_ATT_QCI1,
        SUM(ERAB_INI_SETUP_ATT_QCI2) ERAB_INI_SETUP_ATT_QCI2,
        SUM(ERAB_INI_SETUP_ATT_QCI3) ERAB_INI_SETUP_ATT_QCI3,
        SUM(ERAB_INI_SETUP_ATT_QCI4) ERAB_INI_SETUP_ATT_QCI4,
        SUM(ERAB_INI_SETUP_ATT_QCI5) ERAB_INI_SETUP_ATT_QCI5,
        SUM(ERAB_INI_SETUP_ATT_QCI6) ERAB_INI_SETUP_ATT_QCI6,
        SUM(ERAB_INI_SETUP_ATT_QCI7) ERAB_INI_SETUP_ATT_QCI7,
        SUM(ERAB_INI_SETUP_ATT_QCI8) ERAB_INI_SETUP_ATT_QCI8,
        SUM(ERAB_INI_SETUP_ATT_QCI9) ERAB_INI_SETUP_ATT_QCI9,
        SUM(ERAB_ADD_SETUP_ATT_QCI1) ERAB_ADD_SETUP_ATT_QCI1,
        SUM(ERAB_ADD_SETUP_ATT_QCI2) ERAB_ADD_SETUP_ATT_QCI2,
        SUM(ERAB_ADD_SETUP_ATT_QCI3) ERAB_ADD_SETUP_ATT_QCI3,
        SUM(ERAB_ADD_SETUP_ATT_QCI4) ERAB_ADD_SETUP_ATT_QCI4,
        SUM(ERAB_ADD_SETUP_ATT_QCI5) ERAB_ADD_SETUP_ATT_QCI5,
        SUM(ERAB_ADD_SETUP_ATT_QCI6) ERAB_ADD_SETUP_ATT_QCI6,
        SUM(ERAB_ADD_SETUP_ATT_QCI7) ERAB_ADD_SETUP_ATT_QCI7,
        SUM(ERAB_ADD_SETUP_ATT_QCI8) ERAB_ADD_SETUP_ATT_QCI8,
        SUM(ERAB_ADD_SETUP_ATT_QCI9) ERAB_ADD_SETUP_ATT_QCI9,
        SUM(ERAB_INI_SETUP_SUCC_QCI1) ERAB_INI_SETUP_SUCC_QCI1,
        SUM(ERAB_INI_SETUP_SUCC_QCI2) ERAB_INI_SETUP_SUCC_QCI2,
        SUM(ERAB_INI_SETUP_SUCC_QCI3) ERAB_INI_SETUP_SUCC_QCI3,
        SUM(ERAB_INI_SETUP_SUCC_QCI4) ERAB_INI_SETUP_SUCC_QCI4,
        SUM(ERAB_INI_SETUP_SUCC_QCI5) ERAB_INI_SETUP_SUCC_QCI5,
        SUM(ERAB_INI_SETUP_SUCC_QCI6) ERAB_INI_SETUP_SUCC_QCI6,
        SUM(ERAB_INI_SETUP_SUCC_QCI7) ERAB_INI_SETUP_SUCC_QCI7,
        SUM(ERAB_INI_SETUP_SUCC_QCI8) ERAB_INI_SETUP_SUCC_QCI8,
        SUM(ERAB_INI_SETUP_SUCC_QCI9) ERAB_INI_SETUP_SUCC_QCI9,
        SUM(ERAB_ADD_SETUP_SUCC_QCI1) ERAB_ADD_SETUP_SUCC_QCI1,
        SUM(ERAB_ADD_SETUP_SUCC_QCI2) ERAB_ADD_SETUP_SUCC_QCI2,
        SUM(ERAB_ADD_SETUP_SUCC_QCI3) ERAB_ADD_SETUP_SUCC_QCI3,
        SUM(ERAB_ADD_SETUP_SUCC_QCI4) ERAB_ADD_SETUP_SUCC_QCI4,
        SUM(ERAB_ADD_SETUP_SUCC_QCI5) ERAB_ADD_SETUP_SUCC_QCI5,
        SUM(ERAB_ADD_SETUP_SUCC_QCI6) ERAB_ADD_SETUP_SUCC_QCI6,
        SUM(ERAB_ADD_SETUP_SUCC_QCI7) ERAB_ADD_SETUP_SUCC_QCI7,
        SUM(ERAB_ADD_SETUP_SUCC_QCI8) ERAB_ADD_SETUP_SUCC_QCI8,
        SUM(ERAB_ADD_SETUP_SUCC_QCI9) ERAB_ADD_SETUP_SUCC_QCI9,
        SUM(ERAB_REL_ENB) ERAB_REL_ENB,
        SUM(ERAB_REL_ENB_RNL_INA) ERAB_REL_ENB_RNL_INA,
        SUM(ERAB_REL_ENB_RNL_RED) ERAB_REL_ENB_RNL_RED,
        SUM(ERAB_REL_ENB_RNL_RRNA) ERAB_REL_ENB_RNL_RRNA,
        SUM(ERAB_REL_HO_PART) ERAB_REL_HO_PART,
        SUM(ERAB_REL_HO_SUCC) ERAB_REL_HO_SUCC,
        SUM(ERAB_REL_ENB_QCI1) ERAB_REL_ENB_QCI1,
        SUM(ERAB_REL_ENB_RNL_INA_QCI1) ERAB_REL_ENB_RNL_INA_QCI1,
        SUM(ERAB_REL_ENB_RNL_RED_QCI1) ERAB_REL_ENB_RNL_RED_QCI1,
        SUM(ERAB_REL_ENB_RNL_RRNA_QCI1) ERAB_REL_ENB_RNL_RRNA_QCI1,
        SUM(ERAB_REL_HO_PART_QCI1) ERAB_REL_HO_PART_QCI1,
        SUM(ERAB_REL_EPC_PATH_SWITCH) ERAB_REL_EPC_PATH_SWITCH,
        SUM(ERAB_REL_EPC_PATH_SWITCH_QCI1) ERAB_REL_EPC_PATH_SWITCH_QCI1,
        SUM(ERAB_REL_TEMP_QCI1) ERAB_REL_TEMP_QCI1
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(EPS_BEARER_SETUP_ATTEMPTS) EPS_BEARER_SETUP_ATTEMPTS,
          SUM(EPS_BEARER_SETUP_COMPLETIONS) EPS_BEARER_SETUP_COMPLETIONS,
          SUM(EPC_EPS_BEARER_REL_REQ_NORM) EPC_EPS_BEARER_REL_REQ_NORM,
          SUM(EPC_EPS_BEARER_REL_REQ_DETACH) EPC_EPS_BEARER_REL_REQ_DETACH,
          SUM(EPC_EPS_BEARER_REL_REQ_RNL) EPC_EPS_BEARER_REL_REQ_RNL,
          SUM(EPC_EPS_BEARER_REL_REQ_OTH) EPC_EPS_BEARER_REL_REQ_OTH,
          SUM(EPS_BEARER_STP_ATT_INI_QCI_1) EPS_BEARER_STP_ATT_INI_QCI_1,
          SUM(EPS_BEAR_STP_ATT_INI_NON_GBR) EPS_BEAR_STP_ATT_INI_NON_GBR,
          SUM(EPS_BEARER_STP_ATT_ADD_QCI_1) EPS_BEARER_STP_ATT_ADD_QCI_1,
          SUM(EPS_BEARER_STP_COM_INI_QCI1) EPS_BEARER_STP_COM_INI_QCI1,
          SUM(EPS_BEAR_STP_COM_INI_NON_GBR) EPS_BEAR_STP_COM_INI_NON_GBR,
          SUM(EPC_EPS_BEAR_REL_REQ_N_QCI1) EPC_EPS_BEAR_REL_REQ_N_QCI1,
          SUM(EPC_EPS_BEAR_REL_REQ_D_QCI1) EPC_EPS_BEAR_REL_REQ_D_QCI1,
          SUM(EPC_EPS_BEAR_REL_REQ_R_QCI1) EPC_EPS_BEAR_REL_REQ_R_QCI1,
          SUM(EPC_EPS_BEAR_REL_REQ_O_QCI1) EPC_EPS_BEAR_REL_REQ_O_QCI1,
          SUM(EPS_BEARER_STP_ATT_INI_QCI_2) EPS_BEARER_STP_ATT_INI_QCI_2,
          SUM(EPS_BEARER_STP_ATT_INI_QCI_3) EPS_BEARER_STP_ATT_INI_QCI_3,
          SUM(EPS_BEARER_STP_ATT_INI_QCI_4) EPS_BEARER_STP_ATT_INI_QCI_4,
          SUM(EPS_BEARER_STP_ATT_ADD_QCI_2) EPS_BEARER_STP_ATT_ADD_QCI_2,
          SUM(EPS_BEARER_STP_ATT_ADD_QCI_3) EPS_BEARER_STP_ATT_ADD_QCI_3,
          SUM(EPS_BEARER_STP_ATT_ADD_QCI_4) EPS_BEARER_STP_ATT_ADD_QCI_4,
          SUM(EPS_BEARER_STP_COM_INI_QCI_2) EPS_BEARER_STP_COM_INI_QCI_2,
          SUM(EPS_BEARER_STP_COM_INI_QCI_3) EPS_BEARER_STP_COM_INI_QCI_3,
          SUM(EPS_BEARER_STP_COM_INI_QCI_4) EPS_BEARER_STP_COM_INI_QCI_4,
          SUM(EPS_BEARER_STP_COM_ADD_QCI_2) EPS_BEARER_STP_COM_ADD_QCI_2,
          SUM(EPS_BEARER_STP_COM_ADD_QCI_3) EPS_BEARER_STP_COM_ADD_QCI_3,
          SUM(EPS_BEARER_STP_COM_ADD_QCI_4) EPS_BEARER_STP_COM_ADD_QCI_4,
          SUM(ERAB_REL_ENB_ACT_QCI1) ERAB_REL_ENB_ACT_QCI1,
          SUM(ERAB_REL_ENB_ACT_QCI2) ERAB_REL_ENB_ACT_QCI2,
          SUM(ERAB_REL_ENB_ACT_QCI3) ERAB_REL_ENB_ACT_QCI3,
          SUM(ERAB_REL_ENB_ACT_QCI4) ERAB_REL_ENB_ACT_QCI4,
          SUM(ERAB_REL_ENB_ACT_NON_GBR) ERAB_REL_ENB_ACT_NON_GBR,
          SUM(ERAB_IN_SESSION_TIME_QCI1) ERAB_IN_SESSION_TIME_QCI1,
          SUM(ERAB_IN_SESSION_TIME_QCI2) ERAB_IN_SESSION_TIME_QCI2,
          SUM(ERAB_IN_SESSION_TIME_QCI3) ERAB_IN_SESSION_TIME_QCI3,
          SUM(ERAB_IN_SESSION_TIME_QCI4) ERAB_IN_SESSION_TIME_QCI4,
          SUM(ERAB_IN_SESSION_TIME_NON_GBR) ERAB_IN_SESSION_TIME_NON_GBR,
          SUM(ERAB_INI_SETUP_ATT_QCI1) ERAB_INI_SETUP_ATT_QCI1,
          SUM(ERAB_INI_SETUP_ATT_QCI2) ERAB_INI_SETUP_ATT_QCI2,
          SUM(ERAB_INI_SETUP_ATT_QCI3) ERAB_INI_SETUP_ATT_QCI3,
          SUM(ERAB_INI_SETUP_ATT_QCI4) ERAB_INI_SETUP_ATT_QCI4,
          SUM(ERAB_INI_SETUP_ATT_QCI5) ERAB_INI_SETUP_ATT_QCI5,
          SUM(ERAB_INI_SETUP_ATT_QCI6) ERAB_INI_SETUP_ATT_QCI6,
          SUM(ERAB_INI_SETUP_ATT_QCI7) ERAB_INI_SETUP_ATT_QCI7,
          SUM(ERAB_INI_SETUP_ATT_QCI8) ERAB_INI_SETUP_ATT_QCI8,
          SUM(ERAB_INI_SETUP_ATT_QCI9) ERAB_INI_SETUP_ATT_QCI9,
          SUM(ERAB_ADD_SETUP_ATT_QCI1) ERAB_ADD_SETUP_ATT_QCI1,
          SUM(ERAB_ADD_SETUP_ATT_QCI2) ERAB_ADD_SETUP_ATT_QCI2,
          SUM(ERAB_ADD_SETUP_ATT_QCI3) ERAB_ADD_SETUP_ATT_QCI3,
          SUM(ERAB_ADD_SETUP_ATT_QCI4) ERAB_ADD_SETUP_ATT_QCI4,
          SUM(ERAB_ADD_SETUP_ATT_QCI5) ERAB_ADD_SETUP_ATT_QCI5,
          SUM(ERAB_ADD_SETUP_ATT_QCI6) ERAB_ADD_SETUP_ATT_QCI6,
          SUM(ERAB_ADD_SETUP_ATT_QCI7) ERAB_ADD_SETUP_ATT_QCI7,
          SUM(ERAB_ADD_SETUP_ATT_QCI8) ERAB_ADD_SETUP_ATT_QCI8,
          SUM(ERAB_ADD_SETUP_ATT_QCI9) ERAB_ADD_SETUP_ATT_QCI9,
          SUM(ERAB_INI_SETUP_SUCC_QCI1) ERAB_INI_SETUP_SUCC_QCI1,
          SUM(ERAB_INI_SETUP_SUCC_QCI2) ERAB_INI_SETUP_SUCC_QCI2,
          SUM(ERAB_INI_SETUP_SUCC_QCI3) ERAB_INI_SETUP_SUCC_QCI3,
          SUM(ERAB_INI_SETUP_SUCC_QCI4) ERAB_INI_SETUP_SUCC_QCI4,
          SUM(ERAB_INI_SETUP_SUCC_QCI5) ERAB_INI_SETUP_SUCC_QCI5,
          SUM(ERAB_INI_SETUP_SUCC_QCI6) ERAB_INI_SETUP_SUCC_QCI6,
          SUM(ERAB_INI_SETUP_SUCC_QCI7) ERAB_INI_SETUP_SUCC_QCI7,
          SUM(ERAB_INI_SETUP_SUCC_QCI8) ERAB_INI_SETUP_SUCC_QCI8,
          SUM(ERAB_INI_SETUP_SUCC_QCI9) ERAB_INI_SETUP_SUCC_QCI9,
          SUM(ERAB_ADD_SETUP_SUCC_QCI1) ERAB_ADD_SETUP_SUCC_QCI1,
          SUM(ERAB_ADD_SETUP_SUCC_QCI2) ERAB_ADD_SETUP_SUCC_QCI2,
          SUM(ERAB_ADD_SETUP_SUCC_QCI3) ERAB_ADD_SETUP_SUCC_QCI3,
          SUM(ERAB_ADD_SETUP_SUCC_QCI4) ERAB_ADD_SETUP_SUCC_QCI4,
          SUM(ERAB_ADD_SETUP_SUCC_QCI5) ERAB_ADD_SETUP_SUCC_QCI5,
          SUM(ERAB_ADD_SETUP_SUCC_QCI6) ERAB_ADD_SETUP_SUCC_QCI6,
          SUM(ERAB_ADD_SETUP_SUCC_QCI7) ERAB_ADD_SETUP_SUCC_QCI7,
          SUM(ERAB_ADD_SETUP_SUCC_QCI8) ERAB_ADD_SETUP_SUCC_QCI8,
          SUM(ERAB_ADD_SETUP_SUCC_QCI9) ERAB_ADD_SETUP_SUCC_QCI9,
          SUM(ERAB_REL_ENB) ERAB_REL_ENB,
          SUM(ERAB_REL_ENB_RNL_INA) ERAB_REL_ENB_RNL_INA,
          SUM(ERAB_REL_ENB_RNL_RED) ERAB_REL_ENB_RNL_RED,
          SUM(ERAB_REL_ENB_RNL_RRNA) ERAB_REL_ENB_RNL_RRNA,
          SUM(ERAB_REL_HO_PART) ERAB_REL_HO_PART,
          SUM(ERAB_REL_HO_SUCC) ERAB_REL_HO_SUCC,
          SUM(ERAB_REL_ENB_QCI1) ERAB_REL_ENB_QCI1,
          SUM(ERAB_REL_ENB_RNL_INA_QCI1) ERAB_REL_ENB_RNL_INA_QCI1,
          SUM(ERAB_REL_ENB_RNL_RED_QCI1) ERAB_REL_ENB_RNL_RED_QCI1,
          SUM(ERAB_REL_ENB_RNL_RRNA_QCI1) ERAB_REL_ENB_RNL_RRNA_QCI1,
          SUM(ERAB_REL_HO_PART_QCI1) ERAB_REL_HO_PART_QCI1,
          SUM(ERAB_REL_EPC_PATH_SWITCH) ERAB_REL_EPC_PATH_SWITCH,
          SUM(ERAB_REL_EPC_PATH_SWITCH_QCI1) ERAB_REL_EPC_PATH_SWITCH_QCI1,
          SUM(ERAB_REL_TEMP_QCI1) ERAB_REL_TEMP_QCI1
        from    
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lepsb_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129   
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LEPSB2_3020799541
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(HO_INTFREQ_ATT) HO_INTFREQ_ATT,
        SUM(HO_INTFREQ_GAP_ATT) HO_INTFREQ_GAP_ATT,
        SUM(HO_INTFREQ_SUCC) HO_INTFREQ_SUCC,
        SUM(HO_INTFREQ_GAP_SUCC) HO_INTFREQ_GAP_SUCC,
        SUM(HO_LB_ATT) HO_LB_ATT,
        SUM(HO_LB_SUCC) HO_LB_SUCC
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(HO_INTFREQ_ATT) HO_INTFREQ_ATT,
          SUM(HO_INTFREQ_GAP_ATT) HO_INTFREQ_GAP_ATT,
          SUM(HO_INTFREQ_SUCC) HO_INTFREQ_SUCC,
          SUM(HO_INTFREQ_GAP_SUCC) HO_INTFREQ_GAP_SUCC,
          SUM(HO_LB_ATT) HO_LB_ATT,
          SUM(HO_LB_SUCC) HO_LB_SUCC
        from    
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lho_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129   
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LHO2_3053547822
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(INTRA_ENB_HO_PREP) INTRA_ENB_HO_PREP,
        SUM(ATT_INTRA_ENB_HO) ATT_INTRA_ENB_HO,
        SUM(SUCC_INTRA_ENB_HO) SUCC_INTRA_ENB_HO
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(INTRA_ENB_HO_PREP) INTRA_ENB_HO_PREP,
          SUM(ATT_INTRA_ENB_HO) ATT_INTRA_ENB_HO,
          SUM(SUCC_INTRA_ENB_HO) SUCC_INTRA_ENB_HO
        from    
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",      
          noklte_ps_lianbho_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129      
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LIANBHO2_3014993545
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(INTER_ENB_HO_PREP) INTER_ENB_HO_PREP,
        SUM(ATT_INTER_ENB_HO) ATT_INTER_ENB_HO,
        SUM(SUCC_INTER_ENB_HO) SUCC_INTER_ENB_HO,
        SUM(INTER_ENB_S1_HO_PREP) INTER_ENB_S1_HO_PREP,
        SUM(INTER_ENB_S1_HO_ATT) INTER_ENB_S1_HO_ATT,
        SUM(INTER_ENB_S1_HO_SUCC) INTER_ENB_S1_HO_SUCC,
        SUM(INTER_X2_LB_PREP_FAIL_AC) INTER_X2_LB_PREP_FAIL_AC,
        SUM(INTER_S1_LB_PREP_FAIL_AC) INTER_S1_LB_PREP_FAIL_AC
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(INTER_ENB_HO_PREP) INTER_ENB_HO_PREP,
          SUM(ATT_INTER_ENB_HO) ATT_INTER_ENB_HO,
          SUM(SUCC_INTER_ENB_HO) SUCC_INTER_ENB_HO,
          SUM(INTER_ENB_S1_HO_PREP) INTER_ENB_S1_HO_PREP,
          SUM(INTER_ENB_S1_HO_ATT) INTER_ENB_S1_HO_ATT,
          SUM(INTER_ENB_S1_HO_SUCC) INTER_ENB_S1_HO_SUCC,
          SUM(INTER_X2_LB_PREP_FAIL_AC) INTER_X2_LB_PREP_FAIL_AC,
          SUM(INTER_S1_LB_PREP_FAIL_AC) INTER_S1_LB_PREP_FAIL_AC
        from          
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",      
          noklte_ps_lienbho_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129      
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LIENBHO2_3048809523
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(ifInPackets15) ifInPackets15,
        SUM(ifInOctets15) ifInOctets15,
        SUM(ifOutOctets15) ifOutOctets15,
        SUM(ifInErrors15) ifInErrors15
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(ifInPackets15) ifInPackets15,
          SUM(ifInOctets15) ifInOctets15,
          SUM(ifOutOctets15) ifOutOctets15,
          SUM(ifInErrors15) ifInErrors15
        from    
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lip_ippm_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129   
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LIP_ext_3086571968
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(CSFB_REDIR_CR_ATT) CSFB_REDIR_CR_ATT,
        SUM(CSFB_REDIR_CR_CMODE_ATT) CSFB_REDIR_CR_CMODE_ATT,
        SUM(ISYS_HO_PREP) ISYS_HO_PREP,
        SUM(ISYS_HO_ATT) ISYS_HO_ATT,
        SUM(ISYS_HO_SUCC) ISYS_HO_SUCC,
        SUM(ISYS_HO_UTRAN_SRVCC_ATT) ISYS_HO_UTRAN_SRVCC_ATT,
        SUM(ISYS_HO_UTRAN_SRVCC_SUCC) ISYS_HO_UTRAN_SRVCC_SUCC,
        SUM(CSFB_PSHO_UTRAN_ATT) CSFB_PSHO_UTRAN_ATT,
        SUM(ISYS_HO_GERAN_SRVCC_ATT) ISYS_HO_GERAN_SRVCC_ATT,
        SUM(ISYS_HO_GERAN_SRVCC_SUCC) ISYS_HO_GERAN_SRVCC_SUCC
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(CSFB_REDIR_CR_ATT) CSFB_REDIR_CR_ATT,
          SUM(CSFB_REDIR_CR_CMODE_ATT) CSFB_REDIR_CR_CMODE_ATT,
          SUM(ISYS_HO_PREP) ISYS_HO_PREP,
          SUM(ISYS_HO_ATT) ISYS_HO_ATT,
          SUM(ISYS_HO_SUCC) ISYS_HO_SUCC,
          SUM(ISYS_HO_UTRAN_SRVCC_ATT) ISYS_HO_UTRAN_SRVCC_ATT,
          SUM(ISYS_HO_UTRAN_SRVCC_SUCC) ISYS_HO_UTRAN_SRVCC_SUCC,
          SUM(CSFB_PSHO_UTRAN_ATT) CSFB_PSHO_UTRAN_ATT,
          SUM(ISYS_HO_GERAN_SRVCC_ATT) ISYS_HO_GERAN_SRVCC_ATT,
          SUM(ISYS_HO_GERAN_SRVCC_SUCC) ISYS_HO_GERAN_SRVCC_SUCC
        from    
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lisho_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129      
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LISHO2_3016924796
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(RACH_MSG3_CONTENTION) RACH_MSG3_CONTENTION
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(RACH_MSG3_CONTENTION) RACH_MSG3_CONTENTION
        from      
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lmac_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16      
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129   
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LMAC2_3018459747
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(UE_REP_CQI_LEVEL_00) UE_REP_CQI_LEVEL_00,
        SUM(UE_REP_CQI_LEVEL_01) UE_REP_CQI_LEVEL_01,
        SUM(UE_REP_CQI_LEVEL_02) UE_REP_CQI_LEVEL_02,
        SUM(UE_REP_CQI_LEVEL_03) UE_REP_CQI_LEVEL_03,
        SUM(UE_REP_CQI_LEVEL_04) UE_REP_CQI_LEVEL_04,
        SUM(UE_REP_CQI_LEVEL_05) UE_REP_CQI_LEVEL_05,
        SUM(UE_REP_CQI_LEVEL_06) UE_REP_CQI_LEVEL_06,
        SUM(UE_REP_CQI_LEVEL_07) UE_REP_CQI_LEVEL_07,
        SUM(UE_REP_CQI_LEVEL_08) UE_REP_CQI_LEVEL_08,
        SUM(UE_REP_CQI_LEVEL_09) UE_REP_CQI_LEVEL_09,
        SUM(UE_REP_CQI_LEVEL_10) UE_REP_CQI_LEVEL_10,
        SUM(UE_REP_CQI_LEVEL_11) UE_REP_CQI_LEVEL_11,
        SUM(UE_REP_CQI_LEVEL_12) UE_REP_CQI_LEVEL_12,
        SUM(UE_REP_CQI_LEVEL_13) UE_REP_CQI_LEVEL_13,
        SUM(UE_REP_CQI_LEVEL_14) UE_REP_CQI_LEVEL_14,
        SUM(UE_REP_CQI_LEVEL_15) UE_REP_CQI_LEVEL_15,
        AVG(CQI_OFF_MEAN) CQI_OFF_MEAN,
        SUM(UE_256QAM_CONF_CQI_LEVEL_00) UE_256QAM_CONF_CQI_LEVEL_00,
        SUM(UE_256QAM_CONF_CQI_LEVEL_02) UE_256QAM_CONF_CQI_LEVEL_02,
        SUM(UE_256QAM_CONF_CQI_LEVEL_03) UE_256QAM_CONF_CQI_LEVEL_03,
        SUM(UE_256QAM_CONF_CQI_LEVEL_06) UE_256QAM_CONF_CQI_LEVEL_06,
        SUM(UE_256QAM_CONF_CQI_LEVEL_07) UE_256QAM_CONF_CQI_LEVEL_07,
        SUM(UE_256QAM_CONF_CQI_LEVEL_10) UE_256QAM_CONF_CQI_LEVEL_10,
        SUM(UE_256QAM_CONF_CQI_LEVEL_11) UE_256QAM_CONF_CQI_LEVEL_11,
        SUM(UE_256QAM_CONF_CQI_LEVEL_15) UE_256QAM_CONF_CQI_LEVEL_15,
        SUM(UE_256QAM_CONF_CQI_LEVEL_01) UE_256QAM_CONF_CQI_LEVEL_01,
        SUM(UE_256QAM_CONF_CQI_LEVEL_04) UE_256QAM_CONF_CQI_LEVEL_04,
        SUM(UE_256QAM_CONF_CQI_LEVEL_05) UE_256QAM_CONF_CQI_LEVEL_05,
        SUM(UE_256QAM_CONF_CQI_LEVEL_08) UE_256QAM_CONF_CQI_LEVEL_08,
        SUM(UE_256QAM_CONF_CQI_LEVEL_09) UE_256QAM_CONF_CQI_LEVEL_09,
        SUM(UE_256QAM_CONF_CQI_LEVEL_12) UE_256QAM_CONF_CQI_LEVEL_12,
        SUM(UE_256QAM_CONF_CQI_LEVEL_13) UE_256QAM_CONF_CQI_LEVEL_13,
        SUM(UE_256QAM_CONF_CQI_LEVEL_14) UE_256QAM_CONF_CQI_LEVEL_14
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(UE_REP_CQI_LEVEL_00) UE_REP_CQI_LEVEL_00,
          SUM(UE_REP_CQI_LEVEL_01) UE_REP_CQI_LEVEL_01,
          SUM(UE_REP_CQI_LEVEL_02) UE_REP_CQI_LEVEL_02,
          SUM(UE_REP_CQI_LEVEL_03) UE_REP_CQI_LEVEL_03,
          SUM(UE_REP_CQI_LEVEL_04) UE_REP_CQI_LEVEL_04,
          SUM(UE_REP_CQI_LEVEL_05) UE_REP_CQI_LEVEL_05,
          SUM(UE_REP_CQI_LEVEL_06) UE_REP_CQI_LEVEL_06,
          SUM(UE_REP_CQI_LEVEL_07) UE_REP_CQI_LEVEL_07,
          SUM(UE_REP_CQI_LEVEL_08) UE_REP_CQI_LEVEL_08,
          SUM(UE_REP_CQI_LEVEL_09) UE_REP_CQI_LEVEL_09,
          SUM(UE_REP_CQI_LEVEL_10) UE_REP_CQI_LEVEL_10,
          SUM(UE_REP_CQI_LEVEL_11) UE_REP_CQI_LEVEL_11,
          SUM(UE_REP_CQI_LEVEL_12) UE_REP_CQI_LEVEL_12,
          SUM(UE_REP_CQI_LEVEL_13) UE_REP_CQI_LEVEL_13,
          SUM(UE_REP_CQI_LEVEL_14) UE_REP_CQI_LEVEL_14,
          SUM(UE_REP_CQI_LEVEL_15) UE_REP_CQI_LEVEL_15,
          AVG(CQI_OFF_MEAN) CQI_OFF_MEAN,
          SUM(UE_256QAM_CONF_CQI_LEVEL_00) UE_256QAM_CONF_CQI_LEVEL_00,
          SUM(UE_256QAM_CONF_CQI_LEVEL_02) UE_256QAM_CONF_CQI_LEVEL_02,
          SUM(UE_256QAM_CONF_CQI_LEVEL_03) UE_256QAM_CONF_CQI_LEVEL_03,
          SUM(UE_256QAM_CONF_CQI_LEVEL_06) UE_256QAM_CONF_CQI_LEVEL_06,
          SUM(UE_256QAM_CONF_CQI_LEVEL_07) UE_256QAM_CONF_CQI_LEVEL_07,
          SUM(UE_256QAM_CONF_CQI_LEVEL_10) UE_256QAM_CONF_CQI_LEVEL_10,
          SUM(UE_256QAM_CONF_CQI_LEVEL_11) UE_256QAM_CONF_CQI_LEVEL_11,
          SUM(UE_256QAM_CONF_CQI_LEVEL_15) UE_256QAM_CONF_CQI_LEVEL_15,
          SUM(UE_256QAM_CONF_CQI_LEVEL_01) UE_256QAM_CONF_CQI_LEVEL_01,
          SUM(UE_256QAM_CONF_CQI_LEVEL_04) UE_256QAM_CONF_CQI_LEVEL_04,
          SUM(UE_256QAM_CONF_CQI_LEVEL_05) UE_256QAM_CONF_CQI_LEVEL_05,
          SUM(UE_256QAM_CONF_CQI_LEVEL_08) UE_256QAM_CONF_CQI_LEVEL_08,
          SUM(UE_256QAM_CONF_CQI_LEVEL_09) UE_256QAM_CONF_CQI_LEVEL_09,
          SUM(UE_256QAM_CONF_CQI_LEVEL_12) UE_256QAM_CONF_CQI_LEVEL_12,
          SUM(UE_256QAM_CONF_CQI_LEVEL_13) UE_256QAM_CONF_CQI_LEVEL_13,
          SUM(UE_256QAM_CONF_CQI_LEVEL_14) UE_256QAM_CONF_CQI_LEVEL_14
        from          
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",
          noklte_ps_lpqdl_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LPQDL2_3023667028
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(RSSI_PUCCH_LEVEL_01) RSSI_PUCCH_LEVEL_01,
        SUM(RSSI_PUCCH_LEVEL_02) RSSI_PUCCH_LEVEL_02,
        SUM(RSSI_PUCCH_LEVEL_03) RSSI_PUCCH_LEVEL_03,
        SUM(RSSI_PUCCH_LEVEL_04) RSSI_PUCCH_LEVEL_04,
        SUM(RSSI_PUCCH_LEVEL_05) RSSI_PUCCH_LEVEL_05,
        SUM(RSSI_PUCCH_LEVEL_06) RSSI_PUCCH_LEVEL_06,
        SUM(RSSI_PUCCH_LEVEL_07) RSSI_PUCCH_LEVEL_07,
        SUM(RSSI_PUCCH_LEVEL_08) RSSI_PUCCH_LEVEL_08,
        SUM(RSSI_PUCCH_LEVEL_09) RSSI_PUCCH_LEVEL_09,
        SUM(RSSI_PUCCH_LEVEL_10) RSSI_PUCCH_LEVEL_10,
        SUM(RSSI_PUCCH_LEVEL_11) RSSI_PUCCH_LEVEL_11,
        SUM(RSSI_PUCCH_LEVEL_12) RSSI_PUCCH_LEVEL_12,
        SUM(RSSI_PUCCH_LEVEL_13) RSSI_PUCCH_LEVEL_13,
        SUM(RSSI_PUCCH_LEVEL_14) RSSI_PUCCH_LEVEL_14,
        SUM(RSSI_PUCCH_LEVEL_15) RSSI_PUCCH_LEVEL_15,
        SUM(RSSI_PUCCH_LEVEL_16) RSSI_PUCCH_LEVEL_16,
        SUM(RSSI_PUCCH_LEVEL_17) RSSI_PUCCH_LEVEL_17,
        SUM(RSSI_PUCCH_LEVEL_18) RSSI_PUCCH_LEVEL_18,
        SUM(RSSI_PUCCH_LEVEL_19) RSSI_PUCCH_LEVEL_19,
        SUM(RSSI_PUCCH_LEVEL_20) RSSI_PUCCH_LEVEL_20,
        SUM(RSSI_PUCCH_LEVEL_21) RSSI_PUCCH_LEVEL_21,
        SUM(RSSI_PUCCH_LEVEL_22) RSSI_PUCCH_LEVEL_22,
        SUM(RSSI_PUSCH_LEVEL_01) RSSI_PUSCH_LEVEL_01,
        SUM(RSSI_PUSCH_LEVEL_02) RSSI_PUSCH_LEVEL_02,
        SUM(RSSI_PUSCH_LEVEL_03) RSSI_PUSCH_LEVEL_03,
        SUM(RSSI_PUSCH_LEVEL_04) RSSI_PUSCH_LEVEL_04,
        SUM(RSSI_PUSCH_LEVEL_05) RSSI_PUSCH_LEVEL_05,
        SUM(RSSI_PUSCH_LEVEL_06) RSSI_PUSCH_LEVEL_06,
        SUM(RSSI_PUSCH_LEVEL_07) RSSI_PUSCH_LEVEL_07,
        SUM(RSSI_PUSCH_LEVEL_08) RSSI_PUSCH_LEVEL_08,
        SUM(RSSI_PUSCH_LEVEL_09) RSSI_PUSCH_LEVEL_09,
        SUM(RSSI_PUSCH_LEVEL_10) RSSI_PUSCH_LEVEL_10,
        SUM(RSSI_PUSCH_LEVEL_11) RSSI_PUSCH_LEVEL_11,
        SUM(RSSI_PUSCH_LEVEL_12) RSSI_PUSCH_LEVEL_12,
        SUM(RSSI_PUSCH_LEVEL_13) RSSI_PUSCH_LEVEL_13,
        SUM(RSSI_PUSCH_LEVEL_14) RSSI_PUSCH_LEVEL_14,
        SUM(RSSI_PUSCH_LEVEL_15) RSSI_PUSCH_LEVEL_15,
        SUM(RSSI_PUSCH_LEVEL_16) RSSI_PUSCH_LEVEL_16,
        SUM(RSSI_PUSCH_LEVEL_17) RSSI_PUSCH_LEVEL_17,
        SUM(RSSI_PUSCH_LEVEL_18) RSSI_PUSCH_LEVEL_18,
        SUM(RSSI_PUSCH_LEVEL_19) RSSI_PUSCH_LEVEL_19,
        SUM(RSSI_PUSCH_LEVEL_20) RSSI_PUSCH_LEVEL_20,
        SUM(RSSI_PUSCH_LEVEL_21) RSSI_PUSCH_LEVEL_21,
        SUM(RSSI_PUSCH_LEVEL_22) RSSI_PUSCH_LEVEL_22,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL1) UE_PWR_HEADROOM_PUSCH_LEVEL1,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL2) UE_PWR_HEADROOM_PUSCH_LEVEL2,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL3) UE_PWR_HEADROOM_PUSCH_LEVEL3,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL4) UE_PWR_HEADROOM_PUSCH_LEVEL4,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL5) UE_PWR_HEADROOM_PUSCH_LEVEL5,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL6) UE_PWR_HEADROOM_PUSCH_LEVEL6,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL7) UE_PWR_HEADROOM_PUSCH_LEVEL7,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL8) UE_PWR_HEADROOM_PUSCH_LEVEL8,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL9) UE_PWR_HEADROOM_PUSCH_LEVEL9,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL10) UE_PWR_HEADROOM_PUSCH_LEVEL10,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL11) UE_PWR_HEADROOM_PUSCH_LEVEL11,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL12) UE_PWR_HEADROOM_PUSCH_LEVEL12,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL13) UE_PWR_HEADROOM_PUSCH_LEVEL13,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL14) UE_PWR_HEADROOM_PUSCH_LEVEL14,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL15) UE_PWR_HEADROOM_PUSCH_LEVEL15,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL16) UE_PWR_HEADROOM_PUSCH_LEVEL16,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL17) UE_PWR_HEADROOM_PUSCH_LEVEL17,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL18) UE_PWR_HEADROOM_PUSCH_LEVEL18,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL19) UE_PWR_HEADROOM_PUSCH_LEVEL19,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL20) UE_PWR_HEADROOM_PUSCH_LEVEL20,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL21) UE_PWR_HEADROOM_PUSCH_LEVEL21,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL22) UE_PWR_HEADROOM_PUSCH_LEVEL22,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL23) UE_PWR_HEADROOM_PUSCH_LEVEL23,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL24) UE_PWR_HEADROOM_PUSCH_LEVEL24,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL25) UE_PWR_HEADROOM_PUSCH_LEVEL25,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL26) UE_PWR_HEADROOM_PUSCH_LEVEL26,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL27) UE_PWR_HEADROOM_PUSCH_LEVEL27,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL28) UE_PWR_HEADROOM_PUSCH_LEVEL28,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL29) UE_PWR_HEADROOM_PUSCH_LEVEL29,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL30) UE_PWR_HEADROOM_PUSCH_LEVEL30,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL31) UE_PWR_HEADROOM_PUSCH_LEVEL31,
        SUM(UE_PWR_HEADROOM_PUSCH_LEVEL32) UE_PWR_HEADROOM_PUSCH_LEVEL32,
        SUM(SINR_PUCCH_LEVEL_1) SINR_PUCCH_LEVEL_1,
        SUM(SINR_PUCCH_LEVEL_2) SINR_PUCCH_LEVEL_2,
        SUM(SINR_PUCCH_LEVEL_3) SINR_PUCCH_LEVEL_3,
        SUM(SINR_PUCCH_LEVEL_4) SINR_PUCCH_LEVEL_4,
        SUM(SINR_PUCCH_LEVEL_5) SINR_PUCCH_LEVEL_5,
        SUM(SINR_PUCCH_LEVEL_6) SINR_PUCCH_LEVEL_6,
        SUM(SINR_PUCCH_LEVEL_7) SINR_PUCCH_LEVEL_7,
        SUM(SINR_PUCCH_LEVEL_8) SINR_PUCCH_LEVEL_8,
        SUM(SINR_PUCCH_LEVEL_9) SINR_PUCCH_LEVEL_9,
        SUM(SINR_PUCCH_LEVEL_10) SINR_PUCCH_LEVEL_10,
        SUM(SINR_PUCCH_LEVEL_11) SINR_PUCCH_LEVEL_11,
        SUM(SINR_PUCCH_LEVEL_12) SINR_PUCCH_LEVEL_12,
        SUM(SINR_PUCCH_LEVEL_13) SINR_PUCCH_LEVEL_13,
        SUM(SINR_PUCCH_LEVEL_14) SINR_PUCCH_LEVEL_14,
        SUM(SINR_PUCCH_LEVEL_15) SINR_PUCCH_LEVEL_15,
        SUM(SINR_PUCCH_LEVEL_16) SINR_PUCCH_LEVEL_16,
        SUM(SINR_PUCCH_LEVEL_17) SINR_PUCCH_LEVEL_17,
        SUM(SINR_PUCCH_LEVEL_18) SINR_PUCCH_LEVEL_18,
        SUM(SINR_PUCCH_LEVEL_19) SINR_PUCCH_LEVEL_19,
        SUM(SINR_PUCCH_LEVEL_20) SINR_PUCCH_LEVEL_20,
        SUM(SINR_PUCCH_LEVEL_21) SINR_PUCCH_LEVEL_21,
        SUM(SINR_PUCCH_LEVEL_22) SINR_PUCCH_LEVEL_22,
        SUM(SINR_PUSCH_LEVEL_1) SINR_PUSCH_LEVEL_1,
        SUM(SINR_PUSCH_LEVEL_2) SINR_PUSCH_LEVEL_2,
        SUM(SINR_PUSCH_LEVEL_3) SINR_PUSCH_LEVEL_3,
        SUM(SINR_PUSCH_LEVEL_4) SINR_PUSCH_LEVEL_4,
        SUM(SINR_PUSCH_LEVEL_5) SINR_PUSCH_LEVEL_5,
        SUM(SINR_PUSCH_LEVEL_6) SINR_PUSCH_LEVEL_6,
        SUM(SINR_PUSCH_LEVEL_7) SINR_PUSCH_LEVEL_7,
        SUM(SINR_PUSCH_LEVEL_8) SINR_PUSCH_LEVEL_8,
        SUM(SINR_PUSCH_LEVEL_9) SINR_PUSCH_LEVEL_9,
        SUM(SINR_PUSCH_LEVEL_10) SINR_PUSCH_LEVEL_10,
        SUM(SINR_PUSCH_LEVEL_11) SINR_PUSCH_LEVEL_11,
        SUM(SINR_PUSCH_LEVEL_12) SINR_PUSCH_LEVEL_12,
        SUM(SINR_PUSCH_LEVEL_13) SINR_PUSCH_LEVEL_13,
        SUM(SINR_PUSCH_LEVEL_14) SINR_PUSCH_LEVEL_14,
        SUM(SINR_PUSCH_LEVEL_15) SINR_PUSCH_LEVEL_15,
        SUM(SINR_PUSCH_LEVEL_16) SINR_PUSCH_LEVEL_16,
        SUM(SINR_PUSCH_LEVEL_17) SINR_PUSCH_LEVEL_17,
        SUM(SINR_PUSCH_LEVEL_18) SINR_PUSCH_LEVEL_18,
        SUM(SINR_PUSCH_LEVEL_19) SINR_PUSCH_LEVEL_19,
        SUM(SINR_PUSCH_LEVEL_20) SINR_PUSCH_LEVEL_20,
        SUM(SINR_PUSCH_LEVEL_21) SINR_PUSCH_LEVEL_21,
        SUM(SINR_PUSCH_LEVEL_22) SINR_PUSCH_LEVEL_22
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(RSSI_PUCCH_LEVEL_01) RSSI_PUCCH_LEVEL_01,
          SUM(RSSI_PUCCH_LEVEL_02) RSSI_PUCCH_LEVEL_02,
          SUM(RSSI_PUCCH_LEVEL_03) RSSI_PUCCH_LEVEL_03,
          SUM(RSSI_PUCCH_LEVEL_04) RSSI_PUCCH_LEVEL_04,
          SUM(RSSI_PUCCH_LEVEL_05) RSSI_PUCCH_LEVEL_05,
          SUM(RSSI_PUCCH_LEVEL_06) RSSI_PUCCH_LEVEL_06,
          SUM(RSSI_PUCCH_LEVEL_07) RSSI_PUCCH_LEVEL_07,
          SUM(RSSI_PUCCH_LEVEL_08) RSSI_PUCCH_LEVEL_08,
          SUM(RSSI_PUCCH_LEVEL_09) RSSI_PUCCH_LEVEL_09,
          SUM(RSSI_PUCCH_LEVEL_10) RSSI_PUCCH_LEVEL_10,
          SUM(RSSI_PUCCH_LEVEL_11) RSSI_PUCCH_LEVEL_11,
          SUM(RSSI_PUCCH_LEVEL_12) RSSI_PUCCH_LEVEL_12,
          SUM(RSSI_PUCCH_LEVEL_13) RSSI_PUCCH_LEVEL_13,
          SUM(RSSI_PUCCH_LEVEL_14) RSSI_PUCCH_LEVEL_14,
          SUM(RSSI_PUCCH_LEVEL_15) RSSI_PUCCH_LEVEL_15,
          SUM(RSSI_PUCCH_LEVEL_16) RSSI_PUCCH_LEVEL_16,
          SUM(RSSI_PUCCH_LEVEL_17) RSSI_PUCCH_LEVEL_17,
          SUM(RSSI_PUCCH_LEVEL_18) RSSI_PUCCH_LEVEL_18,
          SUM(RSSI_PUCCH_LEVEL_19) RSSI_PUCCH_LEVEL_19,
          SUM(RSSI_PUCCH_LEVEL_20) RSSI_PUCCH_LEVEL_20,
          SUM(RSSI_PUCCH_LEVEL_21) RSSI_PUCCH_LEVEL_21,
          SUM(RSSI_PUCCH_LEVEL_22) RSSI_PUCCH_LEVEL_22,
          SUM(RSSI_PUSCH_LEVEL_01) RSSI_PUSCH_LEVEL_01,
          SUM(RSSI_PUSCH_LEVEL_02) RSSI_PUSCH_LEVEL_02,
          SUM(RSSI_PUSCH_LEVEL_03) RSSI_PUSCH_LEVEL_03,
          SUM(RSSI_PUSCH_LEVEL_04) RSSI_PUSCH_LEVEL_04,
          SUM(RSSI_PUSCH_LEVEL_05) RSSI_PUSCH_LEVEL_05,
          SUM(RSSI_PUSCH_LEVEL_06) RSSI_PUSCH_LEVEL_06,
          SUM(RSSI_PUSCH_LEVEL_07) RSSI_PUSCH_LEVEL_07,
          SUM(RSSI_PUSCH_LEVEL_08) RSSI_PUSCH_LEVEL_08,
          SUM(RSSI_PUSCH_LEVEL_09) RSSI_PUSCH_LEVEL_09,
          SUM(RSSI_PUSCH_LEVEL_10) RSSI_PUSCH_LEVEL_10,
          SUM(RSSI_PUSCH_LEVEL_11) RSSI_PUSCH_LEVEL_11,
          SUM(RSSI_PUSCH_LEVEL_12) RSSI_PUSCH_LEVEL_12,
          SUM(RSSI_PUSCH_LEVEL_13) RSSI_PUSCH_LEVEL_13,
          SUM(RSSI_PUSCH_LEVEL_14) RSSI_PUSCH_LEVEL_14,
          SUM(RSSI_PUSCH_LEVEL_15) RSSI_PUSCH_LEVEL_15,
          SUM(RSSI_PUSCH_LEVEL_16) RSSI_PUSCH_LEVEL_16,
          SUM(RSSI_PUSCH_LEVEL_17) RSSI_PUSCH_LEVEL_17,
          SUM(RSSI_PUSCH_LEVEL_18) RSSI_PUSCH_LEVEL_18,
          SUM(RSSI_PUSCH_LEVEL_19) RSSI_PUSCH_LEVEL_19,
          SUM(RSSI_PUSCH_LEVEL_20) RSSI_PUSCH_LEVEL_20,
          SUM(RSSI_PUSCH_LEVEL_21) RSSI_PUSCH_LEVEL_21,
          SUM(RSSI_PUSCH_LEVEL_22) RSSI_PUSCH_LEVEL_22,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL1) UE_PWR_HEADROOM_PUSCH_LEVEL1,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL2) UE_PWR_HEADROOM_PUSCH_LEVEL2,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL3) UE_PWR_HEADROOM_PUSCH_LEVEL3,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL4) UE_PWR_HEADROOM_PUSCH_LEVEL4,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL5) UE_PWR_HEADROOM_PUSCH_LEVEL5,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL6) UE_PWR_HEADROOM_PUSCH_LEVEL6,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL7) UE_PWR_HEADROOM_PUSCH_LEVEL7,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL8) UE_PWR_HEADROOM_PUSCH_LEVEL8,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL9) UE_PWR_HEADROOM_PUSCH_LEVEL9,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL10) UE_PWR_HEADROOM_PUSCH_LEVEL10,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL11) UE_PWR_HEADROOM_PUSCH_LEVEL11,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL12) UE_PWR_HEADROOM_PUSCH_LEVEL12,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL13) UE_PWR_HEADROOM_PUSCH_LEVEL13,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL14) UE_PWR_HEADROOM_PUSCH_LEVEL14,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL15) UE_PWR_HEADROOM_PUSCH_LEVEL15,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL16) UE_PWR_HEADROOM_PUSCH_LEVEL16,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL17) UE_PWR_HEADROOM_PUSCH_LEVEL17,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL18) UE_PWR_HEADROOM_PUSCH_LEVEL18,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL19) UE_PWR_HEADROOM_PUSCH_LEVEL19,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL20) UE_PWR_HEADROOM_PUSCH_LEVEL20,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL21) UE_PWR_HEADROOM_PUSCH_LEVEL21,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL22) UE_PWR_HEADROOM_PUSCH_LEVEL22,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL23) UE_PWR_HEADROOM_PUSCH_LEVEL23,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL24) UE_PWR_HEADROOM_PUSCH_LEVEL24,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL25) UE_PWR_HEADROOM_PUSCH_LEVEL25,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL26) UE_PWR_HEADROOM_PUSCH_LEVEL26,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL27) UE_PWR_HEADROOM_PUSCH_LEVEL27,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL28) UE_PWR_HEADROOM_PUSCH_LEVEL28,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL29) UE_PWR_HEADROOM_PUSCH_LEVEL29,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL30) UE_PWR_HEADROOM_PUSCH_LEVEL30,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL31) UE_PWR_HEADROOM_PUSCH_LEVEL31,
          SUM(UE_PWR_HEADROOM_PUSCH_LEVEL32) UE_PWR_HEADROOM_PUSCH_LEVEL32,
          SUM(SINR_PUCCH_LEVEL_1) SINR_PUCCH_LEVEL_1,
          SUM(SINR_PUCCH_LEVEL_2) SINR_PUCCH_LEVEL_2,
          SUM(SINR_PUCCH_LEVEL_3) SINR_PUCCH_LEVEL_3,
          SUM(SINR_PUCCH_LEVEL_4) SINR_PUCCH_LEVEL_4,
          SUM(SINR_PUCCH_LEVEL_5) SINR_PUCCH_LEVEL_5,
          SUM(SINR_PUCCH_LEVEL_6) SINR_PUCCH_LEVEL_6,
          SUM(SINR_PUCCH_LEVEL_7) SINR_PUCCH_LEVEL_7,
          SUM(SINR_PUCCH_LEVEL_8) SINR_PUCCH_LEVEL_8,
          SUM(SINR_PUCCH_LEVEL_9) SINR_PUCCH_LEVEL_9,
          SUM(SINR_PUCCH_LEVEL_10) SINR_PUCCH_LEVEL_10,
          SUM(SINR_PUCCH_LEVEL_11) SINR_PUCCH_LEVEL_11,
          SUM(SINR_PUCCH_LEVEL_12) SINR_PUCCH_LEVEL_12,
          SUM(SINR_PUCCH_LEVEL_13) SINR_PUCCH_LEVEL_13,
          SUM(SINR_PUCCH_LEVEL_14) SINR_PUCCH_LEVEL_14,
          SUM(SINR_PUCCH_LEVEL_15) SINR_PUCCH_LEVEL_15,
          SUM(SINR_PUCCH_LEVEL_16) SINR_PUCCH_LEVEL_16,
          SUM(SINR_PUCCH_LEVEL_17) SINR_PUCCH_LEVEL_17,
          SUM(SINR_PUCCH_LEVEL_18) SINR_PUCCH_LEVEL_18,
          SUM(SINR_PUCCH_LEVEL_19) SINR_PUCCH_LEVEL_19,
          SUM(SINR_PUCCH_LEVEL_20) SINR_PUCCH_LEVEL_20,
          SUM(SINR_PUCCH_LEVEL_21) SINR_PUCCH_LEVEL_21,
          SUM(SINR_PUCCH_LEVEL_22) SINR_PUCCH_LEVEL_22,
          SUM(SINR_PUSCH_LEVEL_1) SINR_PUSCH_LEVEL_1,
          SUM(SINR_PUSCH_LEVEL_2) SINR_PUSCH_LEVEL_2,
          SUM(SINR_PUSCH_LEVEL_3) SINR_PUSCH_LEVEL_3,
          SUM(SINR_PUSCH_LEVEL_4) SINR_PUSCH_LEVEL_4,
          SUM(SINR_PUSCH_LEVEL_5) SINR_PUSCH_LEVEL_5,
          SUM(SINR_PUSCH_LEVEL_6) SINR_PUSCH_LEVEL_6,
          SUM(SINR_PUSCH_LEVEL_7) SINR_PUSCH_LEVEL_7,
          SUM(SINR_PUSCH_LEVEL_8) SINR_PUSCH_LEVEL_8,
          SUM(SINR_PUSCH_LEVEL_9) SINR_PUSCH_LEVEL_9,
          SUM(SINR_PUSCH_LEVEL_10) SINR_PUSCH_LEVEL_10,
          SUM(SINR_PUSCH_LEVEL_11) SINR_PUSCH_LEVEL_11,
          SUM(SINR_PUSCH_LEVEL_12) SINR_PUSCH_LEVEL_12,
          SUM(SINR_PUSCH_LEVEL_13) SINR_PUSCH_LEVEL_13,
          SUM(SINR_PUSCH_LEVEL_14) SINR_PUSCH_LEVEL_14,
          SUM(SINR_PUSCH_LEVEL_15) SINR_PUSCH_LEVEL_15,
          SUM(SINR_PUSCH_LEVEL_16) SINR_PUSCH_LEVEL_16,
          SUM(SINR_PUSCH_LEVEL_17) SINR_PUSCH_LEVEL_17,
          SUM(SINR_PUSCH_LEVEL_18) SINR_PUSCH_LEVEL_18,
          SUM(SINR_PUSCH_LEVEL_19) SINR_PUSCH_LEVEL_19,
          SUM(SINR_PUSCH_LEVEL_20) SINR_PUSCH_LEVEL_20,
          SUM(SINR_PUSCH_LEVEL_21) SINR_PUSCH_LEVEL_21,
          SUM(SINR_PUSCH_LEVEL_22) SINR_PUSCH_LEVEL_22
        from    
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lpqul_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129      
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LPQUL2_3051207215
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        AVG(HARQ_DURATION_QCI1_AVG) HARQ_DURATION_QCI1_AVG,
        AVG(HARQ_DURATION_QCI2_AVG) HARQ_DURATION_QCI2_AVG,
        AVG(HARQ_DURATION_QCI3_AVG) HARQ_DURATION_QCI3_AVG,
        AVG(HARQ_DURATION_QCI4_AVG) HARQ_DURATION_QCI4_AVG,
        AVG(HARQ_DURATION_QCI5_AVG) HARQ_DURATION_QCI5_AVG,
        AVG(HARQ_DURATION_QCI6_AVG) HARQ_DURATION_QCI6_AVG,
        AVG(HARQ_DURATION_QCI7_AVG) HARQ_DURATION_QCI7_AVG,
        AVG(HARQ_DURATION_QCI8_AVG) HARQ_DURATION_QCI8_AVG,
        AVG(HARQ_DURATION_QCI9_AVG) HARQ_DURATION_QCI9_AVG
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          AVG(HARQ_DURATION_QCI1_AVG) HARQ_DURATION_QCI1_AVG,
          AVG(HARQ_DURATION_QCI2_AVG) HARQ_DURATION_QCI2_AVG,
          AVG(HARQ_DURATION_QCI3_AVG) HARQ_DURATION_QCI3_AVG,
          AVG(HARQ_DURATION_QCI4_AVG) HARQ_DURATION_QCI4_AVG,
          AVG(HARQ_DURATION_QCI5_AVG) HARQ_DURATION_QCI5_AVG,
          AVG(HARQ_DURATION_QCI6_AVG) HARQ_DURATION_QCI6_AVG,
          AVG(HARQ_DURATION_QCI7_AVG) HARQ_DURATION_QCI7_AVG,
          AVG(HARQ_DURATION_QCI8_AVG) HARQ_DURATION_QCI8_AVG,
          AVG(HARQ_DURATION_QCI9_AVG) HARQ_DURATION_QCI9_AVG
        from    
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lqos_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129      
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LQOS2_3089065309
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(DATA_RB_STP_ATT) DATA_RB_STP_ATT,
        SUM(DATA_RB_STP_COMP) DATA_RB_STP_COMP
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(DATA_RB_STP_ATT) DATA_RB_STP_ATT,
          SUM(DATA_RB_STP_COMP) DATA_RB_STP_COMP
        from    
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lrdb_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16
          
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129
        
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LRDB2_3011962090
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(RRC_CON_RE_ESTAB_ATT) RRC_CON_RE_ESTAB_ATT,
        SUM(RRC_CON_RE_ESTAB_SUCC) RRC_CON_RE_ESTAB_SUCC
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(RRC_CON_RE_ESTAB_ATT) RRC_CON_RE_ESTAB_ATT,
          SUM(RRC_CON_RE_ESTAB_SUCC) RRC_CON_RE_ESTAB_SUCC
        from          
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",      
          noklte_ps_lrrc_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16
          
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
      ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LRRC2_3074057694
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(S1_SETUP_ATT) S1_SETUP_ATT,
        SUM(S1_SETUP_SUCC) S1_SETUP_SUCC
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(S1_SETUP_ATT) S1_SETUP_ATT,
          SUM(S1_SETUP_SUCC) S1_SETUP_SUCC
        from    
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_ls1ap_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129   
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LS1AP2_305409851
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(DENOM_RRC_CONNECTED_UE) DENOM_RRC_CONNECTED_UE,
        SUM(SUM_RRC_CONNECTED_UE) SUM_RRC_CONNECTED_UE,
        AVG(CA_2SCELLS_ACT_UE_AVG) CA_2SCELLS_ACT_UE_AVG,
        AVG(CA_SCELL_ACT_UE_AVG) CA_SCELL_ACT_UE_AVG,
        SUM(DENOM_ACT_UE_DATA_DL) DENOM_ACT_UE_DATA_DL,
        SUM(DENOM_ACT_UE_DATA_UL) DENOM_ACT_UE_DATA_UL,
        MAX(DL_UE_DATA_BUFFER_MAX) DL_UE_DATA_BUFFER_MAX,
        SUM(SUM_ACT_UE_DATA_DL) SUM_ACT_UE_DATA_DL,
        SUM(SUM_ACT_UE_DATA_UL) SUM_ACT_UE_DATA_UL,
        AVG(UE_DRB_BUF_DL_DATA_QCI_1) UE_DRB_BUF_DL_DATA_QCI_1,
        AVG(UE_DRB_BUF_UL_DATA_QCI_1) UE_DRB_BUF_UL_DATA_QCI_1,
        MAX(UL_UE_DATA_BUFFER_MAX) UL_UE_DATA_BUFFER_MAX,
        AVG(CA_DL_CAP_UE_2CC_AVG) CA_DL_CAP_UE_2CC_AVG,
        AVG(CA_DL_CAPAB_UE_3CC_AVG) CA_DL_CAPAB_UE_3CC_AVG
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(DENOM_RRC_CONNECTED_UE) DENOM_RRC_CONNECTED_UE,
          SUM(SUM_RRC_CONNECTED_UE) SUM_RRC_CONNECTED_UE,
          AVG(CA_2SCELLS_ACT_UE_AVG) CA_2SCELLS_ACT_UE_AVG,
          AVG(CA_SCELL_ACT_UE_AVG) CA_SCELL_ACT_UE_AVG,
          SUM(DENOM_ACT_UE_DATA_DL) DENOM_ACT_UE_DATA_DL,
          SUM(DENOM_ACT_UE_DATA_UL) DENOM_ACT_UE_DATA_UL,
          MAX(DL_UE_DATA_BUFFER_MAX) DL_UE_DATA_BUFFER_MAX,
          SUM(SUM_ACT_UE_DATA_DL) SUM_ACT_UE_DATA_DL,
          SUM(SUM_ACT_UE_DATA_UL) SUM_ACT_UE_DATA_UL,
          AVG(UE_DRB_BUF_DL_DATA_QCI_1) UE_DRB_BUF_DL_DATA_QCI_1,
          AVG(UE_DRB_BUF_UL_DATA_QCI_1) UE_DRB_BUF_UL_DATA_QCI_1,
          MAX(UL_UE_DATA_BUFFER_MAX) UL_UE_DATA_BUFFER_MAX,
          AVG(CA_DL_CAP_UE_2CC_AVG) CA_DL_CAP_UE_2CC_AVG,
          AVG(CA_DL_CAPAB_UE_3CC_AVG) CA_DL_CAPAB_UE_3CC_AVG
        from
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",   
          noklte_ps_lueq_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16    
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129   
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
      ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LUEQ_ext_306771304
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(SIGN_CONN_ESTAB_COMP) SIGN_CONN_ESTAB_COMP,
        SUM(EPC_INIT_TO_IDLE_UE_NORM_REL) EPC_INIT_TO_IDLE_UE_NORM_REL,
        SUM(EPC_INIT_TO_IDLE_DETACH) EPC_INIT_TO_IDLE_DETACH,
        SUM(EPC_INIT_TO_IDLE_RNL) EPC_INIT_TO_IDLE_RNL,
        SUM(EPC_INIT_TO_IDLE_OTHER) EPC_INIT_TO_IDLE_OTHER,
        SUM(ENB_INIT_TO_IDLE_NORM_REL) ENB_INIT_TO_IDLE_NORM_REL,
        SUM(ENB_INIT_TO_IDLE_RNL) ENB_INIT_TO_IDLE_RNL,
        SUM(ENB_INIT_TO_IDLE_OTHER) ENB_INIT_TO_IDLE_OTHER,
        SUM(SIGN_CONN_ESTAB_ATT_MO_S) SIGN_CONN_ESTAB_ATT_MO_S,
        SUM(SIGN_CONN_ESTAB_ATT_MT) SIGN_CONN_ESTAB_ATT_MT,
        SUM(SIGN_CONN_ESTAB_ATT_MO_D) SIGN_CONN_ESTAB_ATT_MO_D,
        SUM(SIGN_CONN_ESTAB_ATT_OTHERS) SIGN_CONN_ESTAB_ATT_OTHERS,
        SUM(SIGN_CONN_ESTAB_ATT_EMG) SIGN_CONN_ESTAB_ATT_EMG,
        SUM(PRE_EMPT_UE_CONTEXT_NON_GBR) PRE_EMPT_UE_CONTEXT_NON_GBR,
        SUM(SIGN_CONN_ESTAB_ATT_HIPRIO) SIGN_CONN_ESTAB_ATT_HIPRIO,
        SUM(SIGN_CONN_ESTAB_ATT_DEL_TOL) SIGN_CONN_ESTAB_ATT_DEL_TOL,
        SUM(S1_SIGN_CONN_ESTAB_ATT_UE) S1_SIGN_CONN_ESTAB_ATT_UE,
        SUM(S1_SIGN_CONN_ESTAB_SUCC_UE) S1_SIGN_CONN_ESTAB_SUCC_UE
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(SIGN_CONN_ESTAB_COMP) SIGN_CONN_ESTAB_COMP,
          SUM(EPC_INIT_TO_IDLE_UE_NORM_REL) EPC_INIT_TO_IDLE_UE_NORM_REL,
          SUM(EPC_INIT_TO_IDLE_DETACH) EPC_INIT_TO_IDLE_DETACH,
          SUM(EPC_INIT_TO_IDLE_RNL) EPC_INIT_TO_IDLE_RNL,
          SUM(EPC_INIT_TO_IDLE_OTHER) EPC_INIT_TO_IDLE_OTHER,
          SUM(ENB_INIT_TO_IDLE_NORM_REL) ENB_INIT_TO_IDLE_NORM_REL,
          SUM(ENB_INIT_TO_IDLE_RNL) ENB_INIT_TO_IDLE_RNL,
          SUM(ENB_INIT_TO_IDLE_OTHER) ENB_INIT_TO_IDLE_OTHER,
          SUM(SIGN_CONN_ESTAB_ATT_MO_S) SIGN_CONN_ESTAB_ATT_MO_S,
          SUM(SIGN_CONN_ESTAB_ATT_MT) SIGN_CONN_ESTAB_ATT_MT,
          SUM(SIGN_CONN_ESTAB_ATT_MO_D) SIGN_CONN_ESTAB_ATT_MO_D,
          SUM(SIGN_CONN_ESTAB_ATT_OTHERS) SIGN_CONN_ESTAB_ATT_OTHERS,
          SUM(SIGN_CONN_ESTAB_ATT_EMG) SIGN_CONN_ESTAB_ATT_EMG,
          SUM(PRE_EMPT_UE_CONTEXT_NON_GBR) PRE_EMPT_UE_CONTEXT_NON_GBR,
          SUM(SIGN_CONN_ESTAB_ATT_HIPRIO) SIGN_CONN_ESTAB_ATT_HIPRIO,
          SUM(SIGN_CONN_ESTAB_ATT_DEL_TOL) SIGN_CONN_ESTAB_ATT_DEL_TOL,
          SUM(S1_SIGN_CONN_ESTAB_ATT_UE) S1_SIGN_CONN_ESTAB_ATT_UE,
          SUM(S1_SIGN_CONN_ESTAB_SUCC_UE) S1_SIGN_CONN_ESTAB_SUCC_UE
        from
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",
          noklte_ps_luest_lnbts_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16
          
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129   
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LUEST2_3098061694
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        a.period_start_time,
        a.plmn_gid,
        SUM(ifInPackets15) ifInPackets15,
        SUM(ifInOctets15) ifInOctets15,
        SUM(ifOutOctets15) ifOutOctets15,
        SUM(ifInErrors15) ifInErrors15
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(ifInPackets15) ifInPackets15,
          SUM(ifInOctets15) ifInOctets15,
          SUM(ifOutOctets15) ifOutOctets15,
          SUM(ifInErrors15) ifInErrors15
        from          
          utp_common_objects "plmn",
          utp_common_objects "vloflnbtsparent",
          utp_common_objects "lnbts",
          noklte_ps_lvlip_ippm1_day p
        where
          "plmn".co_gid in ( '100000' ) 
          and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
          and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
          and "plmn".co_oc_id = 16
          
          and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
          and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
          and "lnbts".co_gid = p.lnbts_id
          and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
          and "lnbts".co_oc_id = 3129
        group by
          trunc( p.period_start_time, 'dd' ),
          "plmn".co_gid,
          "vloflnbtsparent".co_gid,
          "lnbts".co_gid
        ) a
      group by
        a.period_start_time,
        a.plmn_gid
      ) jf_LVLIP_ext_3040126691
    )
  UNION
    (
    select
      period_start_time, TO_CHAR(plmn_gid) plmn_gid
    from
      (
      select
        trunc( p.period_start_time, 'dd' ) period_start_time,
        "plmn".co_gid plmn_gid,
        COUNT(DISTINCT MRBTS_ID) MRBTS_COUNT,
        COUNT(DISTINCT LNBTS_ID) LNBTS_COUNT,
        COUNT(DISTINCT LNCEL_ID) LNCEL_COUNT
      from  
        utp_common_objects "plmn",
        utp_common_objects "vloflnbtsparent",
        utp_common_objects "lnbts", 
        noklte_ps_lrdb_lncel_day p
      where
        "plmn".co_gid in ( '100000' ) 
        and period_start_time >= to_date(&start, 'yyyy/mm/dd hh24:mi:ss')
        and period_start_time < to_date(&end, 'yyyy/mm/dd hh24:mi:ss')
        and "plmn".co_oc_id = 16
        
        and "vloflnbtsparent".co_parent_gid = "plmn".co_gid
        and ( "vloflnbtsparent".co_oc_id = 3128 or "vloflnbtsparent".co_oc_id = 739 )
        and "lnbts".co_gid = p.lnbts_id
        and "lnbts".co_parent_gid = "vloflnbtsparent".co_gid
        and "lnbts".co_oc_id = 3129
      group by
        trunc( p.period_start_time, 'dd' ),
        "plmn".co_gid
      ) jf_OBJCOUNT_3061909071
    )
  ) p
  ) ALLTABLES
where
    plmn.co_gid = ALLTABLES.plmn_gid
    and ALLTABLES.period_start_time = ALARMS_EXT.period_start_time (+) and ALLTABLES.plmn_gid = ALARMS_EXT.plmn_gid (+) 
	and ALLTABLES.period_start_time = LCELAV2.period_start_time (+) and ALLTABLES.plmn_gid = LCELAV2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LCELLD2.period_start_time (+) and ALLTABLES.plmn_gid = LCELLD2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LCELLR2.period_start_time (+) and ALLTABLES.plmn_gid = LCELLR2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LCELLT2.period_start_time (+) and ALLTABLES.plmn_gid = LCELLT2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LCELLT_ext2.period_start_time (+) and ALLTABLES.plmn_gid = LCELLT_ext2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LENBLD2.period_start_time (+) and ALLTABLES.plmn_gid = LENBLD2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LENBLD_ext.period_start_time (+) and ALLTABLES.plmn_gid = LENBLD_ext.plmn_gid (+) 
	and ALLTABLES.period_start_time = LEPSB2.period_start_time (+) and ALLTABLES.plmn_gid = LEPSB2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LHO2.period_start_time (+) and ALLTABLES.plmn_gid = LHO2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LIANBHO2.period_start_time (+) and ALLTABLES.plmn_gid = LIANBHO2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LIENBHO2.period_start_time (+) and ALLTABLES.plmn_gid = LIENBHO2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LIP_ext.period_start_time (+) and ALLTABLES.plmn_gid = LIP_ext.plmn_gid (+) 
	and ALLTABLES.period_start_time = LISHO2.period_start_time (+) and ALLTABLES.plmn_gid = LISHO2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LMAC2.period_start_time (+) and ALLTABLES.plmn_gid = LMAC2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LPQDL2.period_start_time (+) and ALLTABLES.plmn_gid = LPQDL2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LPQUL2.period_start_time (+) and ALLTABLES.plmn_gid = LPQUL2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LQOS2.period_start_time (+) and ALLTABLES.plmn_gid = LQOS2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LRDB2.period_start_time (+) and ALLTABLES.plmn_gid = LRDB2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LRRC2.period_start_time (+) and ALLTABLES.plmn_gid = LRRC2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LS1AP2.period_start_time (+) and ALLTABLES.plmn_gid = LS1AP2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LUEQ_ext.period_start_time (+) and ALLTABLES.plmn_gid = LUEQ_ext.plmn_gid (+) 
	and ALLTABLES.period_start_time = LUEST2.period_start_time (+) and ALLTABLES.plmn_gid = LUEST2.plmn_gid (+) 
	and ALLTABLES.period_start_time = LVLIP_ext.period_start_time (+) and ALLTABLES.plmn_gid = LVLIP_ext.plmn_gid (+) 
	and ALLTABLES.period_start_time = OBJCOUNT.period_start_time (+) and ALLTABLES.plmn_gid = OBJCOUNT.plmn_gid (+) 
order by
	2,1,3
