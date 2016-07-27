-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2014.2
-- Copyright (C) 2014 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity arraycopy is
generic (
    C_S_AXI_S_AXILITE_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_S_AXILITE_DATA_WIDTH : INTEGER := 32 );
port (
    s_axi_s_axilite_AWVALID : IN STD_LOGIC;
    s_axi_s_axilite_AWREADY : OUT STD_LOGIC;
    s_axi_s_axilite_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_S_AXILITE_ADDR_WIDTH-1 downto 0);
    s_axi_s_axilite_WVALID : IN STD_LOGIC;
    s_axi_s_axilite_WREADY : OUT STD_LOGIC;
    s_axi_s_axilite_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_S_AXILITE_DATA_WIDTH-1 downto 0);
    s_axi_s_axilite_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_S_AXILITE_DATA_WIDTH/8-1 downto 0);
    s_axi_s_axilite_ARVALID : IN STD_LOGIC;
    s_axi_s_axilite_ARREADY : OUT STD_LOGIC;
    s_axi_s_axilite_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_S_AXILITE_ADDR_WIDTH-1 downto 0);
    s_axi_s_axilite_RVALID : OUT STD_LOGIC;
    s_axi_s_axilite_RREADY : IN STD_LOGIC;
    s_axi_s_axilite_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_S_AXILITE_DATA_WIDTH-1 downto 0);
    s_axi_s_axilite_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_s_axilite_BVALID : OUT STD_LOGIC;
    s_axi_s_axilite_BREADY : IN STD_LOGIC;
    s_axi_s_axilite_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    A_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    A_TVALID : IN STD_LOGIC;
    A_TREADY : OUT STD_LOGIC;
    A_TSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
    A_TKEEP : IN STD_LOGIC_VECTOR (7 downto 0);
    A_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    A_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    A_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    A_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    B_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    B_TVALID : OUT STD_LOGIC;
    B_TREADY : IN STD_LOGIC;
    B_TSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    B_TKEEP : OUT STD_LOGIC_VECTOR (7 downto 0);
    B_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    B_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    B_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
    B_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of arraycopy is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "arraycopy,hls_ip_2014_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=8.500000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.518000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=0}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_ST_pp0_stg0_fsm_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_st4_fsm_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant C_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";

    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal ap_ready : STD_LOGIC;
    signal M : STD_LOGIC_VECTOR (31 downto 0);
    signal arraycopy_s_axilite_s_axi_U_ap_dummy_ce : STD_LOGIC;
    signal i_reg_141 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_153_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_302 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ppiten_pp0_it0 : STD_LOGIC := '0';
    signal ap_sig_bdd_92 : BOOLEAN;
    signal ap_sig_ioackin_B_TREADY : STD_LOGIC;
    signal ap_reg_ppiten_pp0_it1 : STD_LOGIC := '0';
    signal i_1_fu_158_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_dest_V_fu_64 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_id_V_fu_68 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_last_V_fu_72 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_user_V_fu_76 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_keep_V_fu_80 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_strb_V_fu_84 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_data_V_fu_88 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_reg_ioackin_B_TREADY : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);

    component arraycopy_s_axilite_s_axi IS
    generic (
        C_ADDR_WIDTH : INTEGER;
        C_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESETN : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC;
        M : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    arraycopy_s_axilite_s_axi_U : component arraycopy_s_axilite_s_axi
    generic map (
        C_ADDR_WIDTH => C_S_AXI_S_AXILITE_ADDR_WIDTH,
        C_DATA_WIDTH => C_S_AXI_S_AXILITE_DATA_WIDTH)
    port map (
        AWVALID => s_axi_s_axilite_AWVALID,
        AWREADY => s_axi_s_axilite_AWREADY,
        AWADDR => s_axi_s_axilite_AWADDR,
        WVALID => s_axi_s_axilite_WVALID,
        WREADY => s_axi_s_axilite_WREADY,
        WDATA => s_axi_s_axilite_WDATA,
        WSTRB => s_axi_s_axilite_WSTRB,
        ARVALID => s_axi_s_axilite_ARVALID,
        ARREADY => s_axi_s_axilite_ARREADY,
        ARADDR => s_axi_s_axilite_ARADDR,
        RVALID => s_axi_s_axilite_RVALID,
        RREADY => s_axi_s_axilite_RREADY,
        RDATA => s_axi_s_axilite_RDATA,
        RRESP => s_axi_s_axilite_RRESP,
        BVALID => s_axi_s_axilite_BVALID,
        BREADY => s_axi_s_axilite_BREADY,
        BRESP => s_axi_s_axilite_BRESP,
        ACLK => ap_clk,
        ARESETN => ap_rst_n,
        ACLK_EN => arraycopy_s_axilite_s_axi_U_ap_dummy_ce,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle,
        M => M);





    -- the current state (ap_CS_fsm) of the state machine. --
    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n = '0') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    -- ap_reg_ioackin_B_TREADY assign process. --
    ap_reg_ioackin_B_TREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n = '0') then
                ap_reg_ioackin_B_TREADY <= ap_const_logic_0;
            else
                if ((((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92) or (not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))))) then 
                    ap_reg_ioackin_B_TREADY <= ap_const_logic_0;
                elsif ((((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92)) and (ap_const_logic_1 = B_TREADY)))) then 
                    ap_reg_ioackin_B_TREADY <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it0 assign process. --
    ap_reg_ppiten_pp0_it0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n = '0') then
                ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
            else
                if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (tmp_fu_153_p2 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92) or (not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
                elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it1 assign process. --
    ap_reg_ppiten_pp0_it1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n = '0') then
                ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
            else
                if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and not((tmp_fu_153_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92) or (not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
                elsif ((((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0))) or ((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (tmp_fu_153_p2 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92) or (not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- i_reg_141 assign process. --
    i_reg_141_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((tmp_fu_153_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92) or (not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then 
                i_reg_141 <= i_1_fu_158_p2;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                i_reg_141 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((tmp_fu_153_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92) or (not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then
                tmp_data_V_fu_88 <= A_TDATA;
                tmp_dest_V_fu_64 <= A_TDEST;
                tmp_id_V_fu_68 <= A_TID;
                tmp_keep_V_fu_80 <= A_TKEEP;
                tmp_last_V_fu_72 <= A_TLAST;
                tmp_strb_V_fu_84 <= A_TSTRB;
                tmp_user_V_fu_76 <= A_TUSER;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92) or (not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then
                tmp_reg_302 <= tmp_fu_153_p2;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, tmp_fu_153_p2, tmp_reg_302, ap_reg_ppiten_pp0_it0, ap_sig_bdd_92, ap_sig_ioackin_B_TREADY, ap_reg_ppiten_pp0_it1)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_pp0_stg0_fsm_1 => 
                if (not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and (tmp_fu_153_p2 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92) or (not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_1;
                elsif (((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and (tmp_fu_153_p2 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92) or (not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then
                    ap_NS_fsm <= ap_ST_st4_fsm_2;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_1;
                end if;
            when ap_ST_st4_fsm_2 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;

    -- A_TREADY assign process. --
    A_TREADY_assign_proc : process(ap_CS_fsm, tmp_fu_153_p2, tmp_reg_302, ap_reg_ppiten_pp0_it0, ap_sig_bdd_92, ap_sig_ioackin_B_TREADY, ap_reg_ppiten_pp0_it1)
    begin
        if ((((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((tmp_fu_153_p2 = ap_const_lv1_0)) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92) or (not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_B_TREADY) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))))) then 
            A_TREADY <= ap_const_logic_1;
        else 
            A_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    B_TDATA <= tmp_data_V_fu_88;
    B_TDEST <= tmp_dest_V_fu_64;
    B_TID <= tmp_id_V_fu_68;
    B_TKEEP <= tmp_keep_V_fu_80;
    B_TLAST <= tmp_last_V_fu_72;
    B_TSTRB <= tmp_strb_V_fu_84;
    B_TUSER <= tmp_user_V_fu_76;

    -- B_TVALID assign process. --
    B_TVALID_assign_proc : process(ap_CS_fsm, tmp_reg_302, ap_reg_ppiten_pp0_it0, ap_sig_bdd_92, ap_reg_ppiten_pp0_it1, ap_reg_ioackin_B_TREADY)
    begin
        if ((((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and not((tmp_reg_302 = ap_const_lv1_0)) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and ap_sig_bdd_92)) and (ap_const_logic_0 = ap_reg_ioackin_B_TREADY)))) then 
            B_TVALID <= ap_const_logic_1;
        else 
            B_TVALID <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_st4_fsm_2 = ap_CS_fsm)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_idle assign process. --
    ap_idle_assign_proc : process(ap_start, ap_CS_fsm)
    begin
        if ((not((ap_const_logic_1 = ap_start)) and (ap_ST_st1_fsm_0 = ap_CS_fsm))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_ready assign process. --
    ap_ready_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_st4_fsm_2 = ap_CS_fsm)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_bdd_92 assign process. --
    ap_sig_bdd_92_assign_proc : process(A_TVALID, tmp_fu_153_p2)
    begin
                ap_sig_bdd_92 <= ((A_TVALID = ap_const_logic_0) and not((tmp_fu_153_p2 = ap_const_lv1_0)));
    end process;


    -- ap_sig_ioackin_B_TREADY assign process. --
    ap_sig_ioackin_B_TREADY_assign_proc : process(B_TREADY, ap_reg_ioackin_B_TREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_B_TREADY)) then 
            ap_sig_ioackin_B_TREADY <= B_TREADY;
        else 
            ap_sig_ioackin_B_TREADY <= ap_const_logic_1;
        end if; 
    end process;

    arraycopy_s_axilite_s_axi_U_ap_dummy_ce <= ap_const_logic_1;
    i_1_fu_158_p2 <= std_logic_vector(unsigned(i_reg_141) + unsigned(ap_const_lv32_1));
    tmp_fu_153_p2 <= "1" when (signed(i_reg_141) < signed(M)) else "0";
end behav;
