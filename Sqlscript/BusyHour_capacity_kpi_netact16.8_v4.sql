/*此脚本适用于Netact16.8版本，提取Busy_Hour数据*/

SELECT
    to_char(lcelld.period_start_time,'yyyymmdd') sdatetime
    
    --### for cells level ###
    ,lnbts.co_object_instance || '-' || lncel.co_object_instance enb_cell
    ,lnbts.co_object_instance enb_id
    ,lncel.co_object_instance cell_id
    
    ,cel.lncel_lcr_id lcr_id
    
    ,lcellr.busy_hour
    ---,lcellt.busy_hour
    ---,lcelld.busy_hour
    --,lnbts.co_main_host bts_ip  
    ,lnbts.co_sys_version bts_version
    
   --- ,Trim(lnbts.co_name) bts_name
    ,Trim(lncel.co_name) cell_name
    
    ,'' as City ---请用实际的城市替代
    ,'' as NetactID  ---请用实际的Netact名称替代
    ,'' as cell_property  ---请标注小区的属性，需要后期补充，因为Netact上不能创建临时表
        
    
    
    ,case when (lnbts.co_sys_version like 'LN%'  or lnbts.co_sys_version like 'FL%') then cel.lncel_earfcn_dl 
     else cel.lncel_earfcn 
     end as cell_earfcn  
     
    ,case when (lnbts.co_sys_version like 'LN%'  or lnbts.co_sys_version like 'FL%') then cel.lncel_dl_ch_bw/10
     else cel.lncel_ch_bw/10  
     end as cell_bw
     
   ,Round((lcellt.PDCP_SDU_VOL_UL)/1000000,4)   PDCP_SDU_VOL_UL_MB--16a不变                       
   ,Round((lcellt.PDCP_SDU_VOL_DL)/1000000,4)   PDCP_SDU_VOL_DL_MB--16a不变                       
   ,round((lcellr.DL_PRB_UTIL_TTI_MEAN)/10,2) AVG_DL_PRB_USAGE_TTI--16a不变                                      
   ,round((lcellr.UL_PRB_UTIL_TTI_MEAN)/10,2) AVG_UL_PRB_USAGE_TTI--16a不变  
   ,(lcelld.MEAN_PRB_AVAIL_PDSCH) as "MEAN_PRB_AVAIL_PDSCH"--16a不变  
   ,(lcelld.MEAN_PRB_AVAIL_PUSCH) as "MEAN_PRB_AVAIL_PUSCH"--16a不变   

   ,case when (lnbts.co_sys_version like '%16%'  or lnbts.co_sys_version like '%17%' or lnbts.co_sys_version like 'xL%') then round((lueq.RRC_CONNECTED_UE_MAX),0)
         else round((lcelld.RRC_CONN_UE_MAX),0) end as RRC_CONN_UE_MAX
   
   ,case when (lnbts.co_sys_version like '%16%'  or lnbts.co_sys_version like '%17%' or lnbts.co_sys_version like 'xL%') then round((lueq.RRC_CONNECTED_UE_AVG),0)
         else round((lcelld.RRC_CONN_UE_AVG),0) end as RRC_CONN_UE_AVG
   
   ,case when (lnbts.co_sys_version like '%16%'  or lnbts.co_sys_version like '%17%' or lnbts.co_sys_version like 'xL%') then   (lueq.CELL_LOAD_ACTIVE_UE_MAX)
         else   (lcelld.CELL_LOAD_ACT_UE_MAX)  end as CELL_LOAD_ACT_UE_MAX
           
     ,case when (lnbts.co_sys_version like '%16%'  or lnbts.co_sys_version like '%17%' or lnbts.co_sys_version like 'xL%') then    Round((lueq.CELL_LOAD_ACTIVE_UE_AVG),0)
           else  Round((lcelld.CELL_LOAD_ACT_UE_AVG),0) end as   CELL_LOAD_ACT_UE_AVG   
             
