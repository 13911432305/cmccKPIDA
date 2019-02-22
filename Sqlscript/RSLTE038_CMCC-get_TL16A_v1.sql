select
    to_char(ALLTABLES.period_start_time,'yyyy/mm/dd') period_start_time,
    nvl(plmn.co_name, nvl(plmn.co_object_instance,  'NN('||plmn.co_gid||')')) "PLMN Name",
    ALLTABLES.plmn_gid, nvl(plmn.co_ext_dn, plmn.co_dn) "DN",
    to_number((luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol)) LTE_753c,
    to_number(luest2.sign_conn_estab_att_mo_s) LTE_5232a,
    to_number(luest2.sign_conn_estab_att_mt) LTE_5233a,
    to_number(luest2.sign_conn_estab_att_mo_d) LTE_5234a,
    to_number(nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg) LTE_5228c,
    to_number(luest2.sign_conn_estab_att_hiprio) LTE_5381a,
    to_number(luest2.sign_conn_estab_att_del_tol) LTE_5380a,
    to_number(100*decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_del_tol,0)),0,null, luest2.sign_conn_estab_comp / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_del_tol,0)))) LTE_5218f,
    to_number((luest2.sign_conn_estab_comp)) M8013C5,
    to_number(100*decode(luest2.sign_conn_estab_att_mo_s,0,null,(luest2.sign_conn_estab_succ_mo_s/luest2.sign_conn_estab_att_mo_s))) LTE_5382a,
    to_number(100*decode( luest2.sign_conn_estab_att_mo_d,0,null, luest2.sign_conn_estab_succ_mo_d / luest2.sign_conn_estab_att_mo_d)) LTE_5383a,
    to_number(100*decode( luest2.sign_conn_estab_att_mt,0,null, luest2.sign_conn_estab_succ_mt / luest2.sign_conn_estab_att_mt)) LTE_5384a,
    to_number(100*decode( luest2.sign_conn_estab_att_del_tol,0,null, luest2.sign_conn_estab_succ_del_tol / luest2.sign_conn_estab_att_del_tol)) LTE_5385a,
    to_number(100*decode( luest2.sign_conn_estab_att_hiprio,0,null, luest2.sign_conn_estab_succ_hiprio / luest2.sign_conn_estab_att_hiprio)) LTE_5386a,
    to_number(100*decode( (nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg),0,null, (luest2.sign_conn_estab_comp - (luest2.sign_conn_estab_succ_mo_s+ + luest2.sign_conn_estab_succ_mo_d + luest2.sign_conn_estab_succ_mt + nvl(luest2.sign_conn_estab_succ_del_tol,0) + nvl(luest2.sign_conn_estab_succ_hiprio,0))) / (nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg) )) LTE_5227c,
    to_number((luest2.sign_conn_estab_fail_rb_emg)) M8013C27,
    to_number(100*decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_del_tol,0)),0,null, luest2.sign_est_f_rrccompl_missing / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_del_tol,0)))) LTE_5229e,
    to_number((luest2.sign_est_f_rrccompl_missing)) M8013C6,
    to_number(100*decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_del_tol,0)),0,null, luest2.sign_est_f_rrccompl_error / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_del_tol,0)))) LTE_5230e,
    to_number((luest2.sign_est_f_rrccompl_error)) M8013C7,
    to_number(100*decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol),0,null, luest2.sign_conn_estab_fail_ovlcp / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol))) LTE_1448b,
    to_number((luest2.sign_conn_estab_fail_ovlcp)) M8013C65,
    to_number(100*decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol),0,null, luest2.sign_conn_estab_fail_ovlup / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol))) LTE_1449b,
    to_number((luest2.sign_conn_estab_fail_ovlup)) M8013C66,
    to_number(100*decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol),0,null, luest2.sign_conn_estab_fail_pucch / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol))) LTE_1450b,
    to_number((luest2.sign_conn_estab_fail_pucch)) M8013C67,
    to_number(100*decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol),0,null, luest2.sign_conn_estab_fail_maxrrc / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol))) LTE_1451b,
    to_number((luest2.sign_conn_estab_fail_maxrrc)) M8013C68,
    to_number(100*decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol),0,null, luest2.sign_conn_estab_fail_ovlmme / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + luest2.sign_conn_estab_att_hiprio + luest2.sign_conn_estab_att_del_tol))) LTE_1452b,
    to_number((luest2.sign_conn_estab_fail_ovlmme)) M8013C69,
    to_number(100*decode( (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_del_tol,0)),0,null, (luest2.sign_conn_estab_rej_emg + luest2.sign_conn_estab_rej_mo_s + luest2.sign_conn_estab_rej_mo_d + luest2.sign_conn_estab_rej_mt + nvl(luest2.sign_conn_estab_rej_hiprio,0) + nvl(luest2.sign_conn_estab_rej_del_tol,0)) / (luest2.sign_conn_estab_att_mo_s + luest2.sign_conn_estab_att_mt + luest2.sign_conn_estab_att_mo_d + nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg + nvl(luest2.sign_conn_estab_att_hiprio,0) + nvl(luest2.sign_conn_estab_att_del_tol,0)))) LTE_5590c,
    to_number(decode(luest2.sign_conn_estab_att_mo_s,0,null,(luest2.sign_conn_estab_rej_mo_s/luest2.sign_conn_estab_att_mo_s))) LTE_5387a,
    to_number((luest2.sign_conn_estab_rej_mo_s)) M8013C39,
    to_number(100*decode( luest2.sign_conn_estab_att_mo_d,0,null, luest2.sign_conn_estab_rej_mo_d / luest2.sign_conn_estab_att_mo_d)) LTE_5388a,
    to_number((luest2.sign_conn_estab_rej_mo_d)) M8013C40,
    to_number(100*decode( luest2.sign_conn_estab_att_mt,0,null, luest2.sign_conn_estab_rej_mt / luest2.sign_conn_estab_att_mt)) LTE_5389a,
    to_number((luest2.sign_conn_estab_rej_mt)) M8013C41,
    to_number(100*decode( luest2.sign_conn_estab_att_del_tol,0,null, luest2.sign_conn_estab_rej_del_tol / luest2.sign_conn_estab_att_del_tol)) LTE_5390a,
    to_number((luest2.sign_conn_estab_rej_del_tol)) M8013C42,
    to_number(100*decode( luest2.sign_conn_estab_att_hiprio,0,null, luest2.sign_conn_estab_rej_hiprio / luest2.sign_conn_estab_att_hiprio)) LTE_5391a,
    to_number((luest2.sign_conn_estab_rej_hiprio)) M8013C33,
    to_number(100*decode( (nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg),0,null, luest2.sign_conn_estab_rej_emg / (nvl(luest2.sign_conn_estab_att_others,0) + luest2.sign_conn_estab_att_emg ))) LTE_5392c,
    to_number((luest2.sign_conn_estab_rej_emg)) M8013C30,
    to_number(100*decode( (lrrc2.rrc_con_re_estab_att),0,null, (lrrc2.rrc_con_re_estab_att - lrrc2.rrc_con_re_estab_succ - lrrc2.rej_rrc_conn_re_estab) / (lrrc2.rrc_con_re_estab_att))) LTE_5145a,
    to_number(100*decode( lrrc2.rrc_con_re_estab_att,0,null, lrrc2.rej_rrc_conn_re_estab / lrrc2.rrc_con_re_estab_att)) LTE_5144a,
    to_number(100*decode( lrrc2.rrc_con_re_estab_att,0,null, lrrc2.rrc_con_re_estab_succ / lrrc2.rrc_con_re_estab_att)) LTE_5143a,
    to_number((lrrc2.rrc_con_re_estab_att)) M8008C4,
    to_number(lrrc2.rrc_con_re_estab_att_ho_fail) LTE_5141a,
    to_number(lrrc2.rrc_con_re_estab_att_other) LTE_5142a,
    to_number(lrrc2.rrc_con_stp_tim_mean) LTE_5602a,
    to_number(lrrc2.rrc_con_stp_tim_max) LTE_5603a,
    to_number((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0))) LTE_5219b,
    to_number(100*decode( ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))),0,null, luest2.epc_init_to_idle_ue_norm_rel / ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other+ nvl(luest2.pre_empt_ue_context_non_gbr,0)))))) LTE_227c,
    to_number((luest2.epc_init_to_idle_ue_norm_rel)) M8013C9,
    to_number(100*decode( ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))),0,null, luest2.epc_init_to_idle_detach / ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))))) LTE_228c,
    to_number((luest2.epc_init_to_idle_detach)) M8013C10,
    to_number(100*decode( ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))),0,null, luest2.epc_init_to_idle_rnl / ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))))) LTE_229c,
    to_number((luest2.epc_init_to_idle_rnl)) M8013C11,
    to_number(100*decode( ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))),0,null, luest2.epc_init_to_idle_other / ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))))) LTE_230c,
    to_number((luest2.epc_init_to_idle_other)) M8013C12,
    to_number(100*decode( ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))),0,null, luest2.enb_init_to_idle_norm_rel / ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))))) LTE_231c,
    to_number((luest2.enb_init_to_idle_norm_rel)) M8013C13,
    to_number(100*decode( ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))),0,null, luest2.enb_init_to_idle_rnl / ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))))) LTE_233c,
    to_number((luest2.enb_init_to_idle_rnl)) M8013C15,
    to_number(100*decode( ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))),0,null, luest2.enb_init_to_idle_other / ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))))) LTE_234c,
    to_number((luest2.enb_init_to_idle_other)) M8013C16,
    to_number(100*decode( ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))),0,null, nvl(luest2.pre_empt_ue_context_non_gbr,0) / ( /*((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))*/ ((luest2.epc_init_to_idle_ue_norm_rel + luest2.epc_init_to_idle_detach + luest2.epc_init_to_idle_rnl + luest2.epc_init_to_idle_other + luest2.enb_init_to_idle_norm_rel + luest2.enb_init_to_idle_rnl + luest2.enb_init_to_idle_other + nvl(luest2.pre_empt_ue_context_non_gbr,0)))))) LTE_1095a,
    to_number((luest2.pre_empt_ue_context_non_gbr)) M8013C28,
    to_number(100*decode( (lrdb2.data_rb_stp_att),0,null, (lrdb2.data_rb_stp_comp) / (lrdb2.data_rb_stp_att))) LTE_5003a,
    to_number((lrdb2.data_rb_stp_att)) M8007C0,
    to_number((lrdb2.data_rb_stp_comp)) M8007C1,
    to_number((lrdb2.data_rb_stp_fail)) M8007C2,
    to_number(100 - 100*decode( (nvl((lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_succ + lepsb2.erab_rel_ho_part),0) + nvl(lepsb2.erab_rel_epc_path_switch,0) + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth),0,null, (nvl((lepsb2.erab_rel_ho_part + lepsb2.erab_rel_enb - lepsb2.erab_rel_enb_rnl_ina - lepsb2.erab_rel_enb_rnl_red - lepsb2.erab_rel_enb_rnl_rrna + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0)),0) ) / (nvl((lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_succ + lepsb2.erab_rel_ho_part),0) + nvl(lepsb2.erab_rel_epc_path_switch,0) + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth))) LTE_5117c,
    to_number(100*decode( (lepsb2.eps_bearer_setup_attempts),0,null, (lepsb2.eps_bearer_setup_completions) / (lepsb2.eps_bearer_setup_attempts))) LTE_5017a,
    to_number(lepsb2.eps_bearer_setup_attempts) LTE_5118a,
    to_number(100*decode( (nvl(lepsb2.erab_ini_setup_att_qci1,0) + nvl(lepsb2.erab_ini_setup_att_qci2,0) + nvl(lepsb2.erab_ini_setup_att_qci3,0) + nvl(lepsb2.erab_ini_setup_att_qci4,0) + nvl(lepsb2.erab_ini_setup_att_qci5,0) + nvl(lepsb2.erab_ini_setup_att_qci6,0) + nvl(lepsb2.erab_ini_setup_att_qci7,0) + nvl(lepsb2.erab_ini_setup_att_qci8,0) + nvl(lepsb2.erab_ini_setup_att_qci9,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_1,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_4,0) + nvl(lepsb2.eps_bear_stp_att_ini_non_gbr,0)),0,null, (nvl(lepsb2.erab_ini_setup_succ_qci1,0) + nvl(lepsb2.erab_ini_setup_succ_qci2,0) + nvl(lepsb2.erab_ini_setup_succ_qci3,0) + nvl(lepsb2.erab_ini_setup_succ_qci4,0) + nvl(lepsb2.erab_ini_setup_succ_qci5,0) + nvl(lepsb2.erab_ini_setup_succ_qci6,0) + nvl(lepsb2.erab_ini_setup_succ_qci7,0) + nvl(lepsb2.erab_ini_setup_succ_qci8,0) + nvl(lepsb2.erab_ini_setup_succ_qci9,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci1,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_4,0) + nvl(lepsb2.eps_bear_stp_com_ini_non_gbr,0)) / (nvl(lepsb2.erab_ini_setup_att_qci1,0) + nvl(lepsb2.erab_ini_setup_att_qci2,0) + nvl(lepsb2.erab_ini_setup_att_qci3,0) + nvl(lepsb2.erab_ini_setup_att_qci4,0) + nvl(lepsb2.erab_ini_setup_att_qci5,0) + nvl(lepsb2.erab_ini_setup_att_qci6,0) + nvl(lepsb2.erab_ini_setup_att_qci7,0) + nvl(lepsb2.erab_ini_setup_att_qci8,0) + nvl(lepsb2.erab_ini_setup_att_qci9,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_1,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_4,0) + nvl(lepsb2.eps_bear_stp_att_ini_non_gbr,0)))) LTE_5112c,
    to_number(100*decode( (lepsb2.erab_add_setup_att_qci1 + lepsb2.erab_add_setup_att_qci2 + lepsb2.erab_add_setup_att_qci3 + lepsb2.erab_add_setup_att_qci4 + lepsb2.erab_add_setup_att_qci5 + lepsb2.erab_add_setup_att_qci6 + lepsb2.erab_add_setup_att_qci7 + lepsb2.erab_add_setup_att_qci8 + lepsb2.erab_add_setup_att_qci9),0,null, (lepsb2.erab_add_setup_succ_qci1 + lepsb2.erab_add_setup_succ_qci2 + lepsb2.erab_add_setup_succ_qci3 + lepsb2.erab_add_setup_succ_qci4 + lepsb2.erab_add_setup_succ_qci5 + lepsb2.erab_add_setup_succ_qci6 + lepsb2.erab_add_setup_succ_qci7 + lepsb2.erab_add_setup_succ_qci8 + lepsb2.erab_add_setup_succ_qci9 - nvl(lepsb2.erab_rel_temp_qci1,0)) / (lepsb2.erab_add_setup_att_qci1 + lepsb2.erab_add_setup_att_qci2 + lepsb2.erab_add_setup_att_qci3 + lepsb2.erab_add_setup_att_qci4 + lepsb2.erab_add_setup_att_qci5 + lepsb2.erab_add_setup_att_qci6 + lepsb2.erab_add_setup_att_qci7 + lepsb2.erab_add_setup_att_qci8 + lepsb2.erab_add_setup_att_qci9))) LTE_5113d,
    to_number(nvl(lepsb2.erab_ini_setup_att_qci1,0) + nvl(lepsb2.erab_add_setup_att_qci1,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_1,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_1,0)) LTE_5205b,
    to_number(nvl(lepsb2.erab_ini_setup_att_qci2,0) + nvl(lepsb2.erab_add_setup_att_qci2,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_2,0)) LTE_5550b,
    to_number(nvl(lepsb2.erab_ini_setup_att_qci3,0) + nvl(lepsb2.erab_add_setup_att_qci3,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_3,0)) LTE_5551b,
    to_number(nvl(lepsb2.erab_ini_setup_att_qci4,0) + nvl(lepsb2.erab_add_setup_att_qci4,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_4,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_4,0)) LTE_5552b,
    to_number((lepsb2.erab_ini_setup_att_qci5 + lepsb2.erab_add_setup_att_qci5)) LTE_5641a,
    to_number((lepsb2.erab_ini_setup_att_qci6 + lepsb2.erab_add_setup_att_qci6)) LTE_5642a,
    to_number((lepsb2.erab_ini_setup_att_qci7 + lepsb2.erab_add_setup_att_qci7)) LTE_5643a,
    to_number((lepsb2.erab_ini_setup_att_qci8 + lepsb2.erab_add_setup_att_qci8)) LTE_5644a,
    to_number((lepsb2.erab_ini_setup_att_qci9 + lepsb2.erab_add_setup_att_qci9)) LTE_5645a,
    to_number(nvl(lepsb2.erab_ini_setup_att_qci5,0) + nvl(lepsb2.erab_ini_setup_att_qci6,0) + nvl(lepsb2.erab_ini_setup_att_qci7,0) + nvl(lepsb2.erab_ini_setup_att_qci8,0) + nvl(lepsb2.erab_ini_setup_att_qci9,0) + nvl(lepsb2.erab_add_setup_att_qci5,0) + nvl(lepsb2.erab_add_setup_att_qci6,0) + nvl(lepsb2.erab_add_setup_att_qci7,0) + nvl(lepsb2.erab_add_setup_att_qci8,0) + nvl(lepsb2.erab_add_setup_att_qci9,0) + nvl((lepsb2.eps_bearer_setup_attempts - (lepsb2.eps_bearer_stp_att_ini_qci_1 + lepsb2.eps_bearer_stp_att_add_qci_1) - (lepsb2.eps_bearer_stp_att_ini_qci_2 + lepsb2.eps_bearer_stp_att_add_qci_2) - (lepsb2.eps_bearer_stp_att_ini_qci_3 + lepsb2.eps_bearer_stp_att_add_qci_3) - (lepsb2.eps_bearer_stp_att_ini_qci_4 + lepsb2.eps_bearer_stp_att_add_qci_4) -(nvl(lepsb2.erab_ini_setup_att_qci5,0) + nvl(lepsb2.erab_ini_setup_att_qci6,0) + nvl(lepsb2.erab_ini_setup_att_qci7,0) + nvl(lepsb2.erab_ini_setup_att_qci8,0) + nvl(lepsb2.erab_ini_setup_att_qci9,0) + nvl(lepsb2.erab_add_setup_att_qci5,0) + nvl(lepsb2.erab_add_setup_att_qci6,0) + nvl(lepsb2.erab_add_setup_att_qci7,0) + nvl(lepsb2.erab_add_setup_att_qci8,0) + nvl(lepsb2.erab_add_setup_att_qci9,0))),0)) LTE_5206c,
    to_number(100*decode( (lepsb2.erab_ini_setup_att_qci1 + lepsb2.erab_add_setup_att_qci1),0,null, (lepsb2.erab_ini_setup_succ_qci1 + lepsb2.erab_add_setup_succ_qci1 - nvl(lepsb2.erab_rel_temp_qci1,0)) / (lepsb2.erab_ini_setup_att_qci1 + lepsb2.erab_add_setup_att_qci1))) LTE_5204c,
    to_number(100*decode( (nvl(lepsb2.erab_ini_setup_att_qci2,0) + nvl(lepsb2.erab_add_setup_att_qci2,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_2,0)) ,0,null, (nvl(lepsb2.erab_ini_setup_succ_qci2,0) + nvl(lepsb2.erab_add_setup_succ_qci2,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_com_add_qci_2,0)) / (nvl(lepsb2.erab_ini_setup_att_qci2,0) + nvl(lepsb2.erab_add_setup_att_qci2,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_2,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_2,0)))) LTE_5553b,
    to_number(100*decode( (nvl(lepsb2.erab_ini_setup_att_qci3,0) + nvl(lepsb2.erab_add_setup_att_qci3,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_3,0)) ,0,null, (nvl(lepsb2.erab_ini_setup_succ_qci3,0) + nvl(lepsb2.erab_add_setup_succ_qci3,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_com_add_qci_3,0)) / (nvl(lepsb2.erab_ini_setup_att_qci3,0) + nvl(lepsb2.erab_add_setup_att_qci3,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_3,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_3,0)))) LTE_5554b,
    to_number(100*decode( (nvl(lepsb2.erab_ini_setup_att_qci4,0) + nvl(lepsb2.erab_add_setup_att_qci4,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_4,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_4,0)) ,0,null, (nvl(lepsb2.erab_ini_setup_succ_qci4,0) + nvl(lepsb2.erab_add_setup_succ_qci4,0) + nvl(lepsb2.eps_bearer_stp_com_ini_qci_4,0) + nvl(lepsb2.eps_bearer_stp_com_add_qci_4,0)) / (nvl(lepsb2.erab_ini_setup_att_qci4,0) + nvl(lepsb2.erab_add_setup_att_qci4,0) + nvl(lepsb2.eps_bearer_stp_att_ini_qci_4,0) + nvl(lepsb2.eps_bearer_stp_att_add_qci_4,0)))) LTE_5555b,
    to_number(100*decode( (lepsb2.erab_ini_setup_att_qci5 + lepsb2.erab_add_setup_att_qci5),0,null, (lepsb2.erab_ini_setup_succ_qci5 + lepsb2.erab_add_setup_succ_qci5) / (lepsb2.erab_ini_setup_att_qci5 + lepsb2.erab_add_setup_att_qci5))) LTE_5646a,
    to_number(100*decode( (lepsb2.erab_ini_setup_att_qci6 + lepsb2.erab_add_setup_att_qci6),0,null, (lepsb2.erab_ini_setup_succ_qci6 + lepsb2.erab_add_setup_succ_qci6) / (lepsb2.erab_ini_setup_att_qci6 + lepsb2.erab_add_setup_att_qci6))) LTE_5647a,
    to_number(100*decode( (lepsb2.erab_ini_setup_att_qci7 + lepsb2.erab_add_setup_att_qci7),0,null, (lepsb2.erab_ini_setup_succ_qci7 + lepsb2.erab_add_setup_succ_qci7) / (lepsb2.erab_ini_setup_att_qci7 + lepsb2.erab_add_setup_att_qci7))) LTE_5648a,
    to_number(100*decode( (lepsb2.erab_ini_setup_att_qci8 + lepsb2.erab_add_setup_att_qci8),0,null, (lepsb2.erab_ini_setup_succ_qci8 + lepsb2.erab_add_setup_succ_qci8) / (lepsb2.erab_ini_setup_att_qci8 + lepsb2.erab_add_setup_att_qci8))) LTE_5649a,
    to_number(100*decode( (lepsb2.erab_ini_setup_att_qci9 + lepsb2.erab_add_setup_att_qci9),0,null, (lepsb2.erab_ini_setup_succ_qci9 + lepsb2.erab_add_setup_succ_qci9) / (lepsb2.erab_ini_setup_att_qci9 + lepsb2.erab_add_setup_att_qci9))) LTE_5650a,
    to_number(100*decode( (nvl(lepsb2.erab_ini_setup_att_qci5,0) + nvl(lepsb2.erab_ini_setup_att_qci6,0) + nvl(lepsb2.erab_ini_setup_att_qci7,0) + nvl(lepsb2.erab_ini_setup_att_qci8,0) + nvl(lepsb2.erab_ini_setup_att_qci9,0) + nvl(lepsb2.erab_add_setup_att_qci5,0) + nvl(lepsb2.erab_add_setup_att_qci6,0) + nvl(lepsb2.erab_add_setup_att_qci7,0) + nvl(lepsb2.erab_add_setup_att_qci8,0) + nvl(lepsb2.erab_add_setup_att_qci9,0) + nvl((lepsb2.eps_bearer_setup_attempts - (lepsb2.eps_bearer_stp_att_ini_qci_1 + lepsb2.eps_bearer_stp_att_add_qci_1) - (lepsb2.eps_bearer_stp_att_ini_qci_2 + lepsb2.eps_bearer_stp_att_add_qci_2) - (lepsb2.eps_bearer_stp_att_ini_qci_3 + lepsb2.eps_bearer_stp_att_add_qci_3) - (lepsb2.eps_bearer_stp_att_ini_qci_4 + lepsb2.eps_bearer_stp_att_add_qci_4) -(nvl(lepsb2.erab_ini_setup_att_qci5,0) + nvl(lepsb2.erab_ini_setup_att_qci6,0) + nvl(lepsb2.erab_ini_setup_att_qci7,0) + nvl(lepsb2.erab_ini_setup_att_qci8,0) + nvl(lepsb2.erab_ini_setup_att_qci9,0) + nvl(lepsb2.erab_add_setup_att_qci5,0) + nvl(lepsb2.erab_add_setup_att_qci6,0) + nvl(lepsb2.erab_add_setup_att_qci7,0) + nvl(lepsb2.erab_add_setup_att_qci8,0) + nvl(lepsb2.erab_add_setup_att_qci9,0))),0)) ,0,null, (nvl(lepsb2.erab_ini_setup_succ_qci5,0) + nvl(lepsb2.erab_ini_setup_succ_qci6,0) + nvl(lepsb2.erab_ini_setup_succ_qci7,0) + nvl(lepsb2.erab_ini_setup_succ_qci8,0) + nvl(lepsb2.erab_ini_setup_succ_qci9,0) + nvl(lepsb2.erab_add_setup_succ_qci5,0) + nvl(lepsb2.erab_add_setup_succ_qci6,0) + nvl(lepsb2.erab_add_setup_succ_qci7,0) + nvl(lepsb2.erab_add_setup_succ_qci8,0) + nvl(lepsb2.erab_add_setup_succ_qci9,0) + nvl((lepsb2.eps_bearer_setup_completions - (lepsb2.eps_bearer_stp_com_ini_qci1 + lepsb2.eps_bear_set_com_addit_qci1) - (lepsb2.eps_bearer_stp_com_ini_qci_2 + lepsb2.eps_bearer_stp_com_add_qci_2) - (lepsb2.eps_bearer_stp_com_ini_qci_3 + lepsb2.eps_bearer_stp_com_add_qci_3) - (lepsb2.eps_bearer_stp_com_ini_qci_4 + lepsb2.eps_bearer_stp_com_add_qci_4) -(nvl(lepsb2.erab_ini_setup_succ_qci5,0) + nvl(lepsb2.erab_ini_setup_succ_qci6,0) + nvl(lepsb2.erab_ini_setup_succ_qci7,0) + nvl(lepsb2.erab_ini_setup_succ_qci8,0) + nvl(lepsb2.erab_ini_setup_succ_qci9,0) + nvl(lepsb2.erab_add_setup_succ_qci5,0) + nvl(lepsb2.erab_add_setup_succ_qci6,0) + nvl(lepsb2.erab_add_setup_succ_qci7,0) + nvl(lepsb2.erab_add_setup_succ_qci8,0) + nvl(lepsb2.erab_add_setup_succ_qci9,0))),0)) / (nvl(lepsb2.erab_ini_setup_att_qci5,0) + nvl(lepsb2.erab_ini_setup_att_qci6,0) + nvl(lepsb2.erab_ini_setup_att_qci7,0) + nvl(lepsb2.erab_ini_setup_att_qci8,0) + nvl(lepsb2.erab_ini_setup_att_qci9,0) + nvl(lepsb2.erab_add_setup_att_qci5,0) + nvl(lepsb2.erab_add_setup_att_qci6,0) + nvl(lepsb2.erab_add_setup_att_qci7,0) + nvl(lepsb2.erab_add_setup_att_qci8,0) + nvl(lepsb2.erab_add_setup_att_qci9,0) + nvl((lepsb2.eps_bearer_setup_attempts - (lepsb2.eps_bearer_stp_att_ini_qci_1 + lepsb2.eps_bearer_stp_att_add_qci_1) - (lepsb2.eps_bearer_stp_att_ini_qci_2 + lepsb2.eps_bearer_stp_att_add_qci_2) - (lepsb2.eps_bearer_stp_att_ini_qci_3 + lepsb2.eps_bearer_stp_att_add_qci_3) - (lepsb2.eps_bearer_stp_att_ini_qci_4 + lepsb2.eps_bearer_stp_att_add_qci_4) -(nvl(lepsb2.erab_ini_setup_att_qci5,0) + nvl(lepsb2.erab_ini_setup_att_qci6,0) + nvl(lepsb2.erab_ini_setup_att_qci7,0) + nvl(lepsb2.erab_ini_setup_att_qci8,0) + nvl(lepsb2.erab_ini_setup_att_qci9,0) + nvl(lepsb2.erab_add_setup_att_qci5,0) + nvl(lepsb2.erab_add_setup_att_qci6,0) + nvl(lepsb2.erab_add_setup_att_qci7,0) + nvl(lepsb2.erab_add_setup_att_qci8,0) + nvl(lepsb2.erab_add_setup_att_qci9,0))),0)))) LTE_5217c,
    to_number(100*decode( lepsb2.erab_setup_att_hiprio,0,null, lepsb2.erab_setup_succ_hiprio / lepsb2.erab_setup_att_hiprio)) LTE_5393a,
    to_number(100*decode( (lepsb2.erab_ini_setup_att_qci1 + lepsb2.erab_add_setup_att_qci1),0,null, (lepsb2.erab_succ_rac_temp_qci1 + lepsb2.erab_succ_tac_temp_qci1) / (lepsb2.erab_ini_setup_att_qci1 + lepsb2.erab_add_setup_att_qci1))) LTE_6007a,
    to_number(100*decode( lepsb2.eps_bearer_setup_attempts,0,null, (nvl((lepsb2.erab_ini_setup_fail_rnl_uel + lepsb2.erab_add_setup_fail_rnl_uel),0) + nvl(lepsb2.eps_bearer_setup_fail_rnl,0)) / lepsb2.eps_bearer_setup_attempts)) LTE_5086b,
    to_number(100*decode( lepsb2.eps_bearer_setup_attempts,0,null, (nvl((lepsb2.erab_ini_setup_fail_tnl_tru + lepsb2.erab_add_setup_fail_tnl_tru),0) + nvl(lepsb2.eps_bearer_setup_fail_trport,0)) / lepsb2.eps_bearer_setup_attempts)) LTE_5087b,
    to_number(100*decode( lepsb2.eps_bearer_setup_attempts,0,null, (lepsb2.erab_ini_setup_fail_rnl_rrna + lepsb2.erab_add_setup_fail_rnl_rrna + nvl(lepsb2.erab_rel_temp_qci1,0)) / lepsb2.eps_bearer_setup_attempts)) LTE_5088c,
    to_number(100*decode( lepsb2.eps_bearer_setup_attempts,0,null, (lepsb2.erab_ini_setup_fail_rnl_rip + lepsb2.erab_add_setup_fail_rnl_rip) / lepsb2.eps_bearer_setup_attempts)) LTE_5761a,
    to_number(100*decode( lepsb2.eps_bearer_setup_attempts,0,null, (lepsb2.erab_add_setup_fail_up) / lepsb2.eps_bearer_setup_attempts)) LTE_5762a,
    to_number(100*decode( lepsb2.eps_bearer_setup_attempts,0,null, (lepsb2.erab_add_setup_fail_rnl_mob) / lepsb2.eps_bearer_setup_attempts)) LTE_5763a,
    to_number(100*decode( lepsb2.eps_bearer_setup_attempts,0,null, (nvl((lepsb2.eps_bearer_setup_attempts - lepsb2.eps_bearer_setup_completions - lepsb2.erab_ini_setup_fail_rnl_uel - lepsb2.erab_add_setup_fail_rnl_uel - lepsb2.erab_ini_setup_fail_tnl_tru - lepsb2.erab_add_setup_fail_tnl_tru - lepsb2.erab_ini_setup_fail_rnl_rrna - lepsb2.erab_add_setup_fail_rnl_rrna - lepsb2.erab_ini_setup_fail_rnl_rip - lepsb2.erab_add_setup_fail_rnl_rip - lepsb2.erab_add_setup_fail_up - lepsb2.erab_add_setup_fail_rnl_mob),0) + nvl(lepsb2.eps_bearer_setup_fail_oth,0)) / lepsb2.eps_bearer_setup_attempts)) LTE_5089b,
    to_number(100*decode( lepsb2.eps_bearer_setup_attempts,0,null, lepsb2.erab_ini_setup_fail_no_ue_lic / lepsb2.eps_bearer_setup_attempts)) LTE_6021a,
    to_number(lrdb2.erab_setup_time_mean) LTE_5600a,
    to_number(lrdb2.erab_setup_time_max) LTE_5601a,
    to_number(100*decode( lepsb2.erab_mod_att_qci1,0,null, lepsb2.erab_mod_succ_qci1 / lepsb2.erab_mod_att_qci1)) LTE_5693a,
    to_number((lepsb2.erab_mod_att_qci1)) M8006C55,
    to_number(100*decode( lepsb2.erab_mod_att_qci2,0,null, lepsb2.erab_mod_succ_qci2 / lepsb2.erab_mod_att_qci2)) LTE_5694a,
    to_number((lepsb2.erab_mod_att_qci2)) M8006C56,
    to_number(100*decode( lepsb2.erab_mod_att_qci3,0,null, lepsb2.erab_mod_succ_qci3 / lepsb2.erab_mod_att_qci3)) LTE_5695a,
    to_number((lepsb2.erab_mod_att_qci3)) M8006C57,
    to_number(100*decode( lepsb2.erab_mod_att_qci4,0,null, lepsb2.erab_mod_succ_qci4 / lepsb2.erab_mod_att_qci4)) LTE_5696a,
    to_number((lepsb2.erab_mod_att_qci4)) M8006C58,
    to_number(100*decode( lepsb2.erab_mod_att_qci5,0,null, lepsb2.erab_mod_succ_qci5 / lepsb2.erab_mod_att_qci5)) LTE_5620a,
    to_number((lepsb2.erab_mod_att_qci5)) M8006C59,
    to_number(100*decode( lepsb2.erab_mod_att_qci6,0,null, lepsb2.erab_mod_succ_qci6 / lepsb2.erab_mod_att_qci6)) LTE_5621a,
    to_number((lepsb2.erab_mod_att_qci6)) M8006C60,
    to_number(100*decode( lepsb2.erab_mod_att_qci7,0,null, lepsb2.erab_mod_succ_qci7 / lepsb2.erab_mod_att_qci7)) LTE_5622a,
    to_number((lepsb2.erab_mod_att_qci7)) M8006C61,
    to_number(100*decode( lepsb2.erab_mod_att_qci8,0,null, lepsb2.erab_mod_succ_qci8 / lepsb2.erab_mod_att_qci8)) LTE_5623a,
    to_number((lepsb2.erab_mod_att_qci8)) M8006C62,
    to_number(100*decode( lepsb2.erab_mod_att_qci9,0,null, lepsb2.erab_mod_succ_qci9 / lepsb2.erab_mod_att_qci9)) LTE_5624a,
    to_number((lepsb2.erab_mod_att_qci9)) M8006C63,
    to_number(100*decode( (lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4 + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9),0,null, (lepsb2.erab_mod_succ_qci1 + lepsb2.erab_mod_succ_qci2 + lepsb2.erab_mod_succ_qci3 + lepsb2.erab_mod_succ_qci4 + lepsb2.erab_mod_succ_qci5 + lepsb2.erab_mod_succ_qci6 + lepsb2.erab_mod_succ_qci7 + lepsb2.erab_mod_succ_qci8 + lepsb2.erab_mod_succ_qci9) / (lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4 + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9))) LTE_1483a,
    to_number(100*decode( (nvl((lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4),0) + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9),0,null, lepsb2.erab_mod_fail_timer / (nvl((lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4),0) + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9))) LTE_5625b,
    to_number(100*decode( (nvl((lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4),0) + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9),0,null, (lepsb2.erab_mod_fail_qci_nsupp) / (nvl((lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4),0) + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9))) LTE_5626b,
    to_number(100*decode( (nvl((lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4),0) + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9),0,null, lepsb2.erab_mod_fail_rnl_unspec / (nvl((lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4),0) + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9))) LTE_5627b,
    to_number(100*decode( (lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4 + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9),0,null, lepsb2.erab_mod_fail_rnl_rr_na / (lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4 + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9))) LTE_5697a,
    to_number(100*decode( (lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4 + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9),0,null, lepsb2.erab_mod_fail_tnl_tru / (lepsb2.erab_mod_att_qci1 + lepsb2.erab_mod_att_qci2 + lepsb2.erab_mod_att_qci3 + lepsb2.erab_mod_att_qci4 + lepsb2.erab_mod_att_qci5 + lepsb2.erab_mod_att_qci6 + lepsb2.erab_mod_att_qci7 + lepsb2.erab_mod_att_qci8 + lepsb2.erab_mod_att_qci9))) LTE_5698a,
    to_number(decode(lepsb2.denom_sum_simul_erab,0,null,(lepsb2.sum_simul_erab_qci_1/lepsb2.denom_sum_simul_erab))) LTE_5394a,
    to_number(lepsb2.simul_erab_qci1_max) LTE_5610a,
    to_number(decode(lepsb2.denom_sum_simul_erab,0,null,(lepsb2.sum_simul_erab_qci_2/lepsb2.denom_sum_simul_erab))) LTE_5395a,
    to_number(lepsb2.simul_erab_qci2_max) LTE_5611a,
    to_number(decode(lepsb2.denom_sum_simul_erab,0,null,(lepsb2.sum_simul_erab_qci_3/lepsb2.denom_sum_simul_erab))) LTE_5396a,
    to_number(lepsb2.simul_erab_qci3_max) LTE_5612a,
    to_number(decode(lepsb2.denom_sum_simul_erab,0,null,(lepsb2.sum_simul_erab_qci_4/lepsb2.denom_sum_simul_erab))) LTE_5397a,
    to_number(lepsb2.simul_erab_qci4_max) LTE_5613a,
    to_number(decode(lepsb2.denom_sum_simul_erab,0,null,(lepsb2.sum_simul_erab_qci_5/lepsb2.denom_sum_simul_erab))) LTE_5398a,
    to_number(lepsb2.simul_erab_qci5_max) LTE_5614a,
    to_number(decode(lepsb2.denom_sum_simul_erab,0,null,(lepsb2.sum_simul_erab_qci_6/lepsb2.denom_sum_simul_erab))) LTE_5399a,
    to_number(lepsb2.simul_erab_qci6_max) LTE_5615a,
    to_number(decode(lepsb2.denom_sum_simul_erab,0,null,(lepsb2.sum_simul_erab_qci_7/lepsb2.denom_sum_simul_erab))) LTE_5400a,
    to_number(lepsb2.simul_erab_qci7_max) LTE_5616a,
    to_number(decode(lepsb2.denom_sum_simul_erab,0,null,(lepsb2.sum_simul_erab_qci_8/lepsb2.denom_sum_simul_erab))) LTE_5401a,
    to_number(lepsb2.simul_erab_qci8_max) LTE_5617a,
    to_number(decode(lepsb2.denom_sum_simul_erab,0,null,(lepsb2.sum_simul_erab_qci_9/lepsb2.denom_sum_simul_erab))) LTE_5402a,
    to_number(lepsb2.simul_erab_qci9_max) LTE_5618a,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_ina + lepsb2.erab_rel_enb_rnl_red + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5023g,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_ina + lepsb2.erab_rel_enb_rnl_red + lepsb2.erab_rel_enb_rnl_rrna + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0)) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5024g,
    to_number((lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0))) LTE_757e,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.epc_eps_bearer_rel_req_norm) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_758e,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.epc_eps_bearer_rel_req_detach) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_759e,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_ina) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_760e,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_red) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_761e,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.erab_rel_enb_rnl_rrna / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5587e,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.epc_eps_bearer_rel_req_rnl / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5237e,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.epc_eps_bearer_rel_req_oth / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5238e,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, nvl(lepsb2.erab_rel_epc_path_switch,0) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5783b,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.erab_rel_enb_rnl_uel / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5090e,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.erab_rel_enb_tnl_tru / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5091e,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb - lepsb2.erab_rel_enb_rnl_uel - lepsb2.erab_rel_enb_tnl_tru - lepsb2.erab_rel_ho_fail_tim - lepsb2.erab_rel_enb_rnl_ina - lepsb2.erab_rel_enb_rnl_red - lepsb2.erab_rel_enb_rnl_eugr - lepsb2.erab_rel_enb_rnl_rrna - lepsb2.erab_rel_enb_tnl_unsp - nvl(lepsb2.erab_rel_temp_qci1,0)) / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5092f,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.erab_rel_enb_rnl_eugr / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5703c,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.erab_rel_ho_fail_tim / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5704c,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.erab_rel_ho_part / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5705c,
    to_number(100*decode( (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.erab_rel_enb_tnl_unsp / (lepsb2.erab_rel_enb + lepsb2.erab_rel_ho_part + lepsb2.epc_eps_bearer_rel_req_norm + lepsb2.epc_eps_bearer_rel_req_detach + lepsb2.epc_eps_bearer_rel_req_rnl + lepsb2.epc_eps_bearer_rel_req_oth + nvl(lepsb2.erab_rel_epc_path_switch,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5765c,
    to_number(decode( (decode( (60*60),0,null, (lepsb2.erab_in_session_time_qci1 + lepsb2.erab_in_session_time_qci2 + lepsb2.erab_in_session_time_qci3 + lepsb2.erab_in_session_time_qci4 + lepsb2.erab_in_session_time_non_gbr) / (60*60))),0,null, (lepsb2.erab_rel_enb_act_qci1 + lepsb2.erab_rel_enb_act_qci2 + lepsb2.erab_rel_enb_act_qci3 + lepsb2.erab_rel_enb_act_qci4 + lepsb2.erab_rel_enb_act_non_gbr) / (decode( (60*60),0,null, (lepsb2.erab_in_session_time_qci1 + lepsb2.erab_in_session_time_qci2 + lepsb2.erab_in_session_time_qci3 + lepsb2.erab_in_session_time_qci4 + lepsb2.erab_in_session_time_non_gbr) / (60*60))))) LTE_5581b,
    to_number(decode( (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci1 / (60*60))),0,null, lepsb2.erab_rel_enb_act_qci1 / (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci1 / (60*60))))) LTE_5582b,
    to_number(decode( (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci2 / (60*60))),0,null, lepsb2.erab_rel_enb_act_qci2 / (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci2 / (60*60))))) LTE_5583b,
    to_number(decode( (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci3 / (60*60))),0,null, lepsb2.erab_rel_enb_act_qci3 / (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci3 / (60*60))))) LTE_5584b,
    to_number(decode( (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci4 / (60*60))),0,null, lepsb2.erab_rel_enb_act_qci4 / (decode( (60*60),0,null, lepsb2.erab_in_session_time_qci4 / (60*60))))) LTE_5585b,
    to_number(decode( (decode( (60*60),0,null, lepsb2.erab_in_session_time_non_gbr / (60*60))),0,null, lepsb2.erab_rel_enb_act_non_gbr / (decode( (60*60),0,null, lepsb2.erab_in_session_time_non_gbr / (60*60))))) LTE_5586b,
    to_number(100*decode( (lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_ina_qci1 + lepsb2.erab_rel_enb_rnl_red_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1) / (lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_5209d,
    to_number((lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0))) LTE_762d,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.epc_eps_bear_rel_req_n_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_763d,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.epc_eps_bear_rel_req_d_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_764d,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_ina_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_767d,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_red_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_771d,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_rrna_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0)))) LTE_1440b,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.epc_eps_bear_rel_req_r_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_765d,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.epc_eps_bear_rel_req_o_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_766d,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (nvl(lepsb2.erab_rel_epc_path_switch_qci1,0)) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_1514b,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_uel_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_1439c,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0)),0,null, (lepsb2.erab_rel_enb_rnl_eugr_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0)))) LTE_1441b,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_enb_tnl_tru_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_770d,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, lepsb2.erab_rel_enb_tnl_unsp_qci1 / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_1513c,
    to_number(100*decode( (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)),0,null, (lepsb2.erab_rel_ho_part_qci1) / (lepsb2.erab_rel_enb_qci1 + lepsb2.erab_rel_ho_part_qci1 + lepsb2.epc_eps_bear_rel_req_n_qci1 + lepsb2.epc_eps_bear_rel_req_d_qci1 + lepsb2.epc_eps_bear_rel_req_r_qci1 + lepsb2.epc_eps_bear_rel_req_o_qci1 + nvl(lepsb2.erab_rel_epc_path_switch_qci1,0) - nvl(lepsb2.erab_rel_temp_qci1,0)))) LTE_1445c,
    to_number(lepsb2.ERAB_IN_SESSION_TIME_QCI1 / 60) LTE_5576a,
    to_number(lepsb2.ERAB_IN_SESSION_TIME_QCI2 /60) LTE_5577a,
    to_number(lepsb2.ERAB_IN_SESSION_TIME_QCI3 / 60) LTE_5578a,
    to_number(lepsb2.ERAB_IN_SESSION_TIME_QCI4 / 60) LTE_5579a,
    to_number(lepsb2.ERAB_IN_SESSION_TIME_NON_GBR / 60) LTE_5580a,
    to_number(100*decode( (lcelld2.pdcch_init_order_att + lcelld2.d_preamb_pdcch_unavail),0,null, lcelld2.pdcch_order_success / (lcelld2.pdcch_init_order_att + lcelld2.d_preamb_pdcch_unavail))) LTE_5170a,
    to_number(lcelld2.pdcch_order_att) LTE_5167a,
    to_number(lcelld2.pdcch_init_order_att) LTE_5168a,
    to_number(100*decode( lcelld2.pdcch_init_order_att,0,null, lcelld2.pdcch_order_success / lcelld2.pdcch_init_order_att)) LTE_5169a,
    to_number((lcelld2.d_preamb_unavail - lcelld2.d_preamb_pdcch_unavail - lcelld2.d_preamb_ho_unavail)) LTE_5173a,
    to_number(lcelld2.d_preamb_pdcch_unavail) LTE_5171a,
    to_number(lcelld2.d_preamb_ho_unavail) LTE_5172a
