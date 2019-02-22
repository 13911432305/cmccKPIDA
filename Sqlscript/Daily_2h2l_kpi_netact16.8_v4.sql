/*此脚本适用于Netact16.8版本，提取天级数据*/
/*2018-06-16: 修正分QCI的ERAB ATT&SUCC标示*/

SELECT
    to_char(lcelld.period_start_time,'yyyymmdd') sdatetime
    
    --### for cells level ###
    ,lnbts.co_object_instance || '-' || lncel.co_object_instance enb_cell
    ,lnbts.co_object_instance enb_id
    ,lncel.co_object_instance cell_id
    ,cel.lncel_lcr_id lcr_id
    --,lnbts.co_main_host bts_ip  
    ,lnbts.co_sys_version bts_version
    
   --- ,Trim(lnbts.co_name) bts_name
    ,Trim(lncel.co_name) cell_name
    
    ,'' as City ---请用实际的城市替代
    ,'' as NetactID  ---请用实际的Netact名称替代
---    ,' ' as cell_property  ---请标注小区的属性，需要后期补充，因为Netact上不能创建临时表
        
    
/*    
    ,case when (lnbts.co_sys_version like 'LN%'  or lnbts.co_sys_version like 'FL%') then cel.lncel_earfcn_dl 
     else cel.lncel_earfcn 
     end as cell_earfcn  
     
    ,case when (lnbts.co_sys_version like 'LN%'  or lnbts.co_sys_version like 'FL%') then cel.lncel_dl_ch_bw/10
     else cel.lncel_ch_bw/10  
     end as cell_bw
*/             

   ,round(decode((lcelld.PDCP_SDU_UL_QCI_1+lqos.PDCP_SDU_LOSS_UL_QCI_1_FNA),0,0,(lqos.PDCP_SDU_LOSS_UL_QCI_1_FNA)/(lcelld.PDCP_SDU_UL_QCI_1+lqos.PDCP_SDU_LOSS_UL_QCI_1_FNA))*100,4) as  "UL_packet_loss_rate_qci1"--PDCP上行丢包率QCI1
   ,(lqos.PDCP_SDU_LOSS_UL_QCI_1_FNA) as "PDCP_SDU_LOSS_UL_QCI_1_FNA"
   ,(lcelld.PDCP_SDU_UL_QCI_1+lqos.PDCP_SDU_LOSS_UL_QCI_1_FNA) as "PDCP_SDU_total_UL_QCI_1"

   ,round(decode((lcelld.PDCP_SDU_DL_QCI_1+lqos.PDCP_SDU_LOSS_DL_QCI_1_FNA),0,0,(lqos.PDCP_SDU_LOSS_DL_QCI_1_FNA)/(lcelld.PDCP_SDU_DL_QCI_1+lqos.PDCP_SDU_LOSS_DL_QCI_1_FNA))*100,4) as  "DL_packet_loss_rate_qci1"--PDCP下行丢包率QCI1
   ,(lqos.PDCP_SDU_LOSS_DL_QCI_1_FNA) as "PDCP_SDU_LOSS_DL_QCI_1_FNA"
   ,(lcelld.PDCP_SDU_DL_QCI_1+lqos.PDCP_SDU_LOSS_DL_QCI_1_FNA) as "PDCP_SDU_total_DL_QCI_1"


   ,Round(Decode((CASE WHEN (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') then 
           (luest.SIGN_CONN_ESTAB_ATT_MO_S+luest.SIGN_CONN_ESTAB_ATT_MT+luest.SIGN_CONN_ESTAB_ATT_MO_D+luest.SIGN_CONN_ESTAB_ATT_OTHERS+ luest.SIGN_CONN_ESTAB_ATT_EMG+ luest.SIGN_CONN_ESTAB_ATT_HIPRIO+ luest.SIGN_CONN_ESTAB_ATT_DEL_TOL) else 
           (luest.SIGN_CONN_ESTAB_ATT_MO_S+luest.SIGN_CONN_ESTAB_ATT_MT+luest.SIGN_CONN_ESTAB_ATT_MO_D+ luest.SIGN_CONN_ESTAB_ATT_EMG+ luest.SIGN_CONN_ESTAB_ATT_HIPRIO+ luest.SIGN_CONN_ESTAB_ATT_DEL_TOL) end),0,100,
           100*(luest.SIGN_CONN_ESTAB_COMP)/(CASE WHEN (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') then 
           (luest.SIGN_CONN_ESTAB_ATT_MO_S+luest.SIGN_CONN_ESTAB_ATT_MT+luest.SIGN_CONN_ESTAB_ATT_MO_D+luest.SIGN_CONN_ESTAB_ATT_OTHERS+ luest.SIGN_CONN_ESTAB_ATT_EMG+ luest.SIGN_CONN_ESTAB_ATT_HIPRIO+ luest.SIGN_CONN_ESTAB_ATT_DEL_TOL) else 
           (luest.SIGN_CONN_ESTAB_ATT_MO_S+luest.SIGN_CONN_ESTAB_ATT_MT+luest.SIGN_CONN_ESTAB_ATT_MO_D+ luest.SIGN_CONN_ESTAB_ATT_EMG+ luest.SIGN_CONN_ESTAB_ATT_HIPRIO+ luest.SIGN_CONN_ESTAB_ATT_DEL_TOL) end)),2) RRC_STP_SR --15a和16a一样 
   ,luest.SIGN_CONN_ESTAB_COMP   as RRC_STP_Suc_num  
   ,CASE WHEN (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') then 
           (luest.SIGN_CONN_ESTAB_ATT_MO_S+luest.SIGN_CONN_ESTAB_ATT_MT+luest.SIGN_CONN_ESTAB_ATT_MO_D+luest.SIGN_CONN_ESTAB_ATT_OTHERS+ luest.SIGN_CONN_ESTAB_ATT_EMG+ luest.SIGN_CONN_ESTAB_ATT_HIPRIO+ luest.SIGN_CONN_ESTAB_ATT_DEL_TOL) else 
           (luest.SIGN_CONN_ESTAB_ATT_MO_S+luest.SIGN_CONN_ESTAB_ATT_MT+luest.SIGN_CONN_ESTAB_ATT_MO_D+ luest.SIGN_CONN_ESTAB_ATT_EMG+ luest.SIGN_CONN_ESTAB_ATT_HIPRIO+ luest.SIGN_CONN_ESTAB_ATT_DEL_TOL) end as RRC_STP_ATT_num
   
   
   ,Round(Decode((lepsb.EPS_BEARER_SETUP_ATTEMPTS),0,100, (lepsb.EPS_BEARER_SETUP_COMPLETIONS)/(lepsb.EPS_BEARER_SETUP_ATTEMPTS)*100),2)  ERAB_STP_SR 
   ,lepsb.EPS_BEARER_SETUP_ATTEMPTS  as ERAB_STP_ATT_num
   ,lepsb.EPS_BEARER_SETUP_COMPLETIONS as ERAB_STP_SUC_num
   ,round((decode((lepsb.ERAB_INI_SETUP_ATT_QCI1+lepsb.ERAB_ADD_SETUP_ATT_QCI1),0,100,100*(lepsb.ERAB_INI_SETUP_SUCC_QCI1+lepsb.ERAB_ADD_SETUP_SUCC_QCI1)/(lepsb.ERAB_INI_SETUP_ATT_QCI1+lepsb.ERAB_ADD_SETUP_ATT_QCI1))),2) as "ERAB_STP_SR_QCI1"
   ,(lepsb.ERAB_INI_SETUP_SUCC_QCI1+lepsb.ERAB_ADD_SETUP_SUCC_QCI1)  as "ERAB_STP_SUC_num_qci1"
   ,(lepsb.ERAB_INI_SETUP_ATT_QCI1+lepsb.ERAB_ADD_SETUP_ATT_QCI1) as "ERAB_STP_ATT_num_qci1"

   ,round((decode((lepsb.ERAB_INI_SETUP_ATT_QCI2+lepsb.ERAB_ADD_SETUP_ATT_QCI2),0,100,100*(lepsb.ERAB_INI_SETUP_SUCC_QCI2+lepsb.ERAB_ADD_SETUP_SUCC_QCI2)/(lepsb.ERAB_INI_SETUP_ATT_QCI2+lepsb.ERAB_ADD_SETUP_ATT_QCI2))),2) as "ERAB_STP_SR_QCI2"
   ,(lepsb.ERAB_INI_SETUP_SUCC_QCI2+lepsb.ERAB_ADD_SETUP_SUCC_QCI2)  as "ERAB_STP_SUC_num_qci2"
   ,(lepsb.ERAB_INI_SETUP_ATT_QCI2+lepsb.ERAB_ADD_SETUP_ATT_QCI2) as "ERAB_STP_ATT_num_qci2"

   ,round((decode((lepsb.ERAB_INI_SETUP_ATT_QCI5+lepsb.ERAB_ADD_SETUP_ATT_QCI5),0,100,100*(lepsb.ERAB_INI_SETUP_SUCC_QCI5+lepsb.ERAB_ADD_SETUP_SUCC_QCI5)/(lepsb.ERAB_INI_SETUP_ATT_QCI5+lepsb.ERAB_ADD_SETUP_ATT_QCI5))),2) as "ERAB_STP_SR_QCI5"
   ,(lepsb.ERAB_INI_SETUP_SUCC_QCI5+lepsb.ERAB_ADD_SETUP_SUCC_QCI5)  as "ERAB_STP_SUC_num_qci5"
   ,(lepsb.ERAB_INI_SETUP_ATT_QCI5+lepsb.ERAB_ADD_SETUP_ATT_QCI5) as "ERAB_STP_ATT_num_qci5"



   ,round((decode(((lepsb.ERAB_INI_SETUP_SUCC_QCI1+lepsb.ERAB_ADD_SETUP_SUCC_QCI1)+decode((lepsb.DENOM_SUM_SIMUL_ERAB),0,0,ceil((lepsb.SUM_SIMUL_ERAB_QCI_1)/(lepsb.DENOM_SUM_SIMUL_ERAB)))),0,0,(case when (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') THEN (lepsb.ERAB_REL_ENB_ACT_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_O_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_T_QCI1) else (lepsb.ERAB_REL_ENB_ACT_QCI1+lepsb.ERAB_REL_ENB_TNL_TRU_QCI1+lepsb.ERAB_REL_HO_PART_QCI1) end)/((lepsb.ERAB_INI_SETUP_SUCC_QCI1+lepsb.ERAB_ADD_SETUP_SUCC_QCI1)+decode((lepsb.DENOM_SUM_SIMUL_ERAB),0,0,ceil((lepsb.SUM_SIMUL_ERAB_QCI_1)/(lepsb.DENOM_SUM_SIMUL_ERAB))))))*100,2) as "ERAB_DCR_QCI1"
   ,case when (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') then (lepsb.ENB_EPS_BEAR_REL_REQ_N_QCI1+lepsb.ERAB_REL_ENB_ACT_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_O_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_T_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_RD_QCI1) else 
              (lepsb.ERAB_REL_ENB_RNL_INA_QCI1+lepsb.ERAB_REL_ENB_ACT_QCI1+lepsb.ERAB_REL_ENB_TNL_TRU_QCI1+lepsb.ERAB_REL_ENB_RNL_RED_QCI1) end as "eNB_req_rel_ERAB_QCI1"--分QCI的eNB请求释放的E-RAB数
   ,case when (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') then (lepsb.ENB_EPS_BEAR_REL_REQ_N_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_RD_QCI1) else 
              (lepsb.ERAB_REL_ENB_RNL_INA_QCI1+lepsb.ERAB_REL_ENB_RNL_RED_QCI1) end as "Normal_Rel_ERAB_QCI1"--分QCI的正常的eNB请求释放的E-RAB数              
   ,case when (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') then 0 else 
              (lepsb.ERAB_REL_HO_PART_QCI1) end as "Ho_failure_QCI1"--分QCI的切出失败的E-RAB数         
   ,(lepsb.ERAB_INI_SETUP_SUCC_QCI1+lepsb.ERAB_ADD_SETUP_SUCC_QCI1) as "ERAB_STP_SUC_QCI1"
   ,decode((lepsb.DENOM_SUM_SIMUL_ERAB),0,0,ceil((lepsb.SUM_SIMUL_ERAB_QCI_1)/(lepsb.DENOM_SUM_SIMUL_ERAB))) as "last_period_ERAB_NUM_QCI1"--分QCI的遗留E-RAB个数
      
   ,(ERAB_REL_ENB_ACT_QCI1) as "ERAB_REL_ENB_ACT_QCI1"--Released active ERABs QCI1
   ,(ERAB_REL_ENB_RNL_INA_QCI1) as "ERAB_REL_ENB_RNL_INA_QCI1"--eNB initiated QCI1 E-RAB releases due to user inactivity
   ,ERAB_REL_ENB_RNL_UEL_QCI1 as ERAB_REL_ENB_RNL_UEL_QCI1
   ,ERAB_REL_ENB_RNL_RRNA_QCI1 as ERAB_REL_ENB_RNL_RRNA_QCI1
   ,(ERAB_REL_ENB_TNL_TRU_QCI1) as "ERAB_REL_ENB_TNL_TRU_QCI1"--eNB initiated QCI1 E-RAB releases due to insufficient transport resources
   ,(ERAB_REL_ENB_RNL_RED_QCI1) as "ERAB_REL_ENB_RNL_RED_QCI1"--eNB initiated QCI1 E-RAB releases due to redirect to another cell
   ,(ERAB_REL_HO_PART_QCI1) as "ERAB_REL_HO_PART_QCI1"--QCI1 E-RABs released due to partial Handover
     
   
   ,decode(lisho.ISYS_HO_GERAN_SRVCC_ATT,0,100,round(100*(lisho.ISYS_HO_GERAN_SRVCC_SUCC)/(lisho.ISYS_HO_GERAN_SRVCC_ATT),2)) as "ESRVCC_HO_SR"
   ,decode(lisho.ISYS_HO_GERAN_SRVCC_ATT,0,100,round(100*(lisho.ISYS_HO_GERAN_SRVCC_ATT-ISYS_HO_GERAN_SRVCC_FAIL)/(lisho.ISYS_HO_GERAN_SRVCC_ATT),2)) as "ESRVCC_HO_SR_northbound"
   ,(Lisho.ISYS_HO_GERAN_SRVCC_SUCC) as ISYS_HO_GERAN_SRVCC_SUCC
   ,(lisho.ISYS_HO_GERAN_SRVCC_ATT) as "ISYS_HO_GERAN_SRVCC_ATT"--eSRVCC切换成功率分母
   ,(lisho.ISYS_HO_GERAN_SRVCC_FAIL) as "ISYS_HO_GERAN_SRVCC_FAIL"--ISYS_HO_GERAN_SRVCC_ATT
   ,(lisho.ISYS_HO_PREP_FAIL_TIM) as ISYS_HO_PREP_FAIL_TIM--ISYS_HO_PREP_FAIL_TIM,Number of failed Inter System Handover preparations due to expiration of guarding timer.
   ,(lisho.ISYS_HO_PREP_FAIL_AC) as ISYS_HO_PREP_FAIL_ACM--ISYS_HO_PREP_FAIL_AC,Number of failed Inter System Handover preparations due to admission control of target cell.
   ,(lisho.ISYS_HO_PREP_FAIL_OTH) as ISYS_HO_PREP_FAIL_OTH--ISYS_HO_PREP_FAIL_OTH,Number of failed Inter System Handover preparations due to other reasons of target cell.

/*
   ,(M8014C23+M8014C26+M8009C15) as "VoLTE切换请求次数"
   ,(M8014C24+M8014C27+M8009C16) as "VoLTE切换成功次数"
   ,round(decode((M8014C23+M8014C26+M8009C15),0,0,100*(M8014C24+M8014C27+M8009C16)/(M8014C23+M8014C26+M8009C15)),2) as "VoLTE切换成功率"
   
*/ 
  
    ,round((decode((lepsb.DENOM_SUM_SIMUL_ERAB),0,0,(lepsb.SUM_SIMUL_ERAB_QCI_1)/(lepsb.DENOM_SUM_SIMUL_ERAB))),4) as "VoLTE_erls_NorthBound" 
    ,round(lepsb.ERAB_IN_SESSION_TIME_QCI1/(60*60*24),4) as "VoLTE_erls_2"
FROM
    NOKLTE_PS_LCELLD_LNCEL_DAY lcelld
--   ,Noklte_Ps_Lcellr_Lncel_Hour lcellr
---   ,Noklte_Ps_Lcellt_Lncel_Hour lcellt
   ,Noklte_Ps_Lqos_Lncel_Day  lqos
---   ,Noklte_Ps_Lueq_Lncel_Hour  lueq
   ,Noklte_Ps_Luest_Lncel_Day luest
   ,Noklte_Ps_Lepsb_Lncel_Day  lepsb
   ,Noklte_Ps_Lisho_Lncel_Day  lisho
   ,ctp_common_objects lnbts
   ,ctp_common_objects lncel
   ,c_lte_lncel cel

WHERE  
       lcelld.period_start_time >= to_date(&start,'yyyymmdd')
   and lcelld.period_start_time <=to_date(&end,'yyyymmdd')    
  

    AND lcelld.LNCEL_ID=lncel.co_gid
    AND lncel.co_parent_gid = lnbts.co_gid
    /*项目需要根据自己的设置调整co_oc_id*/
    AND lnbts.co_oc_id=2249 AND lnbts.CO_STATE<>9  
    AND lncel.co_oc_id=2257 AND lncel.CO_STATE<>9   
    and cel.conf_id=1
    and cel.obj_gid=lncel.co_gid
    
    
---    AND lcelld.period_start_time=lcellr.period_start_time(+) and lcelld.LNCEL_ID=lcellr.LNCEL_ID(+)
---    AND lcelld.period_start_time=lcellt.period_start_time(+) and lcelld.LNCEL_ID=lcellt.LNCEL_ID(+)
---    AND lcelld.period_start_time=lueq.period_start_time(+) and lcelld.LNCEL_ID=lueq.LNCEL_ID(+)
    AND lcelld.period_start_time=lqos.period_start_time(+) and lcelld.LNCEL_ID=lqos.LNCEL_ID(+)   
    AND lcelld.period_start_time=luest.period_start_time(+) and lcelld.LNCEL_ID=luest.LNCEL_ID(+)
    AND lcelld.period_start_time=lepsb.period_start_time(+) and lcelld.LNCEL_ID=lepsb.LNCEL_ID(+)
    AND lcelld.period_start_time=lisho.period_start_time(+) and lcelld.LNCEL_ID=lisho.LNCEL_ID(+)
    ---and lnbts.co_object_instance in (69533) 
    --and lncel.co_object_instance=1
 
ORDER BY 
    to_char(lcelld.period_start_time,'yyyymmdd')

  