/*     ,case when (lnbts.co_sys_version like '%16%' and avg(M8051C107)>= avg(M8051C109)) then avg(M8051C107)/100
           when (lnbts.co_sys_version like '%16%' and avg(M8051C107)< avg(M8051C109)) then avg(M8051C109)/100
           when (lnbts.co_sys_version not like '%16%' and  lnbts.co_sys_version not like '%17%' and lnbts.co_sys_version not like '%LN7%' and avg(M8001C147)>= avg(M8001C150)) then avg(M8001C147)/100
           when (lnbts.co_sys_version not like '%16%' and  lnbts.co_sys_version not like '%17%' and lnbts.co_sys_version not like '%LN7%' and avg(M8001C147)< avg(M8001C150)) then avg(M8001C150)/100 
           else null end as 有效RRC连接平均数 */
   
        ,case when (lnbts.co_sys_version like '%16%' and (nvl(lueq.DL_UE_DATA_BUFFER_AVG,0))>= (nvl(lueq.UL_UE_DATA_BUFFER_AVG,0))) then (nvl(lueq.DL_UE_DATA_BUFFER_AVG,0))/100
           when (lnbts.co_sys_version like '%16%' and (nvl(lueq.DL_UE_DATA_BUFFER_AVG,0))< (nvl(lueq.UL_UE_DATA_BUFFER_AVG,0))) then (nvl(lueq.UL_UE_DATA_BUFFER_AVG,0))/100
           when (lnbts.co_sys_version not like '%16%' and  lnbts.co_sys_version not like '%17%' and lnbts.co_sys_version not like '%LN7%' and (nvl(lcelld.DL_UE_DATA_BUFF_AVG,0))>= (nvl(lcelld.UL_UE_DATA_BUFF_AVG,0))) then (nvl(lcelld.DL_UE_DATA_BUFF_AVG,0))/100
           when (lnbts.co_sys_version not like '%16%' and  lnbts.co_sys_version not like '%17%' and lnbts.co_sys_version not like '%LN7%' and (nvl(lcelld.DL_UE_DATA_BUFF_AVG,0))< (nvl(lcelld.UL_UE_DATA_BUFF_AVG,0))) then (nvl(lcelld.UL_UE_DATA_BUFF_AVG,0))/100 
           else null end as cmcc_effective_RRC_CONN_UE_AVG 
                
      ,case when (lnbts.co_sys_version like '%16%' and (lueq.DL_UE_DATA_BUFFER_MAX)>= (lueq.UL_UE_DATA_BUFFER_MAX)) then (lueq.DL_UE_DATA_BUFFER_MAX)
           when (lnbts.co_sys_version like '%16%' and (lueq.DL_UE_DATA_BUFFER_MAX)< (lueq.UL_UE_DATA_BUFFER_MAX)) then (lueq.UL_UE_DATA_BUFFER_MAX)
           when (lnbts.co_sys_version not like '%16%' and  lnbts.co_sys_version not like '%17%' and lnbts.co_sys_version not like '%LN7%' and (lcelld.DL_UE_DATA_BUFF_MAX)>= (lcelld.UL_UE_DATA_BUFF_MAX)) then (lcelld.DL_UE_DATA_BUFF_MAX)
           when (lnbts.co_sys_version not like '%16%' and  lnbts.co_sys_version not like '%17%' and lnbts.co_sys_version not like '%LN7%' and (lcelld.DL_UE_DATA_BUFF_MAX)< (lcelld.UL_UE_DATA_BUFF_MAX)) then (lcelld.UL_UE_DATA_BUFF_MAX) 
           else null end as cmcc_effective_RRC_CONN_UE_MAX 
     
   
  ,(lcellr.PDCCH_1_OFDM_SYMBOL) as PDCCH_1_OFDM_SYMBOL
  ,(lcellr.PDCCH_2_OFDM_SYMBOLS) as PDCCH_2_OFDM_SYMBOL
  ,(lcellr.PDCCH_3_OFDM_SYMBOLS) as PDCCH_3_OFDM_SYMBOL
  ,(lcellr.CCE_AVAIL_ACT_TTI) as "CCE_AVAIL_ACT_TTI"
  ,(lcellr.AGG1_USED_PDCCH*1+lcellr.AGG2_USED_PDCCH*2+lcellr.AGG4_USED_PDCCH*4+lcellr.AGG8_USED_PDCCH*8) as "PDCCH_cce_used"
  ,round(decode((lcellr.CCE_AVAIL_ACT_TTI),0,null,(lcellr.AGG1_USED_PDCCH*1+lcellr.AGG2_USED_PDCCH*2+lcellr.AGG4_USED_PDCCH*4+lcellr.AGG8_USED_PDCCH*8)/(lcellr.CCE_AVAIL_ACT_TTI))*100,2) as "PDCCH_CCE_Usage"
  
  ,round(decode((lcellr.AGG1_USED_PDCCH*1+lcellr.AGG2_USED_PDCCH*2+lcellr.AGG4_USED_PDCCH*4+lcellr.AGG8_USED_PDCCH*8+lcellr.AGG1_BLOCKED_PDCCH*1+lcellr.AGG2_BLOCKED_PDCCH*2+lcellr.AGG4_BLOCKED_PDCCH*4+lcellr.AGG8_BLOCKED_PDCCH*8),0,null,
                (lcellr.AGG1_BLOCKED_PDCCH*1+lcellr.AGG2_BLOCKED_PDCCH*2+lcellr.AGG4_BLOCKED_PDCCH*4+lcellr.AGG8_BLOCKED_PDCCH*8)/(lcellr.AGG1_USED_PDCCH*1+lcellr.AGG2_USED_PDCCH*2+lcellr.AGG4_USED_PDCCH*4+lcellr.AGG8_USED_PDCCH*8+lcellr.AGG1_BLOCKED_PDCCH*1+lcellr.AGG2_BLOCKED_PDCCH*2+lcellr.AGG4_BLOCKED_PDCCH*4+lcellr.AGG8_BLOCKED_PDCCH*8)*100),2) as "PDCCH_CCE_BLK_Rate"
  ,(lcellr.AGG1_BLOCKED_PDCCH) as "agg1_blocked_pdcch"
  ,(lcellr.AGG2_BLOCKED_PDCCH) as "agg2_blocked_pdcch"
  ,(lcellr.AGG4_BLOCKED_PDCCH) as "agg4_blocked_pdcch"
  ,(lcellr.AGG8_BLOCKED_PDCCH) as "agg8_blocked_pdcch"
     
    ,(nvl(lcellr.AGG1_USED_PDCCH,0)) AGG1_USED_PDCCH   --Total number of AGG1 used for PDCCH scheduling over the measurement period.
    ,(nvl(lcellr.AGG2_USED_PDCCH,0)) AGG2_USED_PDCCH   --Total number of AGG2 used for PDCCH scheduling over the measurement period.
    ,(nvl(lcellr.AGG4_USED_PDCCH,0)) AGG4_USED_PDCCH   --Total number of AGG4 used for PDCCH scheduling over the measurement period.
    ,(nvl(lcellr.AGG8_USED_PDCCH,0)) AGG8_USED_PDCCH   --Total number of AGG8 used for PDCCH scheduling over the measurement period.
    
    ,Round((lcelltday.PDCP_SDU_VOL_UL)/1000000,4) PDCP_SDU_VOL_UL_ALLDAY_MB
    ,Round((lcelltday.PDCP_SDU_VOL_DL)/1000000,4) PDCP_SDU_VOL_DL_ALLDAY_MB