from
    utp_common_objects plmn
                       ,
    (   select
    period_start_time,
    plmn_gid
  from
    (
        (
          select
            period_start_time, TO_CHAR(plmn_gid) plmn_gid
          from
            (       select
        a.period_start_time,
        a.plmn_gid,
        SUM(PDCCH_ORDER_ATT) PDCCH_ORDER_ATT,
        SUM(PDCCH_INIT_ORDER_ATT) PDCCH_INIT_ORDER_ATT,
        SUM(PDCCH_ORDER_SUCCESS) PDCCH_ORDER_SUCCESS,
        SUM(D_PREAMB_UNAVAIL) D_PREAMB_UNAVAIL,
        SUM(D_PREAMB_PDCCH_UNAVAIL) D_PREAMB_PDCCH_UNAVAIL,
        SUM(D_PREAMB_HO_UNAVAIL) D_PREAMB_HO_UNAVAIL
      from
        (
        select
        trunc( p.period_start_time, 'dd' ) period_start_time,
        "plmn".co_gid plmn_gid,
        "vloflnbtsparent".co_gid vloflnbtsparent_gid,
        "lnbts".co_gid lnbts_gid,
        SUM(PDCCH_ORDER_ATT) PDCCH_ORDER_ATT,
        SUM(PDCCH_INIT_ORDER_ATT) PDCCH_INIT_ORDER_ATT,
        SUM(PDCCH_ORDER_SUCCESS) PDCCH_ORDER_SUCCESS,
        SUM(D_PREAMB_UNAVAIL) D_PREAMB_UNAVAIL,
        SUM(D_PREAMB_PDCCH_UNAVAIL) D_PREAMB_PDCCH_UNAVAIL,
        SUM(D_PREAMB_HO_UNAVAIL) D_PREAMB_HO_UNAVAIL
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
      a.plmn_gid) jf_LCELLD2_3037802024
        )
    UNION
        (
          select
            period_start_time, TO_CHAR(plmn_gid) plmn_gid
          from
            (       select
        a.period_start_time,
        a.plmn_gid,
        SUM(EPS_BEARER_SETUP_ATTEMPTS) EPS_BEARER_SETUP_ATTEMPTS,
        SUM(EPS_BEARER_SETUP_COMPLETIONS) EPS_BEARER_SETUP_COMPLETIONS,
        SUM(EPS_BEARER_SETUP_FAIL_RNL) EPS_BEARER_SETUP_FAIL_RNL,
        SUM(EPS_BEARER_SETUP_FAIL_TRPORT) EPS_BEARER_SETUP_FAIL_TRPORT,
        SUM(EPS_BEARER_SETUP_FAIL_OTH) EPS_BEARER_SETUP_FAIL_OTH,
        SUM(EPC_EPS_BEARER_REL_REQ_NORM) EPC_EPS_BEARER_REL_REQ_NORM,
        SUM(EPC_EPS_BEARER_REL_REQ_DETACH) EPC_EPS_BEARER_REL_REQ_DETACH,
        SUM(EPC_EPS_BEARER_REL_REQ_RNL) EPC_EPS_BEARER_REL_REQ_RNL,
        SUM(EPC_EPS_BEARER_REL_REQ_OTH) EPC_EPS_BEARER_REL_REQ_OTH,
        SUM(EPS_BEARER_STP_ATT_INI_QCI_1) EPS_BEARER_STP_ATT_INI_QCI_1,
        SUM(EPS_BEAR_STP_ATT_INI_NON_GBR) EPS_BEAR_STP_ATT_INI_NON_GBR,
        SUM(EPS_BEARER_STP_ATT_ADD_QCI_1) EPS_BEARER_STP_ATT_ADD_QCI_1,
        SUM(EPS_BEARER_STP_COM_INI_QCI1) EPS_BEARER_STP_COM_INI_QCI1,
        SUM(EPS_BEAR_STP_COM_INI_NON_GBR) EPS_BEAR_STP_COM_INI_NON_GBR,
        SUM(EPS_BEAR_SET_COM_ADDIT_QCI1) EPS_BEAR_SET_COM_ADDIT_QCI1,
        SUM(SUM_SIMUL_ERAB_QCI_1) SUM_SIMUL_ERAB_QCI_1,
        SUM(SUM_SIMUL_ERAB_QCI_2) SUM_SIMUL_ERAB_QCI_2,
        SUM(SUM_SIMUL_ERAB_QCI_3) SUM_SIMUL_ERAB_QCI_3,
        SUM(SUM_SIMUL_ERAB_QCI_4) SUM_SIMUL_ERAB_QCI_4,
        SUM(SUM_SIMUL_ERAB_QCI_5) SUM_SIMUL_ERAB_QCI_5,
        SUM(SUM_SIMUL_ERAB_QCI_6) SUM_SIMUL_ERAB_QCI_6,
        SUM(SUM_SIMUL_ERAB_QCI_7) SUM_SIMUL_ERAB_QCI_7,
        SUM(SUM_SIMUL_ERAB_QCI_8) SUM_SIMUL_ERAB_QCI_8,
        SUM(SUM_SIMUL_ERAB_QCI_9) SUM_SIMUL_ERAB_QCI_9,
        SUM(DENOM_SUM_SIMUL_ERAB) DENOM_SUM_SIMUL_ERAB,
        SUM(ERAB_MOD_ATT_QCI1) ERAB_MOD_ATT_QCI1,
        SUM(ERAB_MOD_ATT_QCI2) ERAB_MOD_ATT_QCI2,
        SUM(ERAB_MOD_ATT_QCI3) ERAB_MOD_ATT_QCI3,
        SUM(ERAB_MOD_ATT_QCI4) ERAB_MOD_ATT_QCI4,
        SUM(ERAB_MOD_ATT_QCI5) ERAB_MOD_ATT_QCI5,
        SUM(ERAB_MOD_ATT_QCI6) ERAB_MOD_ATT_QCI6,
        SUM(ERAB_MOD_ATT_QCI7) ERAB_MOD_ATT_QCI7,
        SUM(ERAB_MOD_ATT_QCI8) ERAB_MOD_ATT_QCI8,
        SUM(ERAB_MOD_ATT_QCI9) ERAB_MOD_ATT_QCI9,
        SUM(ERAB_MOD_SUCC_QCI1) ERAB_MOD_SUCC_QCI1,
        SUM(ERAB_MOD_SUCC_QCI2) ERAB_MOD_SUCC_QCI2,
        SUM(ERAB_MOD_SUCC_QCI3) ERAB_MOD_SUCC_QCI3,
        SUM(ERAB_MOD_SUCC_QCI4) ERAB_MOD_SUCC_QCI4,
        SUM(ERAB_MOD_SUCC_QCI5) ERAB_MOD_SUCC_QCI5,
        SUM(ERAB_MOD_SUCC_QCI6) ERAB_MOD_SUCC_QCI6,
        SUM(ERAB_MOD_SUCC_QCI7) ERAB_MOD_SUCC_QCI7,
        SUM(ERAB_MOD_SUCC_QCI8) ERAB_MOD_SUCC_QCI8,
        SUM(ERAB_MOD_SUCC_QCI9) ERAB_MOD_SUCC_QCI9,
        SUM(ERAB_MOD_FAIL_TIMER) ERAB_MOD_FAIL_TIMER,
        SUM(ERAB_MOD_FAIL_QCI_NSUPP) ERAB_MOD_FAIL_QCI_NSUPP,
        SUM(ERAB_MOD_FAIL_RNL_UNSPEC) ERAB_MOD_FAIL_RNL_UNSPEC,
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
        SUM(ERAB_SETUP_ATT_HIPRIO) ERAB_SETUP_ATT_HIPRIO,
        SUM(ERAB_SETUP_SUCC_HIPRIO) ERAB_SETUP_SUCC_HIPRIO,
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
        MAX(SIMUL_ERAB_QCI1_MAX) SIMUL_ERAB_QCI1_MAX,
        MAX(SIMUL_ERAB_QCI2_MAX) SIMUL_ERAB_QCI2_MAX,
        MAX(SIMUL_ERAB_QCI3_MAX) SIMUL_ERAB_QCI3_MAX,
        MAX(SIMUL_ERAB_QCI4_MAX) SIMUL_ERAB_QCI4_MAX,
        MAX(SIMUL_ERAB_QCI5_MAX) SIMUL_ERAB_QCI5_MAX,
        MAX(SIMUL_ERAB_QCI6_MAX) SIMUL_ERAB_QCI6_MAX,
        MAX(SIMUL_ERAB_QCI7_MAX) SIMUL_ERAB_QCI7_MAX,
        MAX(SIMUL_ERAB_QCI8_MAX) SIMUL_ERAB_QCI8_MAX,
        MAX(SIMUL_ERAB_QCI9_MAX) SIMUL_ERAB_QCI9_MAX,
        SUM(ERAB_MOD_FAIL_RNL_RR_NA) ERAB_MOD_FAIL_RNL_RR_NA,
        SUM(ERAB_MOD_FAIL_TNL_TRU) ERAB_MOD_FAIL_TNL_TRU,
        SUM(ERAB_INI_SETUP_FAIL_RNL_RRNA) ERAB_INI_SETUP_FAIL_RNL_RRNA,
        SUM(ERAB_INI_SETUP_FAIL_TNL_TRU) ERAB_INI_SETUP_FAIL_TNL_TRU,
        SUM(ERAB_INI_SETUP_FAIL_RNL_UEL) ERAB_INI_SETUP_FAIL_RNL_UEL,
        SUM(ERAB_INI_SETUP_FAIL_RNL_RIP) ERAB_INI_SETUP_FAIL_RNL_RIP,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_RRNA) ERAB_ADD_SETUP_FAIL_RNL_RRNA,
        SUM(ERAB_ADD_SETUP_FAIL_TNL_TRU) ERAB_ADD_SETUP_FAIL_TNL_TRU,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_UEL) ERAB_ADD_SETUP_FAIL_RNL_UEL,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_RIP) ERAB_ADD_SETUP_FAIL_RNL_RIP,
        SUM(ERAB_ADD_SETUP_FAIL_UP) ERAB_ADD_SETUP_FAIL_UP,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_MOB) ERAB_ADD_SETUP_FAIL_RNL_MOB,
        SUM(ERAB_REL_ENB) ERAB_REL_ENB,
        SUM(ERAB_REL_ENB_RNL_INA) ERAB_REL_ENB_RNL_INA,
        SUM(ERAB_REL_ENB_RNL_UEL) ERAB_REL_ENB_RNL_UEL,
        SUM(ERAB_REL_ENB_TNL_TRU) ERAB_REL_ENB_TNL_TRU,
        SUM(ERAB_REL_ENB_RNL_RED) ERAB_REL_ENB_RNL_RED,
        SUM(ERAB_REL_ENB_RNL_EUGR) ERAB_REL_ENB_RNL_EUGR,
        SUM(ERAB_REL_ENB_RNL_RRNA) ERAB_REL_ENB_RNL_RRNA,
        SUM(ERAB_REL_HO_PART) ERAB_REL_HO_PART,
        SUM(ERAB_REL_HO_SUCC) ERAB_REL_HO_SUCC,
        SUM(ERAB_REL_HO_FAIL_TIM) ERAB_REL_HO_FAIL_TIM,
        SUM(ERAB_REL_ENB_QCI1) ERAB_REL_ENB_QCI1,
        SUM(ERAB_REL_ENB_RNL_INA_QCI1) ERAB_REL_ENB_RNL_INA_QCI1,
        SUM(ERAB_REL_ENB_RNL_UEL_QCI1) ERAB_REL_ENB_RNL_UEL_QCI1,
        SUM(ERAB_REL_ENB_TNL_TRU_QCI1) ERAB_REL_ENB_TNL_TRU_QCI1,
        SUM(ERAB_REL_ENB_RNL_RED_QCI1) ERAB_REL_ENB_RNL_RED_QCI1,
        SUM(ERAB_REL_ENB_RNL_EUGR_QCI1) ERAB_REL_ENB_RNL_EUGR_QCI1,
        SUM(ERAB_REL_ENB_RNL_RRNA_QCI1) ERAB_REL_ENB_RNL_RRNA_QCI1,
        SUM(ERAB_REL_HO_PART_QCI1) ERAB_REL_HO_PART_QCI1,
        SUM(ERAB_REL_EPC_PATH_SWITCH) ERAB_REL_EPC_PATH_SWITCH,
        SUM(ERAB_REL_EPC_PATH_SWITCH_QCI1) ERAB_REL_EPC_PATH_SWITCH_QCI1,
        SUM(ERAB_REL_ENB_TNL_UNSP) ERAB_REL_ENB_TNL_UNSP,
        SUM(ERAB_REL_ENB_TNL_UNSP_QCI1) ERAB_REL_ENB_TNL_UNSP_QCI1,
        SUM(ERAB_REL_TEMP_QCI1) ERAB_REL_TEMP_QCI1,
        SUM(ERAB_SUCC_RAC_TEMP_QCI1) ERAB_SUCC_RAC_TEMP_QCI1,
        SUM(ERAB_SUCC_TAC_TEMP_QCI1) ERAB_SUCC_TAC_TEMP_QCI1,
        SUM(ERAB_INI_SETUP_FAIL_NO_UE_LIC) ERAB_INI_SETUP_FAIL_NO_UE_LIC
      from
        (
      select
        trunc( p.period_start_time, 'dd' ) period_start_time,
        "plmn".co_gid plmn_gid,
        "vloflnbtsparent".co_gid vloflnbtsparent_gid,
        "lnbts".co_gid lnbts_gid,
        SUM(EPS_BEARER_SETUP_ATTEMPTS) EPS_BEARER_SETUP_ATTEMPTS,
        SUM(EPS_BEARER_SETUP_COMPLETIONS) EPS_BEARER_SETUP_COMPLETIONS,
        SUM(EPS_BEARER_SETUP_FAIL_RNL) EPS_BEARER_SETUP_FAIL_RNL,
        SUM(EPS_BEARER_SETUP_FAIL_TRPORT) EPS_BEARER_SETUP_FAIL_TRPORT,
        SUM(EPS_BEARER_SETUP_FAIL_OTH) EPS_BEARER_SETUP_FAIL_OTH,
        SUM(EPC_EPS_BEARER_REL_REQ_NORM) EPC_EPS_BEARER_REL_REQ_NORM,
        SUM(EPC_EPS_BEARER_REL_REQ_DETACH) EPC_EPS_BEARER_REL_REQ_DETACH,
        SUM(EPC_EPS_BEARER_REL_REQ_RNL) EPC_EPS_BEARER_REL_REQ_RNL,
        SUM(EPC_EPS_BEARER_REL_REQ_OTH) EPC_EPS_BEARER_REL_REQ_OTH,
        SUM(EPS_BEARER_STP_ATT_INI_QCI_1) EPS_BEARER_STP_ATT_INI_QCI_1,
        SUM(EPS_BEAR_STP_ATT_INI_NON_GBR) EPS_BEAR_STP_ATT_INI_NON_GBR,
        SUM(EPS_BEARER_STP_ATT_ADD_QCI_1) EPS_BEARER_STP_ATT_ADD_QCI_1,
        SUM(EPS_BEARER_STP_COM_INI_QCI1) EPS_BEARER_STP_COM_INI_QCI1,
        SUM(EPS_BEAR_STP_COM_INI_NON_GBR) EPS_BEAR_STP_COM_INI_NON_GBR,
        SUM(EPS_BEAR_SET_COM_ADDIT_QCI1) EPS_BEAR_SET_COM_ADDIT_QCI1,
        SUM(SUM_SIMUL_ERAB_QCI_1) SUM_SIMUL_ERAB_QCI_1,
        SUM(SUM_SIMUL_ERAB_QCI_2) SUM_SIMUL_ERAB_QCI_2,
        SUM(SUM_SIMUL_ERAB_QCI_3) SUM_SIMUL_ERAB_QCI_3,
        SUM(SUM_SIMUL_ERAB_QCI_4) SUM_SIMUL_ERAB_QCI_4,
        SUM(SUM_SIMUL_ERAB_QCI_5) SUM_SIMUL_ERAB_QCI_5,
        SUM(SUM_SIMUL_ERAB_QCI_6) SUM_SIMUL_ERAB_QCI_6,
        SUM(SUM_SIMUL_ERAB_QCI_7) SUM_SIMUL_ERAB_QCI_7,
        SUM(SUM_SIMUL_ERAB_QCI_8) SUM_SIMUL_ERAB_QCI_8,
        SUM(SUM_SIMUL_ERAB_QCI_9) SUM_SIMUL_ERAB_QCI_9,
        SUM(DENOM_SUM_SIMUL_ERAB) DENOM_SUM_SIMUL_ERAB,
        SUM(ERAB_MOD_ATT_QCI1) ERAB_MOD_ATT_QCI1,
        SUM(ERAB_MOD_ATT_QCI2) ERAB_MOD_ATT_QCI2,
        SUM(ERAB_MOD_ATT_QCI3) ERAB_MOD_ATT_QCI3,
        SUM(ERAB_MOD_ATT_QCI4) ERAB_MOD_ATT_QCI4,
        SUM(ERAB_MOD_ATT_QCI5) ERAB_MOD_ATT_QCI5,
        SUM(ERAB_MOD_ATT_QCI6) ERAB_MOD_ATT_QCI6,
        SUM(ERAB_MOD_ATT_QCI7) ERAB_MOD_ATT_QCI7,
        SUM(ERAB_MOD_ATT_QCI8) ERAB_MOD_ATT_QCI8,
        SUM(ERAB_MOD_ATT_QCI9) ERAB_MOD_ATT_QCI9,
        SUM(ERAB_MOD_SUCC_QCI1) ERAB_MOD_SUCC_QCI1,
        SUM(ERAB_MOD_SUCC_QCI2) ERAB_MOD_SUCC_QCI2,
        SUM(ERAB_MOD_SUCC_QCI3) ERAB_MOD_SUCC_QCI3,
        SUM(ERAB_MOD_SUCC_QCI4) ERAB_MOD_SUCC_QCI4,
        SUM(ERAB_MOD_SUCC_QCI5) ERAB_MOD_SUCC_QCI5,
        SUM(ERAB_MOD_SUCC_QCI6) ERAB_MOD_SUCC_QCI6,
        SUM(ERAB_MOD_SUCC_QCI7) ERAB_MOD_SUCC_QCI7,
        SUM(ERAB_MOD_SUCC_QCI8) ERAB_MOD_SUCC_QCI8,
        SUM(ERAB_MOD_SUCC_QCI9) ERAB_MOD_SUCC_QCI9,
        SUM(ERAB_MOD_FAIL_TIMER) ERAB_MOD_FAIL_TIMER,
        SUM(ERAB_MOD_FAIL_QCI_NSUPP) ERAB_MOD_FAIL_QCI_NSUPP,
        SUM(ERAB_MOD_FAIL_RNL_UNSPEC) ERAB_MOD_FAIL_RNL_UNSPEC,
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
        SUM(ERAB_SETUP_ATT_HIPRIO) ERAB_SETUP_ATT_HIPRIO,
        SUM(ERAB_SETUP_SUCC_HIPRIO) ERAB_SETUP_SUCC_HIPRIO,
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
        MAX(SIMUL_ERAB_QCI1_MAX) SIMUL_ERAB_QCI1_MAX,
        MAX(SIMUL_ERAB_QCI2_MAX) SIMUL_ERAB_QCI2_MAX,
        MAX(SIMUL_ERAB_QCI3_MAX) SIMUL_ERAB_QCI3_MAX,
        MAX(SIMUL_ERAB_QCI4_MAX) SIMUL_ERAB_QCI4_MAX,
        MAX(SIMUL_ERAB_QCI5_MAX) SIMUL_ERAB_QCI5_MAX,
        MAX(SIMUL_ERAB_QCI6_MAX) SIMUL_ERAB_QCI6_MAX,
        MAX(SIMUL_ERAB_QCI7_MAX) SIMUL_ERAB_QCI7_MAX,
        MAX(SIMUL_ERAB_QCI8_MAX) SIMUL_ERAB_QCI8_MAX,
        MAX(SIMUL_ERAB_QCI9_MAX) SIMUL_ERAB_QCI9_MAX,
        SUM(ERAB_MOD_FAIL_RNL_RR_NA) ERAB_MOD_FAIL_RNL_RR_NA,
        SUM(ERAB_MOD_FAIL_TNL_TRU) ERAB_MOD_FAIL_TNL_TRU,
        SUM(ERAB_INI_SETUP_FAIL_RNL_RRNA) ERAB_INI_SETUP_FAIL_RNL_RRNA,
        SUM(ERAB_INI_SETUP_FAIL_TNL_TRU) ERAB_INI_SETUP_FAIL_TNL_TRU,
        SUM(ERAB_INI_SETUP_FAIL_RNL_UEL) ERAB_INI_SETUP_FAIL_RNL_UEL,
        SUM(ERAB_INI_SETUP_FAIL_RNL_RIP) ERAB_INI_SETUP_FAIL_RNL_RIP,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_RRNA) ERAB_ADD_SETUP_FAIL_RNL_RRNA,
        SUM(ERAB_ADD_SETUP_FAIL_TNL_TRU) ERAB_ADD_SETUP_FAIL_TNL_TRU,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_UEL) ERAB_ADD_SETUP_FAIL_RNL_UEL,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_RIP) ERAB_ADD_SETUP_FAIL_RNL_RIP,
        SUM(ERAB_ADD_SETUP_FAIL_UP) ERAB_ADD_SETUP_FAIL_UP,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_MOB) ERAB_ADD_SETUP_FAIL_RNL_MOB,
        SUM(ERAB_REL_ENB) ERAB_REL_ENB,
        SUM(ERAB_REL_ENB_RNL_INA) ERAB_REL_ENB_RNL_INA,
        SUM(ERAB_REL_ENB_RNL_UEL) ERAB_REL_ENB_RNL_UEL,
        SUM(ERAB_REL_ENB_TNL_TRU) ERAB_REL_ENB_TNL_TRU,
        SUM(ERAB_REL_ENB_RNL_RED) ERAB_REL_ENB_RNL_RED,
        SUM(ERAB_REL_ENB_RNL_EUGR) ERAB_REL_ENB_RNL_EUGR,
        SUM(ERAB_REL_ENB_RNL_RRNA) ERAB_REL_ENB_RNL_RRNA,
        SUM(ERAB_REL_HO_PART) ERAB_REL_HO_PART,
        SUM(ERAB_REL_HO_SUCC) ERAB_REL_HO_SUCC,
        SUM(ERAB_REL_HO_FAIL_TIM) ERAB_REL_HO_FAIL_TIM,
        SUM(ERAB_REL_ENB_QCI1) ERAB_REL_ENB_QCI1,
        SUM(ERAB_REL_ENB_RNL_INA_QCI1) ERAB_REL_ENB_RNL_INA_QCI1,
        SUM(ERAB_REL_ENB_RNL_UEL_QCI1) ERAB_REL_ENB_RNL_UEL_QCI1,
        SUM(ERAB_REL_ENB_TNL_TRU_QCI1) ERAB_REL_ENB_TNL_TRU_QCI1,
        SUM(ERAB_REL_ENB_RNL_RED_QCI1) ERAB_REL_ENB_RNL_RED_QCI1,
        SUM(ERAB_REL_ENB_RNL_EUGR_QCI1) ERAB_REL_ENB_RNL_EUGR_QCI1,
        SUM(ERAB_REL_ENB_RNL_RRNA_QCI1) ERAB_REL_ENB_RNL_RRNA_QCI1,
        SUM(ERAB_REL_HO_PART_QCI1) ERAB_REL_HO_PART_QCI1,
        SUM(ERAB_REL_EPC_PATH_SWITCH) ERAB_REL_EPC_PATH_SWITCH,
        SUM(ERAB_REL_EPC_PATH_SWITCH_QCI1) ERAB_REL_EPC_PATH_SWITCH_QCI1,
        SUM(ERAB_REL_ENB_TNL_UNSP) ERAB_REL_ENB_TNL_UNSP,
        SUM(ERAB_REL_ENB_TNL_UNSP_QCI1) ERAB_REL_ENB_TNL_UNSP_QCI1,
        SUM(ERAB_REL_TEMP_QCI1) ERAB_REL_TEMP_QCI1,
        SUM(ERAB_SUCC_RAC_TEMP_QCI1) ERAB_SUCC_RAC_TEMP_QCI1,
        SUM(ERAB_SUCC_TAC_TEMP_QCI1) ERAB_SUCC_TAC_TEMP_QCI1,
        SUM(ERAB_INI_SETUP_FAIL_NO_UE_LIC) ERAB_INI_SETUP_FAIL_NO_UE_LIC
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
      a.plmn_gid) jf_LEPSB2_3017922837
        )
    UNION
        (
          select
            period_start_time, TO_CHAR(plmn_gid) plmn_gid
          from
            (       select
        a.period_start_time,
        a.plmn_gid,
        SUM(DATA_RB_STP_ATT) DATA_RB_STP_ATT,
        SUM(DATA_RB_STP_COMP) DATA_RB_STP_COMP,
        SUM(DATA_RB_STP_FAIL) DATA_RB_STP_FAIL,
        AVG(DECODE(ERAB_SETUP_TIME_MEAN,0,NULL,ERAB_SETUP_TIME_MEAN)) ERAB_SETUP_TIME_MEAN,
        MAX(ERAB_SETUP_TIME_MAX) ERAB_SETUP_TIME_MAX
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(DATA_RB_STP_ATT) DATA_RB_STP_ATT,
          SUM(DATA_RB_STP_COMP) DATA_RB_STP_COMP,
          SUM(DATA_RB_STP_FAIL) DATA_RB_STP_FAIL,
          AVG(DECODE(ERAB_SETUP_TIME_MEAN,0,NULL,ERAB_SETUP_TIME_MEAN)) ERAB_SETUP_TIME_MEAN,
          MAX(ERAB_SETUP_TIME_MAX) ERAB_SETUP_TIME_MAX
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
      a.plmn_gid) jf_LRDB2_3093675782
        )
    UNION
        (
          select
            period_start_time, TO_CHAR(plmn_gid) plmn_gid
          from
            (       select
        a.period_start_time,
        a.plmn_gid,
        SUM(REJ_RRC_CONN_RE_ESTAB) REJ_RRC_CONN_RE_ESTAB,
        SUM(RRC_CON_RE_ESTAB_ATT) RRC_CON_RE_ESTAB_ATT,
        SUM(RRC_CON_RE_ESTAB_SUCC) RRC_CON_RE_ESTAB_SUCC,
        SUM(RRC_CON_RE_ESTAB_ATT_HO_FAIL) RRC_CON_RE_ESTAB_ATT_HO_FAIL,
        SUM(RRC_CON_RE_ESTAB_ATT_OTHER) RRC_CON_RE_ESTAB_ATT_OTHER,
        AVG(DECODE(RRC_CON_STP_TIM_MEAN,0,NULL,RRC_CON_STP_TIM_MEAN)) RRC_CON_STP_TIM_MEAN,
        MAX(RRC_CON_STP_TIM_MAX) RRC_CON_STP_TIM_MAX
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(REJ_RRC_CONN_RE_ESTAB) REJ_RRC_CONN_RE_ESTAB,
          SUM(RRC_CON_RE_ESTAB_ATT) RRC_CON_RE_ESTAB_ATT,
          SUM(RRC_CON_RE_ESTAB_SUCC) RRC_CON_RE_ESTAB_SUCC,
          SUM(RRC_CON_RE_ESTAB_ATT_HO_FAIL) RRC_CON_RE_ESTAB_ATT_HO_FAIL,
          SUM(RRC_CON_RE_ESTAB_ATT_OTHER) RRC_CON_RE_ESTAB_ATT_OTHER,
          AVG(DECODE(RRC_CON_STP_TIM_MEAN,0,NULL,RRC_CON_STP_TIM_MEAN)) RRC_CON_STP_TIM_MEAN,
          MAX(RRC_CON_STP_TIM_MAX) RRC_CON_STP_TIM_MAX
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
      a.plmn_gid) jf_LRRC2_3054626997
        )
    UNION
        (
          select
            period_start_time, TO_CHAR(plmn_gid) plmn_gid
          from
            (       select
        a.period_start_time,
        a.plmn_gid,
        SUM(SIGN_CONN_ESTAB_COMP) SIGN_CONN_ESTAB_COMP,
        SUM(SIGN_EST_F_RRCCOMPL_MISSING) SIGN_EST_F_RRCCOMPL_MISSING,
        SUM(SIGN_EST_F_RRCCOMPL_ERROR) SIGN_EST_F_RRCCOMPL_ERROR,
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
        SUM(SIGN_CONN_ESTAB_FAIL_RB_EMG) SIGN_CONN_ESTAB_FAIL_RB_EMG,
        SUM(PRE_EMPT_UE_CONTEXT_NON_GBR) PRE_EMPT_UE_CONTEXT_NON_GBR,
        SUM(SIGN_CONN_ESTAB_REJ_EMG) SIGN_CONN_ESTAB_REJ_EMG,
        SUM(SIGN_CONN_ESTAB_ATT_HIPRIO) SIGN_CONN_ESTAB_ATT_HIPRIO,
        SUM(SIGN_CONN_ESTAB_SUCC_HIPRIO) SIGN_CONN_ESTAB_SUCC_HIPRIO,
        SUM(SIGN_CONN_ESTAB_REJ_HIPRIO) SIGN_CONN_ESTAB_REJ_HIPRIO,
        SUM(SIGN_CONN_ESTAB_ATT_DEL_TOL) SIGN_CONN_ESTAB_ATT_DEL_TOL,
        SUM(SIGN_CONN_ESTAB_SUCC_MO_S) SIGN_CONN_ESTAB_SUCC_MO_S,
        SUM(SIGN_CONN_ESTAB_SUCC_MO_D) SIGN_CONN_ESTAB_SUCC_MO_D,
        SUM(SIGN_CONN_ESTAB_SUCC_MT) SIGN_CONN_ESTAB_SUCC_MT,
        SUM(SIGN_CONN_ESTAB_SUCC_DEL_TOL) SIGN_CONN_ESTAB_SUCC_DEL_TOL,
        SUM(SIGN_CONN_ESTAB_REJ_MO_S) SIGN_CONN_ESTAB_REJ_MO_S,
        SUM(SIGN_CONN_ESTAB_REJ_MO_D) SIGN_CONN_ESTAB_REJ_MO_D,
        SUM(SIGN_CONN_ESTAB_REJ_MT) SIGN_CONN_ESTAB_REJ_MT,
        SUM(SIGN_CONN_ESTAB_REJ_DEL_TOL) SIGN_CONN_ESTAB_REJ_DEL_TOL,
        SUM(SIGN_CONN_ESTAB_FAIL_OVLCP) SIGN_CONN_ESTAB_FAIL_OVLCP,
        SUM(SIGN_CONN_ESTAB_FAIL_OVLUP) SIGN_CONN_ESTAB_FAIL_OVLUP,
        SUM(SIGN_CONN_ESTAB_FAIL_PUCCH) SIGN_CONN_ESTAB_FAIL_PUCCH,
        SUM(SIGN_CONN_ESTAB_FAIL_MAXRRC) SIGN_CONN_ESTAB_FAIL_MAXRRC,
        SUM(SIGN_CONN_ESTAB_FAIL_OVLMME) SIGN_CONN_ESTAB_FAIL_OVLMME
      from
        (
        select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(SIGN_CONN_ESTAB_COMP) SIGN_CONN_ESTAB_COMP,
          SUM(SIGN_EST_F_RRCCOMPL_MISSING) SIGN_EST_F_RRCCOMPL_MISSING,
          SUM(SIGN_EST_F_RRCCOMPL_ERROR) SIGN_EST_F_RRCCOMPL_ERROR,
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
          SUM(SIGN_CONN_ESTAB_FAIL_RB_EMG) SIGN_CONN_ESTAB_FAIL_RB_EMG,
          SUM(PRE_EMPT_UE_CONTEXT_NON_GBR) PRE_EMPT_UE_CONTEXT_NON_GBR,
          SUM(SIGN_CONN_ESTAB_REJ_EMG) SIGN_CONN_ESTAB_REJ_EMG,
          SUM(SIGN_CONN_ESTAB_ATT_HIPRIO) SIGN_CONN_ESTAB_ATT_HIPRIO,
          SUM(SIGN_CONN_ESTAB_SUCC_HIPRIO) SIGN_CONN_ESTAB_SUCC_HIPRIO,
          SUM(SIGN_CONN_ESTAB_REJ_HIPRIO) SIGN_CONN_ESTAB_REJ_HIPRIO,
          SUM(SIGN_CONN_ESTAB_ATT_DEL_TOL) SIGN_CONN_ESTAB_ATT_DEL_TOL,
          SUM(SIGN_CONN_ESTAB_SUCC_MO_S) SIGN_CONN_ESTAB_SUCC_MO_S,
          SUM(SIGN_CONN_ESTAB_SUCC_MO_D) SIGN_CONN_ESTAB_SUCC_MO_D,
          SUM(SIGN_CONN_ESTAB_SUCC_MT) SIGN_CONN_ESTAB_SUCC_MT,
          SUM(SIGN_CONN_ESTAB_SUCC_DEL_TOL) SIGN_CONN_ESTAB_SUCC_DEL_TOL,
          SUM(SIGN_CONN_ESTAB_REJ_MO_S) SIGN_CONN_ESTAB_REJ_MO_S,
          SUM(SIGN_CONN_ESTAB_REJ_MO_D) SIGN_CONN_ESTAB_REJ_MO_D,
          SUM(SIGN_CONN_ESTAB_REJ_MT) SIGN_CONN_ESTAB_REJ_MT,
          SUM(SIGN_CONN_ESTAB_REJ_DEL_TOL) SIGN_CONN_ESTAB_REJ_DEL_TOL,
          SUM(SIGN_CONN_ESTAB_FAIL_OVLCP) SIGN_CONN_ESTAB_FAIL_OVLCP,
          SUM(SIGN_CONN_ESTAB_FAIL_OVLUP) SIGN_CONN_ESTAB_FAIL_OVLUP,
          SUM(SIGN_CONN_ESTAB_FAIL_PUCCH) SIGN_CONN_ESTAB_FAIL_PUCCH,
          SUM(SIGN_CONN_ESTAB_FAIL_MAXRRC) SIGN_CONN_ESTAB_FAIL_MAXRRC,
          SUM(SIGN_CONN_ESTAB_FAIL_OVLMME) SIGN_CONN_ESTAB_FAIL_OVLMME
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
      a.plmn_gid) jf_LUEST2_3086289760
        )
    ) p) ALLTABLES,
    (   select
      a.period_start_time,
        a.plmn_gid,
      SUM(PDCCH_ORDER_ATT) PDCCH_ORDER_ATT,
        SUM(PDCCH_INIT_ORDER_ATT) PDCCH_INIT_ORDER_ATT,
        SUM(PDCCH_ORDER_SUCCESS) PDCCH_ORDER_SUCCESS,
        SUM(D_PREAMB_UNAVAIL) D_PREAMB_UNAVAIL,
        SUM(D_PREAMB_PDCCH_UNAVAIL) D_PREAMB_PDCCH_UNAVAIL,
        SUM(D_PREAMB_HO_UNAVAIL) D_PREAMB_HO_UNAVAIL
    from
        (
      select
            trunc( p.period_start_time, 'dd' ) period_start_time,
            "plmn".co_gid plmn_gid,
            "vloflnbtsparent".co_gid vloflnbtsparent_gid,
            "lnbts".co_gid lnbts_gid,
              SUM(PDCCH_ORDER_ATT) PDCCH_ORDER_ATT,
            SUM(PDCCH_INIT_ORDER_ATT) PDCCH_INIT_ORDER_ATT,
            SUM(PDCCH_ORDER_SUCCESS) PDCCH_ORDER_SUCCESS,
            SUM(D_PREAMB_UNAVAIL) D_PREAMB_UNAVAIL,
            SUM(D_PREAMB_PDCCH_UNAVAIL) D_PREAMB_PDCCH_UNAVAIL,
            SUM(D_PREAMB_HO_UNAVAIL) D_PREAMB_HO_UNAVAIL
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
    a.plmn_gid) LCELLD2,
    (   select
      a.period_start_time,
        a.plmn_gid,
      SUM(EPS_BEARER_SETUP_ATTEMPTS) EPS_BEARER_SETUP_ATTEMPTS,
        SUM(EPS_BEARER_SETUP_COMPLETIONS) EPS_BEARER_SETUP_COMPLETIONS,
        SUM(EPS_BEARER_SETUP_FAIL_RNL) EPS_BEARER_SETUP_FAIL_RNL,
        SUM(EPS_BEARER_SETUP_FAIL_TRPORT) EPS_BEARER_SETUP_FAIL_TRPORT,
        SUM(EPS_BEARER_SETUP_FAIL_OTH) EPS_BEARER_SETUP_FAIL_OTH,
        SUM(EPC_EPS_BEARER_REL_REQ_NORM) EPC_EPS_BEARER_REL_REQ_NORM,
        SUM(EPC_EPS_BEARER_REL_REQ_DETACH) EPC_EPS_BEARER_REL_REQ_DETACH,
        SUM(EPC_EPS_BEARER_REL_REQ_RNL) EPC_EPS_BEARER_REL_REQ_RNL,
        SUM(EPC_EPS_BEARER_REL_REQ_OTH) EPC_EPS_BEARER_REL_REQ_OTH,
        SUM(EPS_BEARER_STP_ATT_INI_QCI_1) EPS_BEARER_STP_ATT_INI_QCI_1,
        SUM(EPS_BEAR_STP_ATT_INI_NON_GBR) EPS_BEAR_STP_ATT_INI_NON_GBR,
        SUM(EPS_BEARER_STP_ATT_ADD_QCI_1) EPS_BEARER_STP_ATT_ADD_QCI_1,
        SUM(EPS_BEARER_STP_COM_INI_QCI1) EPS_BEARER_STP_COM_INI_QCI1,
        SUM(EPS_BEAR_STP_COM_INI_NON_GBR) EPS_BEAR_STP_COM_INI_NON_GBR,
        SUM(EPS_BEAR_SET_COM_ADDIT_QCI1) EPS_BEAR_SET_COM_ADDIT_QCI1,
        SUM(SUM_SIMUL_ERAB_QCI_1) SUM_SIMUL_ERAB_QCI_1,
        SUM(SUM_SIMUL_ERAB_QCI_2) SUM_SIMUL_ERAB_QCI_2,
        SUM(SUM_SIMUL_ERAB_QCI_3) SUM_SIMUL_ERAB_QCI_3,
        SUM(SUM_SIMUL_ERAB_QCI_4) SUM_SIMUL_ERAB_QCI_4,
        SUM(SUM_SIMUL_ERAB_QCI_5) SUM_SIMUL_ERAB_QCI_5,
        SUM(SUM_SIMUL_ERAB_QCI_6) SUM_SIMUL_ERAB_QCI_6,
        SUM(SUM_SIMUL_ERAB_QCI_7) SUM_SIMUL_ERAB_QCI_7,
        SUM(SUM_SIMUL_ERAB_QCI_8) SUM_SIMUL_ERAB_QCI_8,
        SUM(SUM_SIMUL_ERAB_QCI_9) SUM_SIMUL_ERAB_QCI_9,
        SUM(DENOM_SUM_SIMUL_ERAB) DENOM_SUM_SIMUL_ERAB,
        SUM(ERAB_MOD_ATT_QCI1) ERAB_MOD_ATT_QCI1,
        SUM(ERAB_MOD_ATT_QCI2) ERAB_MOD_ATT_QCI2,
        SUM(ERAB_MOD_ATT_QCI3) ERAB_MOD_ATT_QCI3,
        SUM(ERAB_MOD_ATT_QCI4) ERAB_MOD_ATT_QCI4,
        SUM(ERAB_MOD_ATT_QCI5) ERAB_MOD_ATT_QCI5,
        SUM(ERAB_MOD_ATT_QCI6) ERAB_MOD_ATT_QCI6,
        SUM(ERAB_MOD_ATT_QCI7) ERAB_MOD_ATT_QCI7,
        SUM(ERAB_MOD_ATT_QCI8) ERAB_MOD_ATT_QCI8,
        SUM(ERAB_MOD_ATT_QCI9) ERAB_MOD_ATT_QCI9,
        SUM(ERAB_MOD_SUCC_QCI1) ERAB_MOD_SUCC_QCI1,
        SUM(ERAB_MOD_SUCC_QCI2) ERAB_MOD_SUCC_QCI2,
        SUM(ERAB_MOD_SUCC_QCI3) ERAB_MOD_SUCC_QCI3,
        SUM(ERAB_MOD_SUCC_QCI4) ERAB_MOD_SUCC_QCI4,
        SUM(ERAB_MOD_SUCC_QCI5) ERAB_MOD_SUCC_QCI5,
        SUM(ERAB_MOD_SUCC_QCI6) ERAB_MOD_SUCC_QCI6,
        SUM(ERAB_MOD_SUCC_QCI7) ERAB_MOD_SUCC_QCI7,
        SUM(ERAB_MOD_SUCC_QCI8) ERAB_MOD_SUCC_QCI8,
        SUM(ERAB_MOD_SUCC_QCI9) ERAB_MOD_SUCC_QCI9,
        SUM(ERAB_MOD_FAIL_TIMER) ERAB_MOD_FAIL_TIMER,
        SUM(ERAB_MOD_FAIL_QCI_NSUPP) ERAB_MOD_FAIL_QCI_NSUPP,
        SUM(ERAB_MOD_FAIL_RNL_UNSPEC) ERAB_MOD_FAIL_RNL_UNSPEC,
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
        SUM(ERAB_SETUP_ATT_HIPRIO) ERAB_SETUP_ATT_HIPRIO,
        SUM(ERAB_SETUP_SUCC_HIPRIO) ERAB_SETUP_SUCC_HIPRIO,
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
        MAX(SIMUL_ERAB_QCI1_MAX) SIMUL_ERAB_QCI1_MAX,
        MAX(SIMUL_ERAB_QCI2_MAX) SIMUL_ERAB_QCI2_MAX,
        MAX(SIMUL_ERAB_QCI3_MAX) SIMUL_ERAB_QCI3_MAX,
        MAX(SIMUL_ERAB_QCI4_MAX) SIMUL_ERAB_QCI4_MAX,
        MAX(SIMUL_ERAB_QCI5_MAX) SIMUL_ERAB_QCI5_MAX,
        MAX(SIMUL_ERAB_QCI6_MAX) SIMUL_ERAB_QCI6_MAX,
        MAX(SIMUL_ERAB_QCI7_MAX) SIMUL_ERAB_QCI7_MAX,
        MAX(SIMUL_ERAB_QCI8_MAX) SIMUL_ERAB_QCI8_MAX,
        MAX(SIMUL_ERAB_QCI9_MAX) SIMUL_ERAB_QCI9_MAX,
        SUM(ERAB_MOD_FAIL_RNL_RR_NA) ERAB_MOD_FAIL_RNL_RR_NA,
        SUM(ERAB_MOD_FAIL_TNL_TRU) ERAB_MOD_FAIL_TNL_TRU,
        SUM(ERAB_INI_SETUP_FAIL_RNL_RRNA) ERAB_INI_SETUP_FAIL_RNL_RRNA,
        SUM(ERAB_INI_SETUP_FAIL_TNL_TRU) ERAB_INI_SETUP_FAIL_TNL_TRU,
        SUM(ERAB_INI_SETUP_FAIL_RNL_UEL) ERAB_INI_SETUP_FAIL_RNL_UEL,
        SUM(ERAB_INI_SETUP_FAIL_RNL_RIP) ERAB_INI_SETUP_FAIL_RNL_RIP,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_RRNA) ERAB_ADD_SETUP_FAIL_RNL_RRNA,
        SUM(ERAB_ADD_SETUP_FAIL_TNL_TRU) ERAB_ADD_SETUP_FAIL_TNL_TRU,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_UEL) ERAB_ADD_SETUP_FAIL_RNL_UEL,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_RIP) ERAB_ADD_SETUP_FAIL_RNL_RIP,
        SUM(ERAB_ADD_SETUP_FAIL_UP) ERAB_ADD_SETUP_FAIL_UP,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_MOB) ERAB_ADD_SETUP_FAIL_RNL_MOB,
        SUM(ERAB_REL_ENB) ERAB_REL_ENB,
        SUM(ERAB_REL_ENB_RNL_INA) ERAB_REL_ENB_RNL_INA,
        SUM(ERAB_REL_ENB_RNL_UEL) ERAB_REL_ENB_RNL_UEL,
        SUM(ERAB_REL_ENB_TNL_TRU) ERAB_REL_ENB_TNL_TRU,
        SUM(ERAB_REL_ENB_RNL_RED) ERAB_REL_ENB_RNL_RED,
        SUM(ERAB_REL_ENB_RNL_EUGR) ERAB_REL_ENB_RNL_EUGR,
        SUM(ERAB_REL_ENB_RNL_RRNA) ERAB_REL_ENB_RNL_RRNA,
        SUM(ERAB_REL_HO_PART) ERAB_REL_HO_PART,
        SUM(ERAB_REL_HO_SUCC) ERAB_REL_HO_SUCC,
        SUM(ERAB_REL_HO_FAIL_TIM) ERAB_REL_HO_FAIL_TIM,
        SUM(ERAB_REL_ENB_QCI1) ERAB_REL_ENB_QCI1,
        SUM(ERAB_REL_ENB_RNL_INA_QCI1) ERAB_REL_ENB_RNL_INA_QCI1,
        SUM(ERAB_REL_ENB_RNL_UEL_QCI1) ERAB_REL_ENB_RNL_UEL_QCI1,
        SUM(ERAB_REL_ENB_TNL_TRU_QCI1) ERAB_REL_ENB_TNL_TRU_QCI1,
        SUM(ERAB_REL_ENB_RNL_RED_QCI1) ERAB_REL_ENB_RNL_RED_QCI1,
        SUM(ERAB_REL_ENB_RNL_EUGR_QCI1) ERAB_REL_ENB_RNL_EUGR_QCI1,
        SUM(ERAB_REL_ENB_RNL_RRNA_QCI1) ERAB_REL_ENB_RNL_RRNA_QCI1,
        SUM(ERAB_REL_HO_PART_QCI1) ERAB_REL_HO_PART_QCI1,
        SUM(ERAB_REL_EPC_PATH_SWITCH) ERAB_REL_EPC_PATH_SWITCH,
        SUM(ERAB_REL_EPC_PATH_SWITCH_QCI1) ERAB_REL_EPC_PATH_SWITCH_QCI1,
        SUM(ERAB_REL_ENB_TNL_UNSP) ERAB_REL_ENB_TNL_UNSP,
        SUM(ERAB_REL_ENB_TNL_UNSP_QCI1) ERAB_REL_ENB_TNL_UNSP_QCI1,
        SUM(ERAB_REL_TEMP_QCI1) ERAB_REL_TEMP_QCI1,
        SUM(ERAB_SUCC_RAC_TEMP_QCI1) ERAB_SUCC_RAC_TEMP_QCI1,
        SUM(ERAB_SUCC_TAC_TEMP_QCI1) ERAB_SUCC_TAC_TEMP_QCI1,
        SUM(ERAB_INI_SETUP_FAIL_NO_UE_LIC) ERAB_INI_SETUP_FAIL_NO_UE_LIC
    from
        (
    select
        trunc( p.period_start_time, 'dd' ) period_start_time,
        "plmn".co_gid plmn_gid,
        "vloflnbtsparent".co_gid vloflnbtsparent_gid,
        "lnbts".co_gid lnbts_gid,
          SUM(EPS_BEARER_SETUP_ATTEMPTS) EPS_BEARER_SETUP_ATTEMPTS,
        SUM(EPS_BEARER_SETUP_COMPLETIONS) EPS_BEARER_SETUP_COMPLETIONS,
        SUM(EPS_BEARER_SETUP_FAIL_RNL) EPS_BEARER_SETUP_FAIL_RNL,
        SUM(EPS_BEARER_SETUP_FAIL_TRPORT) EPS_BEARER_SETUP_FAIL_TRPORT,
        SUM(EPS_BEARER_SETUP_FAIL_OTH) EPS_BEARER_SETUP_FAIL_OTH,
        SUM(EPC_EPS_BEARER_REL_REQ_NORM) EPC_EPS_BEARER_REL_REQ_NORM,
        SUM(EPC_EPS_BEARER_REL_REQ_DETACH) EPC_EPS_BEARER_REL_REQ_DETACH,
        SUM(EPC_EPS_BEARER_REL_REQ_RNL) EPC_EPS_BEARER_REL_REQ_RNL,
        SUM(EPC_EPS_BEARER_REL_REQ_OTH) EPC_EPS_BEARER_REL_REQ_OTH,
        SUM(EPS_BEARER_STP_ATT_INI_QCI_1) EPS_BEARER_STP_ATT_INI_QCI_1,
        SUM(EPS_BEAR_STP_ATT_INI_NON_GBR) EPS_BEAR_STP_ATT_INI_NON_GBR,
        SUM(EPS_BEARER_STP_ATT_ADD_QCI_1) EPS_BEARER_STP_ATT_ADD_QCI_1,
        SUM(EPS_BEARER_STP_COM_INI_QCI1) EPS_BEARER_STP_COM_INI_QCI1,
        SUM(EPS_BEAR_STP_COM_INI_NON_GBR) EPS_BEAR_STP_COM_INI_NON_GBR,
        SUM(EPS_BEAR_SET_COM_ADDIT_QCI1) EPS_BEAR_SET_COM_ADDIT_QCI1,
        SUM(SUM_SIMUL_ERAB_QCI_1) SUM_SIMUL_ERAB_QCI_1,
        SUM(SUM_SIMUL_ERAB_QCI_2) SUM_SIMUL_ERAB_QCI_2,
        SUM(SUM_SIMUL_ERAB_QCI_3) SUM_SIMUL_ERAB_QCI_3,
        SUM(SUM_SIMUL_ERAB_QCI_4) SUM_SIMUL_ERAB_QCI_4,
        SUM(SUM_SIMUL_ERAB_QCI_5) SUM_SIMUL_ERAB_QCI_5,
        SUM(SUM_SIMUL_ERAB_QCI_6) SUM_SIMUL_ERAB_QCI_6,
        SUM(SUM_SIMUL_ERAB_QCI_7) SUM_SIMUL_ERAB_QCI_7,
        SUM(SUM_SIMUL_ERAB_QCI_8) SUM_SIMUL_ERAB_QCI_8,
        SUM(SUM_SIMUL_ERAB_QCI_9) SUM_SIMUL_ERAB_QCI_9,
        SUM(DENOM_SUM_SIMUL_ERAB) DENOM_SUM_SIMUL_ERAB,
        SUM(ERAB_MOD_ATT_QCI1) ERAB_MOD_ATT_QCI1,
        SUM(ERAB_MOD_ATT_QCI2) ERAB_MOD_ATT_QCI2,
        SUM(ERAB_MOD_ATT_QCI3) ERAB_MOD_ATT_QCI3,
        SUM(ERAB_MOD_ATT_QCI4) ERAB_MOD_ATT_QCI4,
        SUM(ERAB_MOD_ATT_QCI5) ERAB_MOD_ATT_QCI5,
        SUM(ERAB_MOD_ATT_QCI6) ERAB_MOD_ATT_QCI6,
        SUM(ERAB_MOD_ATT_QCI7) ERAB_MOD_ATT_QCI7,
        SUM(ERAB_MOD_ATT_QCI8) ERAB_MOD_ATT_QCI8,
        SUM(ERAB_MOD_ATT_QCI9) ERAB_MOD_ATT_QCI9,
        SUM(ERAB_MOD_SUCC_QCI1) ERAB_MOD_SUCC_QCI1,
        SUM(ERAB_MOD_SUCC_QCI2) ERAB_MOD_SUCC_QCI2,
        SUM(ERAB_MOD_SUCC_QCI3) ERAB_MOD_SUCC_QCI3,
        SUM(ERAB_MOD_SUCC_QCI4) ERAB_MOD_SUCC_QCI4,
        SUM(ERAB_MOD_SUCC_QCI5) ERAB_MOD_SUCC_QCI5,
        SUM(ERAB_MOD_SUCC_QCI6) ERAB_MOD_SUCC_QCI6,
        SUM(ERAB_MOD_SUCC_QCI7) ERAB_MOD_SUCC_QCI7,
        SUM(ERAB_MOD_SUCC_QCI8) ERAB_MOD_SUCC_QCI8,
        SUM(ERAB_MOD_SUCC_QCI9) ERAB_MOD_SUCC_QCI9,
        SUM(ERAB_MOD_FAIL_TIMER) ERAB_MOD_FAIL_TIMER,
        SUM(ERAB_MOD_FAIL_QCI_NSUPP) ERAB_MOD_FAIL_QCI_NSUPP,
        SUM(ERAB_MOD_FAIL_RNL_UNSPEC) ERAB_MOD_FAIL_RNL_UNSPEC,
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
        SUM(ERAB_SETUP_ATT_HIPRIO) ERAB_SETUP_ATT_HIPRIO,
        SUM(ERAB_SETUP_SUCC_HIPRIO) ERAB_SETUP_SUCC_HIPRIO,
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
        MAX(SIMUL_ERAB_QCI1_MAX) SIMUL_ERAB_QCI1_MAX,
        MAX(SIMUL_ERAB_QCI2_MAX) SIMUL_ERAB_QCI2_MAX,
        MAX(SIMUL_ERAB_QCI3_MAX) SIMUL_ERAB_QCI3_MAX,
        MAX(SIMUL_ERAB_QCI4_MAX) SIMUL_ERAB_QCI4_MAX,
        MAX(SIMUL_ERAB_QCI5_MAX) SIMUL_ERAB_QCI5_MAX,
        MAX(SIMUL_ERAB_QCI6_MAX) SIMUL_ERAB_QCI6_MAX,
        MAX(SIMUL_ERAB_QCI7_MAX) SIMUL_ERAB_QCI7_MAX,
        MAX(SIMUL_ERAB_QCI8_MAX) SIMUL_ERAB_QCI8_MAX,
        MAX(SIMUL_ERAB_QCI9_MAX) SIMUL_ERAB_QCI9_MAX,
        SUM(ERAB_MOD_FAIL_RNL_RR_NA) ERAB_MOD_FAIL_RNL_RR_NA,
        SUM(ERAB_MOD_FAIL_TNL_TRU) ERAB_MOD_FAIL_TNL_TRU,
        SUM(ERAB_INI_SETUP_FAIL_RNL_RRNA) ERAB_INI_SETUP_FAIL_RNL_RRNA,
        SUM(ERAB_INI_SETUP_FAIL_TNL_TRU) ERAB_INI_SETUP_FAIL_TNL_TRU,
        SUM(ERAB_INI_SETUP_FAIL_RNL_UEL) ERAB_INI_SETUP_FAIL_RNL_UEL,
        SUM(ERAB_INI_SETUP_FAIL_RNL_RIP) ERAB_INI_SETUP_FAIL_RNL_RIP,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_RRNA) ERAB_ADD_SETUP_FAIL_RNL_RRNA,
        SUM(ERAB_ADD_SETUP_FAIL_TNL_TRU) ERAB_ADD_SETUP_FAIL_TNL_TRU,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_UEL) ERAB_ADD_SETUP_FAIL_RNL_UEL,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_RIP) ERAB_ADD_SETUP_FAIL_RNL_RIP,
        SUM(ERAB_ADD_SETUP_FAIL_UP) ERAB_ADD_SETUP_FAIL_UP,
        SUM(ERAB_ADD_SETUP_FAIL_RNL_MOB) ERAB_ADD_SETUP_FAIL_RNL_MOB,
        SUM(ERAB_REL_ENB) ERAB_REL_ENB,
        SUM(ERAB_REL_ENB_RNL_INA) ERAB_REL_ENB_RNL_INA,
        SUM(ERAB_REL_ENB_RNL_UEL) ERAB_REL_ENB_RNL_UEL,
        SUM(ERAB_REL_ENB_TNL_TRU) ERAB_REL_ENB_TNL_TRU,
        SUM(ERAB_REL_ENB_RNL_RED) ERAB_REL_ENB_RNL_RED,
        SUM(ERAB_REL_ENB_RNL_EUGR) ERAB_REL_ENB_RNL_EUGR,
        SUM(ERAB_REL_ENB_RNL_RRNA) ERAB_REL_ENB_RNL_RRNA,
        SUM(ERAB_REL_HO_PART) ERAB_REL_HO_PART,
        SUM(ERAB_REL_HO_SUCC) ERAB_REL_HO_SUCC,
        SUM(ERAB_REL_HO_FAIL_TIM) ERAB_REL_HO_FAIL_TIM,
        SUM(ERAB_REL_ENB_QCI1) ERAB_REL_ENB_QCI1,
        SUM(ERAB_REL_ENB_RNL_INA_QCI1) ERAB_REL_ENB_RNL_INA_QCI1,
        SUM(ERAB_REL_ENB_RNL_UEL_QCI1) ERAB_REL_ENB_RNL_UEL_QCI1,
        SUM(ERAB_REL_ENB_TNL_TRU_QCI1) ERAB_REL_ENB_TNL_TRU_QCI1,
        SUM(ERAB_REL_ENB_RNL_RED_QCI1) ERAB_REL_ENB_RNL_RED_QCI1,
        SUM(ERAB_REL_ENB_RNL_EUGR_QCI1) ERAB_REL_ENB_RNL_EUGR_QCI1,
        SUM(ERAB_REL_ENB_RNL_RRNA_QCI1) ERAB_REL_ENB_RNL_RRNA_QCI1,
        SUM(ERAB_REL_HO_PART_QCI1) ERAB_REL_HO_PART_QCI1,
        SUM(ERAB_REL_EPC_PATH_SWITCH) ERAB_REL_EPC_PATH_SWITCH,
        SUM(ERAB_REL_EPC_PATH_SWITCH_QCI1) ERAB_REL_EPC_PATH_SWITCH_QCI1,
        SUM(ERAB_REL_ENB_TNL_UNSP) ERAB_REL_ENB_TNL_UNSP,
        SUM(ERAB_REL_ENB_TNL_UNSP_QCI1) ERAB_REL_ENB_TNL_UNSP_QCI1,
        SUM(ERAB_REL_TEMP_QCI1) ERAB_REL_TEMP_QCI1,
        SUM(ERAB_SUCC_RAC_TEMP_QCI1) ERAB_SUCC_RAC_TEMP_QCI1,
        SUM(ERAB_SUCC_TAC_TEMP_QCI1) ERAB_SUCC_TAC_TEMP_QCI1,
        SUM(ERAB_INI_SETUP_FAIL_NO_UE_LIC) ERAB_INI_SETUP_FAIL_NO_UE_LIC
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
    a.plmn_gid) LEPSB2,
    (   select
      a.period_start_time,
      a.plmn_gid,
      SUM(DATA_RB_STP_ATT) DATA_RB_STP_ATT,
      SUM(DATA_RB_STP_COMP) DATA_RB_STP_COMP,
      SUM(DATA_RB_STP_FAIL) DATA_RB_STP_FAIL,
      AVG(DECODE(ERAB_SETUP_TIME_MEAN,0,NULL,ERAB_SETUP_TIME_MEAN)) ERAB_SETUP_TIME_MEAN,
      MAX(ERAB_SETUP_TIME_MAX) ERAB_SETUP_TIME_MAX
    from
      (
      select
          trunc( p.period_start_time, 'dd' ) period_start_time,
          "plmn".co_gid plmn_gid,
          "vloflnbtsparent".co_gid vloflnbtsparent_gid,
          "lnbts".co_gid lnbts_gid,
          SUM(DATA_RB_STP_ATT) DATA_RB_STP_ATT,
          SUM(DATA_RB_STP_COMP) DATA_RB_STP_COMP,
          SUM(DATA_RB_STP_FAIL) DATA_RB_STP_FAIL,
          AVG(DECODE(ERAB_SETUP_TIME_MEAN,0,NULL,ERAB_SETUP_TIME_MEAN)) ERAB_SETUP_TIME_MEAN,
          MAX(ERAB_SETUP_TIME_MAX) ERAB_SETUP_TIME_MAX
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
    a.plmn_gid) LRDB2,
    (   select
      a.period_start_time,
        a.plmn_gid,
      SUM(REJ_RRC_CONN_RE_ESTAB) REJ_RRC_CONN_RE_ESTAB,
        SUM(RRC_CON_RE_ESTAB_ATT) RRC_CON_RE_ESTAB_ATT,
        SUM(RRC_CON_RE_ESTAB_SUCC) RRC_CON_RE_ESTAB_SUCC,
        SUM(RRC_CON_RE_ESTAB_ATT_HO_FAIL) RRC_CON_RE_ESTAB_ATT_HO_FAIL,
        SUM(RRC_CON_RE_ESTAB_ATT_OTHER) RRC_CON_RE_ESTAB_ATT_OTHER,
        AVG(DECODE(RRC_CON_STP_TIM_MEAN,0,NULL,RRC_CON_STP_TIM_MEAN)) RRC_CON_STP_TIM_MEAN,
        MAX(RRC_CON_STP_TIM_MAX) RRC_CON_STP_TIM_MAX
    from
        (
      select
            trunc( p.period_start_time, 'dd' ) period_start_time,
            "plmn".co_gid plmn_gid,
            "vloflnbtsparent".co_gid vloflnbtsparent_gid,
            "lnbts".co_gid lnbts_gid,
            SUM(REJ_RRC_CONN_RE_ESTAB) REJ_RRC_CONN_RE_ESTAB,
            SUM(RRC_CON_RE_ESTAB_ATT) RRC_CON_RE_ESTAB_ATT,
            SUM(RRC_CON_RE_ESTAB_SUCC) RRC_CON_RE_ESTAB_SUCC,
            SUM(RRC_CON_RE_ESTAB_ATT_HO_FAIL) RRC_CON_RE_ESTAB_ATT_HO_FAIL,
            SUM(RRC_CON_RE_ESTAB_ATT_OTHER) RRC_CON_RE_ESTAB_ATT_OTHER,
            AVG(DECODE(RRC_CON_STP_TIM_MEAN,0,NULL,RRC_CON_STP_TIM_MEAN)) RRC_CON_STP_TIM_MEAN,
            MAX(RRC_CON_STP_TIM_MAX) RRC_CON_STP_TIM_MAX
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
    a.plmn_gid) LRRC2,
    (   select
      a.period_start_time,
        a.plmn_gid,
      SUM(SIGN_CONN_ESTAB_COMP) SIGN_CONN_ESTAB_COMP,
        SUM(SIGN_EST_F_RRCCOMPL_MISSING) SIGN_EST_F_RRCCOMPL_MISSING,
        SUM(SIGN_EST_F_RRCCOMPL_ERROR) SIGN_EST_F_RRCCOMPL_ERROR,
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
        SUM(SIGN_CONN_ESTAB_FAIL_RB_EMG) SIGN_CONN_ESTAB_FAIL_RB_EMG,
        SUM(PRE_EMPT_UE_CONTEXT_NON_GBR) PRE_EMPT_UE_CONTEXT_NON_GBR,
        SUM(SIGN_CONN_ESTAB_REJ_EMG) SIGN_CONN_ESTAB_REJ_EMG,
        SUM(SIGN_CONN_ESTAB_ATT_HIPRIO) SIGN_CONN_ESTAB_ATT_HIPRIO,
        SUM(SIGN_CONN_ESTAB_SUCC_HIPRIO) SIGN_CONN_ESTAB_SUCC_HIPRIO,
        SUM(SIGN_CONN_ESTAB_REJ_HIPRIO) SIGN_CONN_ESTAB_REJ_HIPRIO,
        SUM(SIGN_CONN_ESTAB_ATT_DEL_TOL) SIGN_CONN_ESTAB_ATT_DEL_TOL,
        SUM(SIGN_CONN_ESTAB_SUCC_MO_S) SIGN_CONN_ESTAB_SUCC_MO_S,
        SUM(SIGN_CONN_ESTAB_SUCC_MO_D) SIGN_CONN_ESTAB_SUCC_MO_D,
        SUM(SIGN_CONN_ESTAB_SUCC_MT) SIGN_CONN_ESTAB_SUCC_MT,
        SUM(SIGN_CONN_ESTAB_SUCC_DEL_TOL) SIGN_CONN_ESTAB_SUCC_DEL_TOL,
        SUM(SIGN_CONN_ESTAB_REJ_MO_S) SIGN_CONN_ESTAB_REJ_MO_S,
        SUM(SIGN_CONN_ESTAB_REJ_MO_D) SIGN_CONN_ESTAB_REJ_MO_D,
        SUM(SIGN_CONN_ESTAB_REJ_MT) SIGN_CONN_ESTAB_REJ_MT,
        SUM(SIGN_CONN_ESTAB_REJ_DEL_TOL) SIGN_CONN_ESTAB_REJ_DEL_TOL,
        SUM(SIGN_CONN_ESTAB_FAIL_OVLCP) SIGN_CONN_ESTAB_FAIL_OVLCP,
        SUM(SIGN_CONN_ESTAB_FAIL_OVLUP) SIGN_CONN_ESTAB_FAIL_OVLUP,
        SUM(SIGN_CONN_ESTAB_FAIL_PUCCH) SIGN_CONN_ESTAB_FAIL_PUCCH,
        SUM(SIGN_CONN_ESTAB_FAIL_MAXRRC) SIGN_CONN_ESTAB_FAIL_MAXRRC,
        SUM(SIGN_CONN_ESTAB_FAIL_OVLMME) SIGN_CONN_ESTAB_FAIL_OVLMME
    from
        (
      select
            trunc( p.period_start_time, 'dd' ) period_start_time,
            "plmn".co_gid plmn_gid,
            "vloflnbtsparent".co_gid vloflnbtsparent_gid,
            "lnbts".co_gid lnbts_gid,
            SUM(SIGN_CONN_ESTAB_COMP) SIGN_CONN_ESTAB_COMP,
            SUM(SIGN_EST_F_RRCCOMPL_MISSING) SIGN_EST_F_RRCCOMPL_MISSING,
            SUM(SIGN_EST_F_RRCCOMPL_ERROR) SIGN_EST_F_RRCCOMPL_ERROR,
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
            SUM(SIGN_CONN_ESTAB_FAIL_RB_EMG) SIGN_CONN_ESTAB_FAIL_RB_EMG,
            SUM(PRE_EMPT_UE_CONTEXT_NON_GBR) PRE_EMPT_UE_CONTEXT_NON_GBR,
            SUM(SIGN_CONN_ESTAB_REJ_EMG) SIGN_CONN_ESTAB_REJ_EMG,
            SUM(SIGN_CONN_ESTAB_ATT_HIPRIO) SIGN_CONN_ESTAB_ATT_HIPRIO,
            SUM(SIGN_CONN_ESTAB_SUCC_HIPRIO) SIGN_CONN_ESTAB_SUCC_HIPRIO,
            SUM(SIGN_CONN_ESTAB_REJ_HIPRIO) SIGN_CONN_ESTAB_REJ_HIPRIO,
            SUM(SIGN_CONN_ESTAB_ATT_DEL_TOL) SIGN_CONN_ESTAB_ATT_DEL_TOL,
            SUM(SIGN_CONN_ESTAB_SUCC_MO_S) SIGN_CONN_ESTAB_SUCC_MO_S,
            SUM(SIGN_CONN_ESTAB_SUCC_MO_D) SIGN_CONN_ESTAB_SUCC_MO_D,
            SUM(SIGN_CONN_ESTAB_SUCC_MT) SIGN_CONN_ESTAB_SUCC_MT,
            SUM(SIGN_CONN_ESTAB_SUCC_DEL_TOL) SIGN_CONN_ESTAB_SUCC_DEL_TOL,
            SUM(SIGN_CONN_ESTAB_REJ_MO_S) SIGN_CONN_ESTAB_REJ_MO_S,
            SUM(SIGN_CONN_ESTAB_REJ_MO_D) SIGN_CONN_ESTAB_REJ_MO_D,
            SUM(SIGN_CONN_ESTAB_REJ_MT) SIGN_CONN_ESTAB_REJ_MT,
            SUM(SIGN_CONN_ESTAB_REJ_DEL_TOL) SIGN_CONN_ESTAB_REJ_DEL_TOL,
            SUM(SIGN_CONN_ESTAB_FAIL_OVLCP) SIGN_CONN_ESTAB_FAIL_OVLCP,
            SUM(SIGN_CONN_ESTAB_FAIL_OVLUP) SIGN_CONN_ESTAB_FAIL_OVLUP,
            SUM(SIGN_CONN_ESTAB_FAIL_PUCCH) SIGN_CONN_ESTAB_FAIL_PUCCH,
            SUM(SIGN_CONN_ESTAB_FAIL_MAXRRC) SIGN_CONN_ESTAB_FAIL_MAXRRC,
            SUM(SIGN_CONN_ESTAB_FAIL_OVLMME) SIGN_CONN_ESTAB_FAIL_OVLMME
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
    a.plmn_gid) LUEST2
where
    plmn.co_gid = ALLTABLES.plmn_gid
    and ALLTABLES.period_start_time = LCELLD2.period_start_time (+) and ALLTABLES.plmn_gid = LCELLD2.plmn_gid (+) 
    and ALLTABLES.period_start_time = LEPSB2.period_start_time (+) and ALLTABLES.plmn_gid = LEPSB2.plmn_gid (+) 
    and ALLTABLES.period_start_time = LRDB2.period_start_time (+) and ALLTABLES.plmn_gid = LRDB2.plmn_gid (+) 
    and ALLTABLES.period_start_time = LRRC2.period_start_time (+) and ALLTABLES.plmn_gid = LRRC2.plmn_gid (+) 
    and ALLTABLES.period_start_time = LUEST2.period_start_time (+) and ALLTABLES.plmn_gid = LUEST2.plmn_gid (+) 

                           
order by
    2,1,3