/*
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
   ,(lepsb.ERAB_INI_SETUP_SUCC_QCI1+lepsb.ERAB_ADD_SETUP_SUCC_QCI1) as "ERAB_STP_ATT_num_qci1"--QCI1成功率分子
   ,(lepsb.ERAB_INI_SETUP_ATT_QCI1+lepsb.ERAB_ADD_SETUP_ATT_QCI1)  as "ERAB_STP_SUC_num_qci1"----QCI1成功率分母
   ,round((decode((lepsb.ERAB_INI_SETUP_ATT_QCI2+lepsb.ERAB_ADD_SETUP_ATT_QCI2),0,100,100*(lepsb.ERAB_INI_SETUP_SUCC_QCI2+lepsb.ERAB_ADD_SETUP_SUCC_QCI2)/(lepsb.ERAB_INI_SETUP_ATT_QCI2+lepsb.ERAB_ADD_SETUP_ATT_QCI2))),2) as "ERAB_STP_SR_QCI2"
   ,(lepsb.ERAB_INI_SETUP_SUCC_QCI2+lepsb.ERAB_ADD_SETUP_SUCC_QCI2) as "ERAB_STP_ATT_num_qci2"--QCI2成功率分子
   ,(lepsb.ERAB_INI_SETUP_ATT_QCI2+lepsb.ERAB_ADD_SETUP_ATT_QCI2)  as "ERAB_STP_SUC_num_qci2"----QCI2成功率分母
   ,round((decode((lepsb.ERAB_INI_SETUP_ATT_QCI5+lepsb.ERAB_ADD_SETUP_ATT_QCI5),0,100,100*(lepsb.ERAB_INI_SETUP_SUCC_QCI5+lepsb.ERAB_ADD_SETUP_SUCC_QCI5)/(lepsb.ERAB_INI_SETUP_ATT_QCI5+lepsb.ERAB_ADD_SETUP_ATT_QCI5))),2) as "ERAB_STP_SR_QCI5"
   ,(lepsb.ERAB_INI_SETUP_SUCC_QCI5+lepsb.ERAB_ADD_SETUP_SUCC_QCI5) as "ERAB_STP_ATT_num_qci5"--QCI5成功率分子
   ,(lepsb.ERAB_INI_SETUP_ATT_QCI5+lepsb.ERAB_ADD_SETUP_ATT_QCI5)  as "ERAB_STP_SUC_num_qci5"----QCI5成功率分母




   ,round((decode(((lepsb.ERAB_INI_SETUP_SUCC_QCI1+lepsb.ERAB_ADD_SETUP_SUCC_QCI1)+decode((lepsb.DENOM_SUM_SIMUL_ERAB),0,0,ceil((lepsb.SUM_SIMUL_ERAB_QCI_1)/(lepsb.DENOM_SUM_SIMUL_ERAB)))),0,0,(case when (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') THEN (lepsb.ERAB_REL_ENB_ACT_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_O_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_T_QCI1) else (lepsb.ERAB_REL_ENB_ACT_QCI1+lepsb.ERAB_REL_ENB_TNL_TRU_QCI1+lepsb.ERAB_REL_HO_PART_QCI1) end)/((lepsb.ERAB_INI_SETUP_SUCC_QCI1+lepsb.ERAB_ADD_SETUP_SUCC_QCI1)+decode((lepsb.DENOM_SUM_SIMUL_ERAB),0,0,ceil((lepsb.SUM_SIMUL_ERAB_QCI_1)/(lepsb.DENOM_SUM_SIMUL_ERAB))))))*100,2) as "ERAB_DCR_QCI1"
   ,case when (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') then (lepsb.ENB_EPS_BEAR_REL_REQ_N_QCI1+lepsb.ERAB_REL_ENB_ACT_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_O_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_T_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_RD_QCI1) else 
              (lepsb.ERAB_REL_ENB_RNL_INA_QCI1+lepsb.ERAB_REL_ENB_ACT_QCI1+lepsb.ERAB_REL_ENB_TNL_TRU_QCI1+lepsb.ERAB_REL_ENB_RNL_RED_QCI1) end as "eNB_req_rel_ERAB_QCI1"--分QCI的eNB请求释放的E-RAB数
   ,case when (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') then (lepsb.ENB_EPS_BEAR_REL_REQ_N_QCI1+lepsb.ENB_EPS_BEAR_REL_REQ_RD_QCI1) else 
              (lepsb.ERAB_REL_ENB_RNL_INA_QCI1+lepsb.ERAB_REL_ENB_RNL_RED_QCI1) end as "Normal_Rel_ERAB_QCI1"--分QCI的正常的eNB请求释放的E-RAB数              
   ,case when (lnbts.co_sys_version='LN7.0' OR lnbts.co_sys_version='LNT5.0') then 0 else 
              (lepsb.ERAB_REL_HO_PART_QCI1) end as "Ho_failure_QCI1"--分QCI的切出失败的E-RAB数         
   ,(lepsb.ERAB_INI_SETUP_SUCC_QCI1+lepsb.ERAB_ADD_SETUP_SUCC_QCI1) as "ERAB_STP_SUC_QCI1"
   ,decode((lepsb.DENOM_SUM_SIMUL_ERAB),0,0,ceil((lepsb.SUM_SIMUL_ERAB_QCI_1)/(lepsb.DENOM_SUM_SIMUL_ERAB))) as "Lest_ERAB_NUM_QCI1"--分QCI的遗留E-RAB个数
   
   
   ,decode(lisho.ISYS_HO_GERAN_SRVCC_ATT,0,100,round(100*(lisho.ISYS_HO_GERAN_SRVCC_SUCC)/(lisho.ISYS_HO_GERAN_SRVCC_ATT),2)) as "ESRVCC_HO_SR"
   ,(Lisho.ISYS_HO_GERAN_SRVCC_SUCC) as ISYS_HO_GERAN_SRVCC_SUCC
   ,(lisho.ISYS_HO_GERAN_SRVCC_ATT) as "ISYS_HO_GERAN_SRVCC_ATT"--eSRVCC切换成功率分母
   ,(lisho.ISYS_HO_GERAN_SRVCC_FAIL) as "ISYS_HO_GERAN_SRVCC_FAIL"--ISYS_HO_GERAN_SRVCC_ATT
   ,(lisho.ISYS_HO_PREP_FAIL_TIM) as ISYS_HO_PREP_FAIL_TIM--ISYS_HO_PREP_FAIL_TIM,Number of failed Inter System Handover preparations due to expiration of guarding timer.
   ,(lisho.ISYS_HO_PREP_FAIL_AC) as ISYS_HO_PREP_FAIL_ACM--ISYS_HO_PREP_FAIL_AC,Number of failed Inter System Handover preparations due to admission control of target cell.
   ,(lisho.ISYS_HO_PREP_FAIL_OTH) as ISYS_HO_PREP_FAIL_OTH--ISYS_HO_PREP_FAIL_OTH,Number of failed Inter System Handover preparations due to other reasons of target cell.

   ,(M8014C23+M8014C26+M8009C15) as "VoLTE切换请求次数"
   ,(M8014C24+M8014C27+M8009C16) as "VoLTE切换成功次数"
   ,round(decode((M8014C23+M8014C26+M8009C15),0,0,100*(M8014C24+M8014C27+M8009C16)/(M8014C23+M8014C26+M8009C15)),2) as "VoLTE切换成功率"
   

  
    ,round((decode((lepsb.DENOM_SUM_SIMUL_ERAB),0,0,(lepsb.SUM_SIMUL_ERAB_QCI_1)/(lepsb.DENOM_SUM_SIMUL_ERAB))),4) as "VoLTE_erls_NorthBound" 
    ,round(lepsb.ERAB_IN_SESSION_TIME_QCI1/(60*60),4) as "VoLTE_erls_2"
    
*/    
FROM
    NOKLTE_PS_LCELLD_LNCEL_bh lcelld
   ,Noklte_Ps_Lcellr_Lncel_bh lcellr
   ,Noklte_Ps_Lcellt_Lncel_bh lcellt
   ,Noklte_Ps_Lueq_Lncel_day  lueq
   ,NOKLTE_PS_LCELLT_LNCEL_day lcelltday
   /*
   ,Noklte_Ps_Lqos_Lncel_Hour  lqos
   ,NOKLTE_PS_LUEST_LNCEL_Hour luest
   ,NOKLTE_PS_LEPSB_LNCEL_hour  lepsb
   ,NOKLTE_PS_LISHO_LNCEL_hour  lisho
   */
   ,ctp_common_objects lnbts
   ,ctp_common_objects lncel
   ,c_lte_lncel cel

WHERE  
       lcelld.period_start_time >= to_date(&start,'yyyymmdd')
   and lcelld.period_start_time <= to_date(&end,'yyyymmdd')    
   ---and to_char(lcelld.period_start_time,'hh24') in (08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23)

    AND lcelld.LNCEL_ID=lncel.co_gid
    AND lncel.co_parent_gid = lnbts.co_gid
    /*项目需要根据自己的设置调整co_oc_id*/
    AND lnbts.co_oc_id=2249 AND lnbts.CO_STATE<>9  
    AND lncel.co_oc_id=2257 AND lncel.CO_STATE<>9   
    and cel.conf_id=1
    and cel.obj_gid=lncel.co_gid
    
    
    AND lcelld.period_start_time=lcellr.period_start_time(+) and lcelld.LNCEL_ID=lcellr.LNCEL_ID(+)
    AND lcelld.period_start_time=lcellt.period_start_time(+) and lcelld.LNCEL_ID=lcellt.LNCEL_ID(+)
    AND lcelld.period_start_time=lueq.period_start_time(+) and lcelld.LNCEL_ID=lueq.LNCEL_ID(+)
    AND lcelld.period_start_time=lcelltday.period_start_time(+) and lcelld.LNCEL_ID=lcelltday.lncel_id(+)
    /*
    AND lcelld.period_start_time=lqos.period_start_time(+) and lcelld.LNCEL_ID=lqos.LNCEL_ID(+)   
    AND lcelld.period_start_time=luest.period_start_time(+) and lcelld.LNCEL_ID=luest.LNCEL_ID(+)
    AND lcelld.period_start_time=lepsb.period_start_time(+) and lcelld.LNCEL_ID=lepsb.LNCEL_ID(+)
    AND lcelld.period_start_time=lisho.period_start_time(+) and lcelld.LNCEL_ID=lisho.LNCEL_ID(+)
    */
    ---and lnbts.co_object_instance in (69533) 
    --and lncel.co_object_instance=1
 
ORDER BY 
    to_char(lcelld.period_start_time,'yyyymmdd')
  
