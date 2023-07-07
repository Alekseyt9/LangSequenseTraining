PGDMP         $                {            LangSequenceTraining #   14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)    15.3 4    �           0    0    ENCODING    ENCODING     !   SET client_encoding = 'WIN1251';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    20587    LangSequenceTraining    DATABASE     {   CREATE DATABASE "LangSequenceTraining" WITH TEMPLATE = template0 ENCODING = 'WIN1251' LOCALE_PROVIDER = libc LOCALE = 'C';
 &   DROP DATABASE "LangSequenceTraining";
                postgres    false                        2615    20729    pgagent    SCHEMA        CREATE SCHEMA pgagent;
    DROP SCHEMA pgagent;
                postgres    false            �           0    0    SCHEMA pgagent    COMMENT     6   COMMENT ON SCHEMA pgagent IS 'pgAgent system tables';
                   postgres    false    7                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    6                        3079    20730    pgagent 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgagent WITH SCHEMA pgagent;
    DROP EXTENSION pgagent;
                   false    7            �           0    0    EXTENSION pgagent    COMMENT     >   COMMENT ON EXTENSION pgagent IS 'A PostgreSQL job scheduler';
                        false    2            �            1259    20588    SequenceGroup    TABLE     �   CREATE TABLE public."SequenceGroup" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Description" text DEFAULT ''::text NOT NULL,
    "IsHide" boolean DEFAULT false NOT NULL,
    "Order" integer DEFAULT 0 NOT NULL
);
 #   DROP TABLE public."SequenceGroup";
       public         heap    postgres    false    6            �            1259    20596 	   Sequences    TABLE     �   CREATE TABLE public."Sequences" (
    "Id" uuid NOT NULL,
    "Text" text NOT NULL,
    "Description" text NOT NULL,
    "SequenceGroupId" uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    "Order" integer DEFAULT 0 NOT NULL
);
    DROP TABLE public."Sequences";
       public         heap    postgres    false    6            �            1259    20664    TimeTest    TABLE     i   CREATE TABLE public."TimeTest" (
    "Id" uuid NOT NULL,
    "Time" timestamp with time zone NOT NULL
);
    DROP TABLE public."TimeTest";
       public         heap    postgres    false    6            �            1259    20603    UserSequenceProgress    TABLE     5  CREATE TABLE public."UserSequenceProgress" (
    "Id" uuid NOT NULL,
    "SequenceId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "StartTime" timestamp with time zone NOT NULL,
    "LastUpdateTime" timestamp with time zone,
    "Stage" integer NOT NULL,
    "LastSuccess" boolean DEFAULT false NOT NULL
);
 *   DROP TABLE public."UserSequenceProgress";
       public         heap    postgres    false    6            �            1259    20607 	   UserState    TABLE     s   CREATE TABLE public."UserState" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "State" text NOT NULL
);
    DROP TABLE public."UserState";
       public         heap    postgres    false    6            �            1259    20612    Users    TABLE     R   CREATE TABLE public."Users" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false    6            �            1259    20617    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    postgres    false    6            �            1259    20661    testtime    TABLE     O   CREATE TABLE public.testtime (
    "time" timestamp with time zone NOT NULL
);
    DROP TABLE public.testtime;
       public         heap    postgres    false    6            �          0    20731    pga_jobagent 
   TABLE DATA           I   COPY pgagent.pga_jobagent (jagpid, jaglogintime, jagstation) FROM stdin;
    pgagent          postgres    false    235   S:       �          0    20740    pga_jobclass 
   TABLE DATA           7   COPY pgagent.pga_jobclass (jclid, jclname) FROM stdin;
    pgagent          postgres    false    237   �:       �          0    20750    pga_job 
   TABLE DATA           �   COPY pgagent.pga_job (jobid, jobjclid, jobname, jobdesc, jobhostagent, jobenabled, jobcreated, jobchanged, jobagentid, jobnextrun, joblastrun) FROM stdin;
    pgagent          postgres    false    239   �:       �          0    20798    pga_schedule 
   TABLE DATA           �   COPY pgagent.pga_schedule (jscid, jscjobid, jscname, jscdesc, jscenabled, jscstart, jscend, jscminutes, jschours, jscweekdays, jscmonthdays, jscmonths) FROM stdin;
    pgagent          postgres    false    243   �:       �          0    20826    pga_exception 
   TABLE DATA           J   COPY pgagent.pga_exception (jexid, jexscid, jexdate, jextime) FROM stdin;
    pgagent          postgres    false    245    ;       �          0    20840 
   pga_joblog 
   TABLE DATA           X   COPY pgagent.pga_joblog (jlgid, jlgjobid, jlgstatus, jlgstart, jlgduration) FROM stdin;
    pgagent          postgres    false    247   ;       �          0    20774    pga_jobstep 
   TABLE DATA           �   COPY pgagent.pga_jobstep (jstid, jstjobid, jstname, jstdesc, jstenabled, jstkind, jstcode, jstconnstr, jstdbname, jstonerror, jscnextrun) FROM stdin;
    pgagent          postgres    false    241   :;       �          0    20856    pga_jobsteplog 
   TABLE DATA           |   COPY pgagent.pga_jobsteplog (jslid, jsljlgid, jsljstid, jslstatus, jslresult, jslstart, jslduration, jsloutput) FROM stdin;
    pgagent          postgres    false    249   W;       �          0    20588    SequenceGroup 
   TABLE DATA           Y   COPY public."SequenceGroup" ("Id", "Name", "Description", "IsHide", "Order") FROM stdin;
    public          postgres    false    227   t;       �          0    20596 	   Sequences 
   TABLE DATA           ^   COPY public."Sequences" ("Id", "Text", "Description", "SequenceGroupId", "Order") FROM stdin;
    public          postgres    false    228   _=       �          0    20664    TimeTest 
   TABLE DATA           2   COPY public."TimeTest" ("Id", "Time") FROM stdin;
    public          postgres    false    234   �      �          0    20603    UserSequenceProgress 
   TABLE DATA           �   COPY public."UserSequenceProgress" ("Id", "SequenceId", "UserId", "StartTime", "LastUpdateTime", "Stage", "LastSuccess") FROM stdin;
    public          postgres    false    229   $      �          0    20607 	   UserState 
   TABLE DATA           >   COPY public."UserState" ("Id", "UserId", "State") FROM stdin;
    public          postgres    false    230   �!      �          0    20612    Users 
   TABLE DATA           /   COPY public."Users" ("Id", "Name") FROM stdin;
    public          postgres    false    231   *      �          0    20617    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    232   �*      �          0    20661    testtime 
   TABLE DATA           *   COPY public.testtime ("time") FROM stdin;
    public          postgres    false    233   +      �           2606    20622    SequenceGroup PK_SequenceGroup 
   CONSTRAINT     b   ALTER TABLE ONLY public."SequenceGroup"
    ADD CONSTRAINT "PK_SequenceGroup" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."SequenceGroup" DROP CONSTRAINT "PK_SequenceGroup";
       public            postgres    false    227            �           2606    20624    Sequences PK_Sequences 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Sequences"
    ADD CONSTRAINT "PK_Sequences" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Sequences" DROP CONSTRAINT "PK_Sequences";
       public            postgres    false    228                       2606    20668    TimeTest PK_TimeTest 
   CONSTRAINT     X   ALTER TABLE ONLY public."TimeTest"
    ADD CONSTRAINT "PK_TimeTest" PRIMARY KEY ("Id");
 B   ALTER TABLE ONLY public."TimeTest" DROP CONSTRAINT "PK_TimeTest";
       public            postgres    false    234                       2606    20626 ,   UserSequenceProgress PK_UserSequenceProgress 
   CONSTRAINT     p   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "PK_UserSequenceProgress" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "PK_UserSequenceProgress";
       public            postgres    false    229                       2606    20628    UserState PK_UserState 
   CONSTRAINT     Z   ALTER TABLE ONLY public."UserState"
    ADD CONSTRAINT "PK_UserState" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."UserState" DROP CONSTRAINT "PK_UserState";
       public            postgres    false    230                       2606    20630    Users PK_Users 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");
 <   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "PK_Users";
       public            postgres    false    231            
           2606    20632 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    232            �           1259    20633    IX_SequenceGroup_Name    INDEX     \   CREATE UNIQUE INDEX "IX_SequenceGroup_Name" ON public."SequenceGroup" USING btree ("Name");
 +   DROP INDEX public."IX_SequenceGroup_Name";
       public            postgres    false    227            �           1259    20634    IX_Sequences_SequenceGroupId    INDEX     c   CREATE INDEX "IX_Sequences_SequenceGroupId" ON public."Sequences" USING btree ("SequenceGroupId");
 2   DROP INDEX public."IX_Sequences_SequenceGroupId";
       public            postgres    false    228            �           1259    20635    IX_Sequences_Text    INDEX     T   CREATE UNIQUE INDEX "IX_Sequences_Text" ON public."Sequences" USING btree ("Text");
 '   DROP INDEX public."IX_Sequences_Text";
       public            postgres    false    228            �           1259    20636 "   IX_UserSequenceProgress_SequenceId    INDEX     o   CREATE INDEX "IX_UserSequenceProgress_SequenceId" ON public."UserSequenceProgress" USING btree ("SequenceId");
 8   DROP INDEX public."IX_UserSequenceProgress_SequenceId";
       public            postgres    false    229                        1259    20637    IX_UserSequenceProgress_UserId    INDEX     g   CREATE INDEX "IX_UserSequenceProgress_UserId" ON public."UserSequenceProgress" USING btree ("UserId");
 4   DROP INDEX public."IX_UserSequenceProgress_UserId";
       public            postgres    false    229                       1259    20638    IX_UserState_UserId    INDEX     X   CREATE UNIQUE INDEX "IX_UserState_UserId" ON public."UserState" USING btree ("UserId");
 )   DROP INDEX public."IX_UserState_UserId";
       public            postgres    false    230                       1259    20639    IX_Users_Name    INDEX     L   CREATE UNIQUE INDEX "IX_Users_Name" ON public."Users" USING btree ("Name");
 #   DROP INDEX public."IX_Users_Name";
       public            postgres    false    231            $           2606    20640 4   Sequences FK_Sequences_SequenceGroup_SequenceGroupId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sequences"
    ADD CONSTRAINT "FK_Sequences_SequenceGroup_SequenceGroupId" FOREIGN KEY ("SequenceGroupId") REFERENCES public."SequenceGroup"("Id") ON DELETE CASCADE;
 b   ALTER TABLE ONLY public."Sequences" DROP CONSTRAINT "FK_Sequences_SequenceGroup_SequenceGroupId";
       public          postgres    false    227    3322    228            %           2606    20645 A   UserSequenceProgress FK_UserSequenceProgress_Sequences_SequenceId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "FK_UserSequenceProgress_Sequences_SequenceId" FOREIGN KEY ("SequenceId") REFERENCES public."Sequences"("Id") ON DELETE CASCADE;
 o   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "FK_UserSequenceProgress_Sequences_SequenceId";
       public          postgres    false    229    228    3326            &           2606    20650 9   UserSequenceProgress FK_UserSequenceProgress_Users_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "FK_UserSequenceProgress_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;
 g   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "FK_UserSequenceProgress_Users_UserId";
       public          postgres    false    231    229    3336            '           2606    20655 #   UserState FK_UserState_Users_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserState"
    ADD CONSTRAINT "FK_UserState_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."UserState" DROP CONSTRAINT "FK_UserState_Users_UserId";
       public          postgres    false    230    3336    231            �   F   x����0�:�����cl2]��"�>wv�d!hQ�7bt�&<2wXi0�G�O0`������\*"?�e�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x����n�@���~�ڏُy��{�2��>o�8� N��!���P�����B$.���~��ϒN9xvP�*@�=��
�%Ι�5AWV������|���ʹz4��x�ݴ�A�T�Z�2�h-��L@ L%��M�E2�$#�V�F����t �P�:H:�C��^({��BU�k�Ƙ�fm �*� ��!�t/^�P(�j�=�E��@�փo�u9����>��ݩ��</ʰ���d�jR*TubN:� ��\�gG��j�}�\�?\s�]*:U�[7fŲ���m���9U���t�����x��7�2=]5�p����q'I�?��wUP��:ݢ�@��;r@�D��U�3�\u}ӌ�~����v;�Ӻߍ���΍�C�|j�oD��N��4J��!F�oc�d�m���y�]������9�b���������N�ߪ�N�@�&hUY�'\�9�9���|	/]޾����-��      �      x���[s#Iv&����|�*�K���Z��iwƬ۬Mf� I�@���J����c�m�����˴�kz�uD$��q)&�"�����HTk���� �~����|�;�b�P�V�v����b�R�k�i��B._)��J��K���~6�N�������_̭C��C+X^�Ӈ˵�Z>Y��5�_x�y�d-Ë���?��?���؟Y�4�nW���uN�Ko�����țYs�����<����s�z<�胱?�/��*<�~;�n�%�ab#+\���5�̷��F!={yd�Ƴ��rά����o}�
Wֵ����be��ӛ���?���ܚx�pƣQ<�G��Fއyxx��/��г�>=}�0	����_�#˿��<���M��j��w�5:�v����7�ãC���[3������p����Rg�����4}��^7;:���i�z�;��9�!=�z���Ǯu���z}�\J���o�;�vx�"i�D|�ט�ҷ-?91�c�s�w����G�:�z��6&@�����?�ic`�ws���}�«#%�_�X���(XY��z���4�����=w�!U��o��������q�.��[�#)�%��CZ��:�{>����B[�v�}�]fc�Ӗ�[[4p�~�WՑ�7�L�V;<����IxA�a��,E��<`��ux��Ӈ�E_���7yS���`t/�p�\��o���A�q�F�b��N�.V�i�jv6�w�N�^pZ��ګr��w�F�.U�5�X���S���[jfs�f�U�4�\�l�ς�j�O�������8��k���s��y��o��r�tY� Vx9�n=�api_z��p�����j�j#�O=:���^�8����A�z������ә�m�7ΉK�j`5�n��tܦ%S��N�K�����=�h[���Oۂ�H������_t�W����NֱC[���������^�w�nX�~{�౿&��y�%ds�M��`�����$����3"YM�e���?����~��Ѵ:M��n8�v����̳:��NzC����u޸}���Тd]�^���<T��6#o?o��І�c���G�w�?ǡ1�?��Oիp�9�i��xN������p���E���I0�cHK�����]���0h�E4��5�g���tO�@D�X����� W,Vk�b�λ��]�9-�,]׮+.�T�;N���j���fW�|�.��<}-�څz�Z�C��՚M�ɼ�����p��U�ݐ��g�
o�8�QO��_��y0��~���9t�|��W��#)�Ot�c���;�6\̼��#=~u4��;>��Wן&Gl���;�.Ѝ����v[�B%uC�|{���j�����l��>���oM���I�_��<��Q��s�6f���jЮw�n��Ճ��%}��}��>34o�}��/�B�����fC���뻸��7:gM�O���i�k��V�O��[��vw8��i�����w�ʾuK�Ռ�B8��#���$C��&����
ϗ�q�zH�����{��x�ӞьHD�|m�*)�1�霮��h����	�s����JABص��F�'�z�����wN�K>�dLV��O]BW`��ؾ^h��Z�L�����r�b�$��?�)�-�՚���f�;2W|��Uj�V�j�KŒ],���Sw�v3[w��[.U��ۍc�42ֽN�Gk��_�n��3궿���ȟЕK�\�I�{�t}{\�.X�|EJ5^<L�7��m����Spsd�^I�ۡ���H����!L	�O�P,�j��_���$�����VQ����@�zN��G��F�؟�Kt�~�)=�O�q����ٲ~�ř����h�!��E�i&")>��0�D���þ�,�V2���(u(�Ⱥ���q�~��Ѯ�����3�d�1�������Z��	��#�����3ó�ތ��ݷ��xR�
���	���8��ީE��z�wN��d!�o�[������z���o#�c\zW��F�a�ŏH
o|�Z��mqO�p�Rj�|�q����cC�)�뜎
�������Ƽ�h�_�Jjp�D�\�wإbnz#2Ǖ>�N�JB�kZ�#�{������h�&����K��,ٙ��4���wʵV�neK䧓gnWs��]nKn�Qj4
����\�R(9v.�s����z�^�kٜS��V�qж:��L��K�AR�d�����8��QHk8�}8}`+[Y����)�lfy��"�W��G�^���!��kc^��h2}d����S��}��4����<P�����z��o'��&K4_RN��_�ozp^�ú'�sv=�:iMn���ck�M�]-� �F���Y�J���g��aG����g�ܖ�j��������'�vIn&+���%�����6+�X�_a��e�zg�!���7X7:@�n3s&7j�r�G��cls��ZV��缕xa�ʫ�[~���Q��d���C*�L���C����2=��O zE�����O��{%����GxMn��4h�d��x�.���]�s�#��O�I�ʤ���;
r�d%������!>)��J����i+0l�=��|+�s��]/;8���]�g��,���b�Q��C�Tɼ��z�,25���w�[�"��Hc'L^�U(����ū�êd&�tE�&]�J����������u�I,�oF�%��g�T%H�t�c��o��x�(�B�rt��}l��栥&��}i�CK��󧤞�|jS�2�O��z��@���`5\�'�l�_�
��ɷ�)��y���+��hNl�����^}��ŉn���+��~���\�5���~!߿��Wx�g�d�pIe��2.|l52��!��:׿{xf��7)���f��_�h2��9���?�j���xS�f#:|���|*���n,�gs�
B㰒���W���y�8���ׅ]~լ�m�Vʶ[*��?p��ͬ�,��l�\���8C�+1{��5�?�^���ѧ��
��y+2�$�[��'b#��3� �t�'�x�E�J@]��N���G���xn��� ��x���� ���������Ma�v�H�I3�gF*;pe8�G*���r��a�+�X�5�;��-��+�%� �z}=e$c���d���hW�!9����hjaq0+ҞF��~��M� �����{g�&b�v��o̬�m��5$0�߱�BF����,<��s�S�qa1I��w���K؃3s�K�I��ⶎ"x$��3�KCMH>��@Zƚ'��7� Od�}	�W#!�
ѳ�4�܎<�J�����~^(�=X�w���y���+J-۩e�6o�j�Sn��<�������J��c�V�̫�(����Xy=�`��)f+<o<�?���-]�K6�&�,���u�Ǵ���j8�n��aӖ�����^��x�� ��9{^)�$�m����fi���u�M+o����_E �V��n�]i}����h^{�����2��
��"�D|�����O0���$�&m����P��?����	�U�n����u�Y��x/���eLOe�>��?� ޔ�H{j���~d�l�W�����^�����w�\��B��<ȿ$=+��?��wJ#�<��������E� �����qs�Ui��->q�M�7k�s2�����Li۴vv������!���g}��*vα�m�<����5�N\U�����e�]�ba��Ϝ�P9.�r�2�[	0���ą���!ʮ����pu��V�l8�<!��MI��~Cg�|���Mk�.AIzl//7}��'�Y(�%�s��F��謹*���|.��;_����8�Z*��f��T�P/��q@j��K%�9=��p��! ���8+���Q���Z����'���,C�}@���0nڗ��/����^�f��YI��k���:+f�o��}%/ǰ���\�T����:�-�F�a�o}����o+O:z�	6r��6��.Nl����y3��&>{���W�
��*#.ڧ���	�p2���G�Ի����|�L���    �������6|c�>7��3�ٱ��:齕�"��o��|DS'd�4���^yAma��;>Ů��s���������п�$�hF�4� 2V�OdvM7�13�E��J5���-�������s������X�ؐ�P��;סOϺ�F�u��2\z��$��&�xJ� c��}��h:���`���>��.$�c��]����񢍼�U��J�4��o��1�6_��V�s�g�t��JŌ�W�}�ͬA�Q�����mϼk�U��"������~H�9�F�Uw˅Z� ��8�i�ħi��s��������F�4�y�+	b��pbE��k�)-!�Jw�'�D�Qf�R�4�_�0XF�<���%GP_�4ۓ^����������'S
��2����@��Q.Q"$�<0��~f�ɋO�QweK�G���������~5����1:��go�9����z�_��Ĵ$����\j����D����u���-He6�.�-<��3 �+mN�,��u8�X�'Iх��:������Z�*��N����=�^d%D@~�I���G���':�OFL�u?�͊nc��WP{�~�m�E�=��>k��n;���}��>PA�)���$����MP$EⵓL,bhl��ʘ�V�t�Xb6��� Y�+�R��O��I�LhE��lo
3���1��k���q�� Lr������z�$F�u=�7/����
�l��us��h5�k�
i�V�.ԛE�Z+�J�������34�H�O_�$qX��Y��Lcq�H;��W*NEt��.ûi��?�'pP�]G\U�z�^��}�{�?JL����}Ϡ��$��&�]��X������3w�>��/V�wRh��4HŦ��ז,?�^?���崁2�"��i%�eu{C1R�[�.�֍s��4��I��C<��3�㍌�������5py���ԋ8,�0�S�w�q�Qw��CҪ��4ڽ��Z���o�OBV䴝���c��qLk��(���<����5�8�ں#����5���,��'�o{�:�����!es'n�#Y4ۯ��2[o��/d��1G��#���a_0[�Y+V+��]vJM��+��Z�R�k�z�Nn\�Y��^��f�Q&��Q���b�R��\�n���l��9�l��?�X���؛�L�Y�g��Ob��x����u�x�a�.C�O>I2��h��:^�y�}�d�\N��#fvD�b	�����eV�6��S�׬6�1�{P[
��.������X�*����X�����<�+�ǰ�\�0�]�;�L/OB���np�8��:g�v�Æ��9b��@��g�3���kc� �� V:��gd�C��G�!�x�Q�MtJ��8�X?���$���;�͌�ٖ������g�s�t�h���g���,�� A�Í��֗���a��OH�E�� ]/�fP��/��`��z���LuT��=[��F�B���N
9��Y	 8e��~˿r�j��kU�j�V���^6k���N=_�D��Xw=
ϟ.Y˳�+e"�9�'+�F���|'r2��ӶI���}Wj�2z�φ���a��x�:g�(��X̐�
�@�m7��1���gNg1,H�i�R���(f뚓��	`&u��a1�!���W��X�����#uW���3��@���q:�ܯ�~�=@���Y��w؟�GVlT!ȭx?�p�L��>��]͘�"�8��!���������KyM���b���w��VP�����S"�dN���.&	��!�S�׽��J�F�h�8�d׸�d$�#�8� ����z�~�L�U����I���	L
�e����Ko,�1C�Zk	U���ț޵iKD��\����=�f�d�/�/�q m���
���N�!So��Y���Uj���ȷr[�\�X�4J���{��;�N*����?8���G�����7
� 0w9�ά�#b����Yr��kP�9�����`N��/l8�o6�+U�Bk���6`�	�V��|DX��*-G~�,�'rvz0�ܛ�Q�t>��p����p3������@�o1=��3�]z������0��O��u6�H��hL82lo��E����kJT�L�(�; �<�C�I��LɆ��G����3t�
Ab oT��(��*�˻r0������^��؃^�-�3��6��F���U��?�u� ?;��3DHGtm�8ep��ԟ�RJ�ޱ.f*E8G������a�!���~���+M���F���v:�՟�H)v��ـ~;�����e�o��x�\�
I$ԗ��+���%m
�ŝ��r��'_��U��%�g��4���J�C��^�����������BE�"hn)@�5Y/��^�ך�9�*$\5�q��?L��!�0U�	����A�us�b޵s-���R�d����]�沭r��;��A�U٭k�B�.8u�|�jӮ;ق�l��Vӭ��<@�����kD����ݸ��|����#;�ˠ�c��H� �"���Eا�yui��a���m�2�M6�\]5��Pa(�z!�1�
OA9&���E��>�d�'�R�jhH��"&#��d '��02B�x�n|�|�y�C�7��uO�=���
�(���P�Zν���D�wq��x�aڲt1��ip�M4,?&�&14��A)I����K�k1�sAf
xw8��w��v��O}W����;|4s[D�J�Y������?������t���
���������s2}�1H���ޏ�Ȓ��-	���i�h1�x�gp���{HDLz	P�$�1�k,0R��%� �T �\Y�G�V�<��
�R�ns ��XŻ����isw�gse��_�:�}�r��l�m�N�^���rŮW��Rk��z����"��~�~�h��F����M��} �8iȷ�	����zM�"
,��`y,���LWF�J$�c����'^(l���#MMV�@.8J����#j��#����o�s���/�Xc��I����5�W�
�O���j�&��R�l5�7}�^�9-�5��6o�U0A��j��7�����K�U-X
e���N�gl#�4�Dh��n��Ơ=|�l#ND1��9�'G�}�&�Op����@|���f�..��Y�и�/�NN�!��2VSq6�9�&HJo��D�v�0��ĔQ��[d���Z$�^�,�m��1.6��+�<�T��o�;����{�=g�$�����j9'�N�鋽��15���*�&.T�r��
��	�l���M1�ږ}�y��c��ր��^וw��1�Hy���Q���z�<��5О��4����#���ɷ�KӀ�}����K�[�&q�qp��Hi�u����{9�_N�x�Vc�U6_o��X���R�.V�Uv�Ų]�UK�b�m���\�HF.R�}�ls����Ϡ;��(�r�����B�E�1�S��I�'F>!
�]M��H���4��Pb�"OދX�Ym�d?2,���l�(婑��01*�v�M����fqT����B]�ݻB�~�-�5=�Y��]����E4���g��������y�d���~x���xS� B��� �����޻�(�ߓ�!�aD��������h����:��R���Ɠ�Ҟ	��wO�����e#��'~����H�&I��U�H�N�1�7=�M:�f����s��:�c�����_�V��j���8<GI�C��<����]J����N�R�\�2 �;lw������=Ҿ��>B=�l�R�0RQº@�0àj�r��δ�@z佻 ���N�5\�k�!C?���1 ��ʁ�C����/��z��8���	�ԁ��2�x<^��eZow���f{�S~?"��ݱ� ���i���	�h�c�QxF�3"�X �����s���A;]��`��^E֙��ס7�H�i� ǉ�;�|f׹{֏�1yq���k���tX4fX��:Z��3V���n��J���l�4�K���M�f)k�[�b�i������:15�F����9�H�    rENV�F�t���!���LD����P��x}"���H,4�7!T�I)��:�B؟�wI�z�ˑ�H6D�Y�%�ɝ��h��0�`�!��n#d��r΃��
����j:�_2(%��������)�k ��XWGT��7gPw�_��N����JB�ƺ�{��"\!7�u��޻C���_< hJ�ܠ8��xQ�FR��迏d/蟾���<$���r�_ja����;O�b/檣�7?r^\���򟟁#C�p�����sv�u[-����A�s�
��C��cA<�pu�=�=~3�nD�;�f2�͍���td�l3=-�p�.�(���r�ԣl��m�#;�2���0v9��j��ȋx�E�L�]Tǵ?��*����rX�,2ە�]m�U;G�r�m��r�u0<��Y(QD����$������#���Z���D�)n��:�.�_}B��(�5�sh#��C��^�/>I(n4Ab"Y�U}껟V& ��.o5�����!ر?Qh,�@]�T}"�=2 u��ˀeCb:��9�M��ko	M,ӵb��e��ߒ�|�h����u;�逵����Ե�����~�g��R.D6��' [�7�2�����eEQ=�2�8B�;W�Q�VqV�Kz�e��i�[B�UښD��\�
����*�G���+�?B�pJ��c��0A)�1q��m�pp�!���\R6���� �
l��GKz�ԑ�	��L�.�	B����(P�gQw�U�RjT�|�.e[%R"5�Z����F�U˖k��s�����|I|�<�*l���K2���EUo[��3A��i�6! �v�1�6�f��5�"LUVf�
�/- [E��][�T��G'kr]�ɜ�,�1�@�察��8&|�M[���N�Ǩ)���0�d��)����,�J��C��rԻ�1���|����'��(�\:��Cg.�Y�q��ߺ�8� ���5��Q��9�������9e��ƲZHQ5�`̪����
���j�X�D�)�맕a�O��TQ\Q��"��!���9�C���
쐥�{�D���&)0���ձ�!�" c3R!�O��J���Λ�[R��MZ&yjw��IiT|�bˆ�q �����̳D~�Ț>����s_Po�U��-[��]+�HA�s�j�h�rU2rJ�|����S���tB��̔��Ο���TR:ĕCm��Fq8�������������h[I��:z�e"�t"Go��a�t��iL�,�'���bM��-���\��>�ˣi��$��v�u�"C9�&�ܳbj�G]?{O���;D&��\��d}�<���]W�J��}F�	˙���r�������J��N8�����3��S׊����*���`u�SR'N��k� P�4�:h
�#�7�����fB6�V�X��i�����A{�K�e��E��{��5	�
�ّ�
������.�4{Z-��˺�Y��b�ذ�I���l6_��l�\9�TG�޺�S��p6f�����t���V� ����������v
��D������1�	��4��	�����%� �(�lv����,��(c(�*�CF.�Iؤ������'��B�Eг����%�o�E	k^��B��`�1����x�+��S�GI<1�58���3����'��ʚm=v�!s5A?������'���|�F�n�+�gxÉ�w�lH���eD3o�}Γo�!H�VT]A�K��Ԍ��e�h8�i��+���!4�O�o2��su(j��7�+����c�T�ď��B�\JV��~8�ҫ������\��f֮:���Ȼ�V����f�is27�A���<��G1`�mfp��B��u�7�щ��X�����~��7�Ŗ��~$�p��)����bv�t�Z޸���C������d��+�2Z)�C/��D=קpm�:eGQ��]�=�D��-�Wc !v"EnRU���EZ���R�>�D�9�p�(�S_�:�%��d�����HG��C��E3H����ƒ��]i�F�+(#Ȩ�7���&��N�q���S��]EK����́��
!9��>z�c�ͧ��6ύ�*7Z����w��o�ޤ\�L�o�h�&��z������;f�_
�9zw���̃�|����V�K��;�ȡ�݆���S$�"D@�&
!Z2&$����X�O��i/���*���F�i狍�]l�K ���f�ͻ�|�Uh�R�f�A�k|�b�� Źq�^�y
��bhP��i/��;�26��'Udx,�p6*?��t�&G�@� ��&������@�8�ɫ@���V��b5hݻ���z'fuԛh��
�]�9���]0�x!ɏl�d9���
!�_7^E���C�%�p1d�z��חO���i{�8��1��œ_Z��i�m����b��C�{S!�����ZA*��2Y�� ���3f�J}��z$ُ��,�/A�Y<19l~��)k��Ak����K}��[r���Ƥ��Sf�@0�gX]��c� ��
��?�S;�<{*�V���D��=+9O�t�19c�2	�,q�G%#��0S-�iDK�z9��VH/����h���S�K�b�X-VZ���&�ɀY4#���=����[N+���=��J�q�MߠP��sRX�%'�ڿ�V����J�# �Mbꂗ��%c�3[⚡��E��/�)[m��U5����W,��UG�MUSkN��]��X���)6�`Z��x2Lr���1(CA���sOo�拈^�?]9%�����J�3���K�v:��!a@#��-�ݒ�)�&�	����rK��T?�TD��6�5c|�Λ���j�!���"'�ӱ�Н��I��}����j�C�8Q35l�������G���C�%M�0��+���L��l%h]N�!a#�1�MDeb� ҉h��5N�*�`t���8�F�ey�����Ӈ�����û��4e�z�]BHY)���y�*ʿ��s�g��v���b���V.g�E�V�*�r�Lv��.���34��z�^�:��Tǈ,UN��չ/�z\�)ҙ�Z@��¿��_Ġ<C0���$}+%O(oty�'!��A�՞�Q���O�kAP�<ԡ�k�����lH(X_�*��RĚ�&Qh�����j�|�G�z�P��?3;.4{� ��c#������I����=O�d4��\��!�>���l�|�	Bk��W�Q��"��Q����睋ᜐ+&�����s}���yh٦�pЪ����پCy=���w�T�m�����d0�Q�E�k�!�2ɝP �;*)γ\���@�Y���*�H7�D��m&���O��6��B�p,�a#5�i�I�K�u��嫍V�Zt�V���9׮�I�4�h\�s���BT�΍�����$��hT�^|}\q�N�PPѵ��Ec^�]@��o׼1�VÜ�bQ*�)v��	��E�����#B���g}}}/4F��QBK��-c�bs�����T�R�Y�Ϊ�7�i��u�R�Ì��2�$�A_���B�ʉ�Zi"��T�EPuM�y���1�﹄��o�f��"+���rĒ����Z�����xzm0O�,�6K�v)�0�y�?38ۑ��m7�#+!)֣gC8c��`nZ4��<2۟�/���4�(C@����}��ɅLt���dM���/�/B��F{�_o��i⚇R���n8z&׵uh�;Gz%`�<�h4�F����T(fs�l�e�����T�z�ZFܼ�:N�٬��Z�w9�鲶~�<�P�
�py|R�3���y|��XU��K1�\¤��+�c�u��e�*�岦8����i*n̨��[CXG���G�5ET"�x�ˑ2*͐J�F�MD�-<��	,�]���# K�Fo�Ҫ�Wi�\�pu�^�q;�����(����v�J!�rh��S�2"��3��dw�����´�z�@���VàPޚ�7�PҔh����&��){og�]R�?�����_�_U��4�m�ޯ�L�^    Ejӣ�v����̣������[�n�X|b��Y�jT��Q����������D���:պSn��� K�U��U�ֲkͬ[u��|��#_�l���鿩�^��(�P�y�:�%�}�-�!�4�㉵���d���U���a��F�b)1
\7���21��+W��Jt�ɒ&��ͧ��ku�\mu���%H���E� ���N�jQ� z�%Y���K>��G��2��_�֏�o�S����!����ã��d7���9P���K���c:�~9L��-����r%s�7�ΐ�j�q�����>��Ȗ�(�+�D�@�6�:�����h�/D&E��е�a�H^KSc�U��q�ӌ3��k��F������sS����9�<pa�F	!%_��ϸ]����h��I�55��N�V!0A�H	r�]�����{-'QD��l��8X-`6i�s/��/�Iġ�N���w����N��F9h��j�.y�#�͸26b�P5����~)���0�W�F.�k�kv˩���h��j�u�r�V��r�\�X@�7�V�<�p�v����G�#��� T��0e@�f(�� b3TUj�c	D3�x�a�:�_L��"c�RiJ[\��62Jho�.)q��$�M�쎫�g��uF&p�I�l������ñiqwґq�bt��\J�Ŝk8}�����j�� c��c�Ӯ����#�~�T+���o.�"�(S; 8~�k]/dVRd�����A��Û�^A/��P���H��E�" V�cfq2�P��o�K��&�Ȁ��߭��!��G�s���t�;d6D��p$f��ᅿ_�R�kb̮i� ��8�Ep}-���ñ+|�܁?��I�Ӎ�q�խ�3����AZ���璧	���B�^��sv��+��*��*yt�j�\m5��B�| j@�RlT�[)��5׮6ɏ���F�Uq�u���$J���q�?��s5�R� =��*K�s����bs �������K}�( ���_����q���@��3�;p�`/֮�.9qo	 ����Xk�R����舥�
�����Of�ȓGM��Z�OK8���ڨr�%e��"Å�#���tĕ�4S�1�A��+�>Ǘ6.�_[�_�9��򗗣`N��)��҅��&�ĖY|I�]�u���S�����6nH3K'�2d���'4���.�=�i
:Q�D��e����i��;8mK���W�;�Ěʘ=�ע��R��#� �9���m(�Α��>�����/&��~)�.o�\b�3�M��u2���cҚ@()j�����C���W�,hc1P�5�jw�1�Ro����4c�Qʿ���w"k�n ]Y��v���ڍZ�Z%˥�s�]�L�Nk�䧤�5E��8�N����j=|F=D}���:��v�g��Kr�νU��e��V,�s�!U�&B�<�����z���>$�`��1];c��JN?��{� ����d�Y+) ��aL���𽤸4��	���] �������yL�d���hn�c5��+?�&Xq*&�i��g�B�}�y�Z?:q�m��8E�pF��n�8C��S����k)��Du�,d���r��"U�#�����~K�i�փ�1���jU����tZ4�y�Ь��u�"Ӛ�)�x�I�B_��,�1�S�?DL,����i"�N�6ۈ9������ZE��w�_ _�A�'8��f�t0x`k����<���"M tn�^bĒԑd3hqAp�\����5�P��w��L��r���"9P����?�b}͚�������I��V��+fR��+صR�i7�\�^)9�FA�'Ew�dR|�����2$�p���H�o@�@&*����x�FC�0�#*��P��w�E�u�/��'i
�P�̄ �$�7˼��4�S��|��7���+��aT�9ǝ���i4�7�܁�nr�ґ�_��<���6�F>Yk"a�o'��	Fk����3��"�-+pL$���W&F���ڤh �8OL�4�?����(�*)fTr@UN_�TN{�d�n�i��b��� (-3�ջt�z%�k���g��[v}L�t#Ef���<�x�;r���+:r���v-3l��k(�3����X"?�LuY��əIt�D��Y�mP���V�2�
����)�@$��ϸ�)�la��T����i��F��D�}>�1c��3���C��G�U���K���m��kN�nW�����7�(;P��O�T����=+]t�9�*����Qx�`��ia#٫	r�(�!���(~d��zvX��N��B3� ��YZV�-���tP���;uU�<f�{�:
K��J�ii��J�������wǬ���y�W�ͩ��1\ *&���ѯGU�D�-�W���k,cV���s��4�L���
�X2�hd�k����'."=�"�G��॒��2�no�n�Rs�ʣ/���x�
����Wh��;�_�v��$1��#�t>� �,4�j�߱��e�	��,n�G�Or���6�7��o�|K��
�T��֞�����GLN���lj��F��S683;�	��i��f�Z��+�"M��_A:�B��85���H�\��=�g&NzT�D�;'��%��F�������p����C���`7
���U��2)I�B����M�mx\V����/����}	�^�WL�l�+�ph4�v�<^���1������+7�(W�ٜMʷdӯ
v��b�*�\>[�5Z��uL芥�b��g�3��м%�a�>�X���2&pkf65�4�"*;|���F��VA��hJ�LA���@,��Y�;���·?�	�s�3����#��.�g�\G,��}+I�L}�����ov4����=�P�u5:��"X�}���d !���\�/��x~��bF뙉��L�PH:	�F#?[��yQ����Xq[�s���W"��}����kF�M�*��/*��m�c��3���5�h�]���"C��i)���b�4*P)�`>ҭ^VB�9�/�@|VB�u���ћy#@�0U����X} ���������/���4;L�k�S2wU�)?�]�㨷2��-��u5Kp�}wQt\?m7�?��Lu0I@$���
U�@r���q�43d��U]���������a��f�6Oʾ*��\����N�ts�V��r�v�B���MX-����?�c�G��a��||�1��/Ѩ&аngI#�f��(͓O6���Әm�ɺ]��W=3=Fwa�3-PF
��u��*B2Mq��N�$SR|��H��]c���?�d��"��> W�+���!�,��踘A}@ϣm�1cF�'חq�d!�}d�oR& +R�l��f����h�,�gޅw̥�&0�~m�p-�%Q�	�3^+�z9
�� E��F��Q}i��/���A{��7
����|}e}͇��=�)��ĸŦ5��ȥ(���g��;�ɑ��P�HhX��>iwk(�Q���)�(�
b��|��
6��k��p̙;�P%P���ޣZ/��T��p_B�V�T�J9��7sv��/�՚[��ޚ�6�-���Xd�;BD�����aZ4N9�q:|��$����"����*a�TiQ9�/���-r�45]Ȁ� ���
���L �8_��f@Wqc`��,�7.pB�p}���1��E�y������U�-�D�,
ް){�\��K�O�@ұ�q=�����E��ǌqo������[�n	b�E�͙�3�V�����>~�.訷Pr�S5�r���5�w��D����5�����5;����=�NS�ά�M��ta9r��w=���a�pl��"�L���Sʐ�� �IC!�\���+o�3��l���%]�,�?�������T���^�;�c;�v�¿36.nku������A��SPZ�'I=�;@��r��J���VQFU��BB
�&5*D��3�����P{���
�|#�-9v�͹v��N3����eK�J�U�(�M���$Ӧ|v�++��n%�U,#&��Fq���l�	�7�KR���    �(1�}	ϙߔC�Q�7I\p���Uu�1���.�R؆���p���a�
bP�Y��<����Y�No��8j�D���U��MC�o����(_!������-�(�Ⱥ|�����j�602���ޓ����֏�� ���(��LM!��X��I�
i�@Ѯ����!��X����،� �L�ef'�W)V3jP��hc}� J_N(�DYh�T앛Z6�}RR�{�3&]�t��oYu���3�tQ!5#�+g�l'j�4c�[�jN|��@��$R��?�����2J��m��w0�tm�&�*�xya��Ի2D*G�k�r�A�Ɔ�X�����ǫ��)���c�����V5��k�z�.�
EҢ9��)d�N9�w���w\�֊I>����m[�&�ھU`1�5��9ı7��v�,����Q��ѰH<hǘ����Yj`�j�K^�ӌ�&��%C�8�}����爹-oD�<��_o���Ӵ��H����$�r�H�����'_F�ғ�� z�������O!�-�>����Z���Ȥ�I�
F�fu������2��	m��l�9$���� F�z�t��U��\Ӟ��3N�t�dY��r��ܮ�;�G"$��6I2}��v��)�g�����	V.�����+c�{\/��|��8���Q�')|��ѳzs��@
�gu�_lo0t3ikE-��k�P��H�s�F�)�I~�x��[��@$6P{� jnd7���d�Y���m��(\̑7Ϙ��~�J��y����=��w�Q��$������j�WN��4K�����v�Q��N%�����lΩ�5�� I��?��������z�!9W?�
��*�gӨ�d�f�-X�0L�M.��8��iT�m�q�(;�hQ��eHn?zK>��'n��>IVn���å [�`�=<�і�fT���O�����<Ld�m�R��u�B�<K��0�5a���f�wz���0j٪<Pm����[�nz.��3h�<�����Bƪ����c��wP@��WW7/5HbG�k�SHd��~q/M걝6P���Fgb�T1n��iK��F��1���i܌j����0 
ӓ���8�d"�CG*d`����2��^5�R�T��B�B���K�\�+[�:n��,Ԫ�~�$r�9����~�guc*�^BZ����܈�
Ʋ�/�����d��:B������]pI�i�}��?۔@�+�rU՚�0#�����C�𛍑ȵ��0Q�AI���0^�}82�^�庪9tӉT��s��6[�������CkS8�!1=�=h�y8)3�Ac�:`�Q��6m��b��?��"wN�̽��I�QIGJ��5w��pHQ���X��.�����=w ��Z�kf��[zI��"�c�Z�h~�5�~�b!%HF���=�G� .�)��MN���0��|ڎ�D�jL��8 ���F���M*����蠔�Tj�B�nf[�/�'�V�-�R(W
�z���4*���k��T�Ⱦ(5k�?�X���j�=��i4z�fҼ0?�Ϻ0!m�&t0٬i��2�Bbf����7����t�Q7RR=$|s�q���*��&�F-�[����14=ϘT�(�a2I\���CU
Ɯ���Dn|Y*ʻ���L^�i/CW����R7Fw6 �׍��7Ik��Y�Ά�w���K.F�%�-=+��m���{�]�4}ۖ;X(��y��Hd�o��Ì{����lϘ{ۃ�@e��.�{L��g(�i�N������Sr����x9`e�7E�6i��8&�(2^��cw
D*��^ޱ��lC'I_��9�����i%gk)�N�m���]>v���l��J�h/<���ѫƟ(}D7��B��@?r'V/�⾹��v�ʯ����_^pK�8�z��>1nQ�t�"'4��|~�Ÿϩ��t������_)�p�AG�1�~�ɓ������?�7�_}U*V��Z)o�R�y��S,6�r��s�f._�$��[M#��˒�J�Uk/J����-�l��`T��[nɓ\!OU�]{�;_5���+�h��T�{�:��:/�ç����W���1X�&o?k�x~?Ӎ�ɓ2kF�\�n����l{Z%�����<O��Tx����I�~h�SH �jJݢ� �w�v����{C�a�b���F��QL� �R����Cl*Ǥ��=X����|m��J�SKq~�D5UUԘ����Cڱ�+]���������i{�k2����(�ώ���~F��:�����?HL��\���up���H�p�
�;�=��4�=y%��tN����T�!���]os`_A3�ߠ��A�g}��x1^�"��£{h�/|��eWօ7E|��{�d�A:#��1��H�������;�T[[�lg�*޾ ��1���aTɍG�/�4��Q�*��*�*���f�ܲ�M�h�Zޮ7@�Sk�\��sJ���<L��vN���aj?���-;�r��D�B�4��b*0��uw���^1Ͱ�<sM��=�Q̒����ח"R?7'ͭ� p�Z���.���nS�gLrH�z,�s�=�ӊ�Ez�Ks��0�{�������$HQ~���4[30ؿ ��y�6G/�~`�g`~R~礬B_7�ޞ���.�(�'�[h{�2
����������WZ�tsy��;��
���J����嫠�$Ⱦ����J��Z���lo���o��B�-ONk G
"�]볝�L�5_��������;��|}�<M�:����(;ٱlj����a�n��)P�ͤ�_d(�h����$����.��լk�|ٮ��+��]�;M�\vr����5j�u�H�]�G��E��a#RqX5�a�v��M(�>t1�����
����v6�%7:uf��G��2�������f���)�p#�g#I9��BSVbQ��H��.U/�avާ�K��T��{��S���#�c>�e���g���\�;E H�]�.oG����ow؎�+���ν;x�3oN�t�%��n��*��v�����N�í?7��cnY��U��9o���\ω���??�~C�I�<�V����u���NC$H�5L�(L��Һ��чd�x�[��m����S�k-��;ͬ]s�u��(�+�F�tR���]��� ���ǟ}�8�.*E��JR�E���%�k���n�(�09�\^���=h����ξ�*�ڇ�5���/��A�'���3����PBia��A(�+�~�j�*���0��q�T!vDN̄<��Hh}���J<�ݱ4�Q��gp?�b�]Kn*���}9~o4^��Q��%'��iLbBp:�,�E'fv����g���1�؂S@�N�a�� �n��{J\�k�V¶n!��&����ġT�5����ߒ�?N�BC0P��}��4O�hy�~IJ���f�f�l����;#�ꥨ{������)v�u�Ѱ���~J��-r��]΃�����j�<�J�T.5��|�P8Pɮ�v'�>�G�߶Q�'�srЋ���b ���Ű1�*� �3������1�bGQ���g�PW�^�O��ʉ��K,�㩱��J�!f���čAA�4�I-C��F��H�x��4����*wQ|1�>��t'#��É~����js;Q��C+V�d�x��M���^�G>i[BMZ�l�jL���B%E��c��U��kh� '2ƛ����)�B�548�ܡ�G/�z[p̷���K�gYN=���D�O��_Fd�j"w�|=x����G�I=Ҿ��_���#�@�"���~)$���L�T���IJ���y����ؒ�O��$����mt�P{�Y-��%�Z���Vl�j6���V�^*d�l�9`�ʰ׳�S��N���!t\��� 3�,��By���e�9�
�4^�ƔA�� Y62�O&�����H������!�T�}�
?#�m�����D4�/藛�Ų��t#_Je� ��I7e��#r��C�(��cZ|!��6e�'+�F�`�^I�?�%TO֝�>��[��B��E���)$Tևh:�G���x����)]���^�����%���    G�r jG���S�x�B�� 6r[��3Kd0�P����d�/q��:Au�G�_�rߙV�a���"=����WH��M~F������b{�$�8t;(��nH��ĲL����7җ�����ud�!!")��ix�2sF[�8��t��x�~�ѶO�ţ?F�x�'!�&g��$��(*�Nh� �!�f���˵l�Z ��CZ(d�j.���J%�,�Z�R�*p{)�M@��-�P��OD��8�d4�`�;[a+M�&��A�U����B��+!ʛ�W$"O���-k��2��ǳT�'rB�c�;|G�e����R V�?�33Ť�F�
s�6C����}c�$ݱ�DK�]M4���W���hԝ��Gr!����I���4Ϣ �WAl��e|\c��1�ض!z�j��,��FU����n��h��{k���1����x�/��X��d�nԛ�Y����ZxU����R�j�s��]l�sv�^s�l-W���z���9����Iw���K5�f�4$4b�y��EQ�A�CdE�aFv֙��F��N��LB�ĵ+��h���Y�#{/�yB \�hK��?��Ξ�--����V��c�_q|ƃP���$j&�g}�7_D��n�W�?�/Ѫ,���=$n�	ä��v���Y��yYsD����
#3�껣8X��B`<�Arp[{N�����|�4+:�;���9�Xm�J���Lq�B��F�M^cO��A����*17�$�]�/%�ET�R{�ԗyv��q��˩ƌ�����#��B�p���T���u��m�\u�n9��|�J�C��*}��̷��b�Qϻ����0����=;�lg>˃LqX��K����J�<oN���8����{�9U�Ft�!Ri�;4�tM;v�	e�R	-��u���~���1����^�(�<�|5�2:����cJpk�:��dF��'5�ш)>`��^�:>;�_���c�Zu״g��{��5z4=�[I`SxN#��ϿJ��O��]�������љF��u�R�1l���
�k��<DT��*��Z/�}q ���,s�^�,�ZL�6XM�d�b�jNOF&��:&/��Z"��^�tW��X9]��v�r��RCG^�V�P�o�<2�L����|���8�eg����5��Bۿ(��p\��m��Z�W�\�m��Y;�o�b�F6O���}�TlU��"oF��L�Q�I�4�,6<n������B0nz���b���\�Q���T�*�*���E�����^2��NS`K�R��/��j~%`�B�}��w��#8ĥR�|c�ڢ���7���8�
6g`���!�x�����uv�XD#s�|�W�:}������E��0��hQu3ܭ�:t����x��4���_��Ϳ�fT���/6
��Q�S-P��cF���]��q�-�`�{Km�����j4%�p�;?(#AȠHNB�Z���&]��|��/[��K��Z�9Ø�2��Y]ʷ@�n��I'�d..�����S�Nu��Џ4��^�/Z��$�~�
Q��S�*���Ӻ�=�x�����I�IE���Ԃ�� A0?"���;��f��6p��|�G]b�L� �x[�E�XP/��=�0�ɜk8�D	`���L���������CK$_�"ڦO�!S��OԨ6���IN�I���o�#��PD<��~ĉ����d��`�J�W�E�5�I�\ݵTz����H���q�h�hDG]o��U%8���)f�214m	�$�p!@�Bhz�>v��M��ߐ�9my:߂�q� B�U�Z�g�ي]�QUZ��.(�v��9�V�H*"w ��&m�!�9Z$?��E��5����ZX�X!��XG�t�DE-�I���q'Ʃ�L�uy���D���!�]~���O����>R1u�� :y��wf��!e���B,����v+����p*��w��`,f�������	������e�\��4:h�~c(.4_�����p`�BCD=T��2��+���h�/6�\ϔ�C���Ayv�;!�Vo��ǠH{�n7�<G$A��co��1��"Tv�nB1�SG����:�@�'�f�N������x��͂�^AAN-�-�$[E5LI���:
�M���ǭ��M8�`�4%�<�\[�Z�3_]s���&�u��$�ʝ�w�Ϙ��!�����(��x-�޳R�� ok������£��A�z�T���M��j��QD{�V�bW�n����F�p�����0C���]�W�C��0O>��^ΚCi
]E�ez�L��΅{�qSR�j|/)��͞�ʹL�Kв��_M���ܤ�x65�W�����Ee�TjQ��l0Xdx����H���� �����+�W�U�=)��X�I�f-���Ae�/
B�:�^ɒ3<��㈛��	c�@��P	x���6�j����<d=��z��KK�/�&\^{Kڷ�2��K� qdܓ�6�f(��y�^��'c�:��8gʊѤ1[��=5G���Q�f�v��z�b�̔\�E�J��/�ʹ�S%Gw[���G�t���s1'�r�l��+o�RH1���
�/F��i�o��1����N���1�����R�͹9��U=�af�g��`�W{h��18�t�Rp��F��qO�IG�&�J���[��&��aD����iU�I�G�Yo��������x�޴TL�?�2y�p#e�~�»�\��&���+��C���0l�Y����2"�ä��Y0�9A�E�f��S���in��I`��B[S��fq#!�My�m(�g��蘛8G���4W�8qA���?�%�m�ZU`,A-�����qM��Ob�go��ڬQ�h�Ơ���?�4*v���ݺ�-�����3F�0��лQ��3���W��Ӥ�]��0��X�y�<i�<)��|V��E�ȁGe��
����d�#������h�4%�a %�դg�~�D,sb��~e*+�c�?��o`U%+�	z���ڍIy_Y�o�YC����=�bYd9��_,��Y�����D�n�d,�u��;�H�=G�~�T����w����T��n��\> ��R��8���S�Qs� ��y3��8���#��ܙ����� ��]�X�BRb�p�q�b}�F�n�U؞��W�R.�T��]Ζ��ojM2YJ�\ϗ�G%W�ɢb�E}�=2T�[u��n��4E&0�Z��?�� *�I�t1�R�J��۹iG�G���h�V��kBMT�X��a�Ĕ	���)S�I�ȉ�ݹ���:<z����ex��;1�{��B���j��S���rg@GŎ�7�z�UQX9]*�?��Ʌ��ہ1�\�6�-_��v9H���Y2��+��1�c��Go+�O�9�uzo��n�1��]|�s"{�L��7�:45l��d$R���_*���;��3C��Q�
����{���I�]��yWcab��H��nfH��1�/TCG�{EM�z��|�n�
%�X��m�\r�\�Y+�J�Z#�<�-"nʺ�C��"���_>�3L����҆X�z N���DU�F�Հ�落H���N�jJ��e�L�GB�cT�0�Zg�Tke>�#�I�9��u��i��q������[���"I�#t��`��+�CE���=�BI+uw����"&�tQ.E�^��J��'}�PG���M�M*\9�[R@6��6����N~�}���kJ]�wk7vL��{JK�vXÉ	K5k��B����I^zW3�M�x�+����{�ӧ]YF����z�p�f?0�����y�ߦ�8�8ٱc�S�E[d�	��DAB".���+��s�UUC�b~�$�����F5_��V̶ܦ]Davݭ�
,d�\�q�JCk��>��槇i@��̷`��-j1�m���Ttz�e6[c$��H_�0H��Gi��`�,E���P�K��ό�>�{0t�>�긃J<:�L��[�E�,X,獠�l��_帝�c6���6@dU��m�]���?qWRH	t�L�)�P�w��4�(��J���8����w(-1W	�c�}œ�``4�ᑠ�)��t�'kf[�@�����    ����5Y��H�ӆK�v�|E)4�NNKGa������fS:[rZ21�	nrU�l�CZCH��+����Jr�	u��e`دj�#v'L�3��y�H�@O}��>@8�BK�Fy����l�h�΄?W#��ŉ�ND�]^?Tz��L*�@���8 ��i�i|�I���V���������ɳkM�W�p3��&
F<p�i�1�1���d��b��(�e�D:&W.۵|�h׊�V�B��Y��^*\�ذ��<�b�Vٮ�����M7���:�����ў4��V=z|�sl�c�!#�ݚfU;�L;��%�+�C���C������Kv��]-���8�>4��F���ޑ�Qd��8c6�
,G:�I�:����l��PY'c��jx�����)����%$H�ީ�"'?�{��ڕ�n�J#�47)�-+�>�>X����j \p��_G�-��Cb��׏��-6W���"G�y���@��ӄ%.z��Q|�-�t�I�x2���j�k��*��{��ɉ�l�}v�E-$yttS�9a"��=Չ�Wl���$�4��9Yc��+j�{ȝ-7�Hg# 8v���wh��$�Io��<w��Ø,CuZ���X�n���ҍ��[O5R Q��ܰ��5R�1h�ۂþ;��-�u�������Nc��d�M7Ut�j��x&���w���$65V�E��%4Z��*fؙ��_�E����بEŵ�f��R�hW�����a�
#��g��J��lT��:�\�X���j�\�k�r!_���|�@w�1�_��}JN���A���H�h0�&��j��_�����%\�~#Y�kT{W{�Y?�p~(Fb=˜x��j�T]*��Q}b&	��CKX�4|p���ȝ��8g�~�4���E���Tۍ+),��7�1%���t�dh�Py��d�0�8
>�����ou�M�hmn���3���/�17kC)��\���=l**o�W��ͮ+rV~bf?J��@F�1DN�FR�~-�[r�T�ۚ�v8�d��W1�`���,~��[p�e?��C$MƜX�؟&�,=��́�<]��8&<0���w2�u�Q
,DO��C��+�N�jOv�ʫ|�^kԫd�V��|�v��lحB��[�r������U�L�J�Uj��Cޫ�N�����㟍}�1BP -Ri��-�!�KH��l���+�3jt�F��hܧTu��ʇ��e�ē"%)�t��˼ͬ7�	Q�۷�n�_����UK7�4�X�^߯t�kI
\q���FYBF/���)Y�mv�w<1����rr�ي�i��x��� hv�{�t4M�*$ ���돹�����c apF�Jr�� �,,u�#[HT�4ݻ�(�F��D�W�Ec�G5��]���YMS�V�Q���l��K�u�
�AP<2�uN�����I��$��'f_��������QI�r*�x}�V�W��`�k|+�.��_+�����^���B��#�t0>�ԧ�8d��I)�e�*�����W�e�z������a3�WJ�E[�*�:{sl�U��lf�F	_�����|��+-'[,����MX|C��٫�w�f���G\f+�2rh�g�U�4���51�fY�Z=`���7�IyZ�ǎ��.&;��W7r�d�n�������V*V���M�����44��D/����t��-�F�BQ��=�l�Q��j��yݹE�$����OU3�W]���뎯��ɷ��Ո��� ׯ`/���n�ɘ������et�Y������/Q�e�_'zBq�Gs��E(�TRD0S��9��F���	�d�:l��;��/��=Xﰮ3��<��~2��+����;&�8�2�[�`�<��P �D�P�pH���骙)r)���!��
÷*
�#r�Dw�oB���݊[P`s�9�<�ۍR"'��n���)C�./Fnh�/Z�c��~��ʫj����ͽ[s$�u&���`��4C���B=�q��Q�I�v�f2�hl-2"Hu"�KK?c���U\�$ӊ�!�fz�1�@��tuU�����y���} ��HDxx�?��|_9_h�a�RtK�J�m�=e��\�^��0�;�w�*�bĠg|>��}�O@�{��6S�qޠ �y�*ܜe�nF�?��b�X�P]`ߌ�{o�Be�e�-����K7=(����	U<�.�e���?�QHW}D���9��by��kS k�t���ː�w��Z �ٷP_��*p��"y��M�#�|_DK��'OKO��Z�����\���&�礧��{a����rB篝��ڔq����cp�l^��C�m���*)�$��կ ua=������������|0��"R"�b����W����_����ƨ5�sւ3s��O����{�6�? ��N��͒�E����W����띻瑒�z���{���O���Ӟ š�A|����E�T-�A�SAd#�����s��Z��כ�B�|D�E6���0}^bʨ�Lg,�aagB������NHp'�xl�C��;:�s���m
�8�"ك��i�z��g�V���8A5P��kǁ�:�zj�� H��_ZtƳ�
��r���f�2Z��@�q&�O����u$���� M��rZ{p�c�`��ȊD)��{����\m�D�I22�����'.e4z5"���dy��w�1�:���->������/��1���4d]ν ��PnN
�q�R�,ZS����ZR�;n�|;�k_*�vH͞���>�o�Mu�d:�Kz<�+�o�+���I���������u�A8��{v�6�H�� �`7�����p('t�Z��f��+y��R��֚~�-4�Z3�s����Hǔ���g�������2>~ҭ/K�o5��O�Mֿ���±O�m�gt�����I=�m�G�Q�T0�% Xj��*�MKO�8��o%����!`gXNN���'|��R���n��/Q�@-i�Y�J_���}�s��#Ǒf5�::�����SϢ���ʴ�Hmy�u�)��G03���Z�fأ������i=o�$}�R�.1�E"�>�B��m���h$5kT�r^�.X�:��!v���n�=������a�X@ͨ�
���Z���j���o!_��H.=��O>��Nn�����]���3��X��U�N[�qfG���)�D������X��n?$�5��{�$�]N3$����6_}�])½��
5ѱ�
Xk�����xv�"�Oj�����A���\�	=������/!�f��W���kF�rF�=
�s'�|�T��=1/�Mk�J��-�C���氍��f�ڥs�c&��Psx ��m�av7�������Pj9��)�����"�����Q�n�%�����$rLP�8C�t�%��[u�)Z���!{���'۽Y���G�P^�q�`]��VQ�^N}��N͆
�K�f�U;���C��P4W��G-�M�#����L�:n�+��J���j�VE���)BChzpGiS��CPZ��d��D���k��Y���O�Wj�I���g����$2g����k�G�z�#$3[*��$�0U.� �h�)�N`� -J��c]��o�ķ���z��;�Cg����]��n��r1g�)������J�c���<��a׭�$3�$�Ɍ��pdn��,@G( d�}k-�HY5e[�IfD=�~/L񮡐����^��ˠ�y��2I�OxH�^�Ü_E�䍾i�ǋ�s�!3�.ԁɞM�p�=Ԇhř��	�����:WB֛��'t�*, ̓l����=.t�Y[8}�Vu�R�U8��nC9�n!��37_����SFP���=�D�8�;~B� �HR�$���`�]6�C];~���j�~���nG�k��AT3l{ΞIt�_�����Im��O��ˁ:��1��v[�ep���$	�Q��֨�!��e�t�<["���i>1�0�wE��4h���T��Kx�_[����L}�1��c5 Ʃ������V^�b�8��    �@-*�Ey�R��{�L��#>�vg�P��ԼIq�Ǿ�8��Pդ<|���a�Š慑;��ړ�5�����o��`y.����qki�.�G� �*��'REA�U��[G0ߜhCn��X�����|�cL�g3�[�B�N����m��~go��,��N�-�8�Tk1u��{.)cB1<?��~���f��sK�J��*��땕��Z�P�����f9_-�7��)��5�r��빺���bP;����*��)'HY�F�V��o��2m���5XO� �Lg�X爕�˰���7.�o��
��(aS���H}��K��$�61W_O���_u=B!<W�Ri���$1�A����[��HN�Q�3�#�T��ۤ�5��m�8R6z;7��T���5Ϯ��P �V[�ȧChP�e�;�.��������a,�$r�&c4��|����7������Z�����ݻJ�����"����(�2�~� ���	����d������@�6�j.�xi��xT !�,0�֚^��V�8�G����z��@0��,e�Q���R3VS'�gݶ�@d/j�����9:�_��!"�׍0x�m�t��F[�4���,�b�}(t���u���g3��BPr��}���iuMS@��O��䠉����o�e���&b#Ҙ>ڲe�L	�$2|ȒY4�t@�Ĉ�����By�,b�3���;jH�?|2°'�f�ju^�O��-��:�+�	P�蝾f&�������H�8��������n���TSu�}7�W���҆�6B�yܒTk�l�_�1���!'N+��"�i /��p�-����z��Q��_���Q�5��nL4���_ͯ�;)C�%��Z7�!X�@��ك8~�>��Q��z*���ɭ���3hK"HY_���`3��!����[��dU1����K?l�I�iߘC"�[bL�W ZqVÒr,"!�l���Z`�����|r���Jg�S�����a���\�-U�7�7}��f����Z�v�V�y+ճ��qP�Q�E�OM,l���*M������$Ϝd�B�ގ&ѵ1a�r9�&a8��7�X�@�}���Y�)��S	:Yh���q� ��;�~(d�#���U�P�(}s�L���)r�VQ[���S�LZ�Փ��#3��U]����yD )jl~hJ˽���C���o*��ׁu��9�����{���u��z����f�8��A����C�U�r
P,�=?$���ּ�9���gG�ޜ,��A��.�Gc��Z�n��xs�6����^ш�g���*��O�*�|��p�~���Bӭ���[��K�Bݫ�ԑ]>.Wj�zUm�B#�ZQ}��b\�/W�~-W�`>Mʏ;Y�v�r�y�qr������F��X��	�e�+�oK#%�_<\���j}����D8[��0��u����b;�6fh��~)M�'b�j�D0� 0H34�0��v��[U�9��f$ǭ�m6Cr!.��卥������s�u�5�Kl;"�FW���R(��k���=�����'�#$�j��}���R"�ٮb-�������wN{Y�N�����3�Og����;o�����|���k5����mX�Z�ӏ�[~jio鵺�֠*��}�H��B0�P������L)�2=�,�'tR"E�v"�D�H�%�@ⷄ�jͭo�	DV�X!U��V�5��9��|����N77��u�soX�?��7��!I���z�\u������J9�\�5�J=�����@@��MF�|�t����͉�4�]�T��E�	��("�n<JF���ȃRw�����Q�q� h"�O��>\���҃yG�Ln�h�t���`�2��̦��mK���H}��Y�����77����5�J��>aM�:]i|K���J�a#b[���(�� ��@�C����ƶ5`�ͧi�Ｇ3�wʜK���y�	�P�b&�EO^�#�_���z_�E���h� �/.<���̊�Y�E�V6�5-֒#�2Bu��m�u��T+2�[����V^ )gc�W�E�qM�xl��o
f�̽s��(�����d.�g���x!Ĵ.l���{�ci��n18�s��zl���-[0�9�m�n=��j��*����	;��?�.2"	��^Ɲ�&���#����)7v@ O��ZK��7.�}kxB�x�Q,���DR�v�d���s��K���ݞ�}Fo��凌9zؿ��N~Wj,o\D��b�q%c�R��}�)K=}������_k��䩯�Cϭ���[)7J�|�P+�#���l��-�[X��X�� ^-^ K$;mD�rt��m�����l�2��Ԗ���&����Q��O*~G�Y�ew�f���Z�J�T��h$���]���\p�}u~�e�;��fn���i>�6���I����Ӓ�������	�ՇҞg"�B���|7�P��=;-��ϖ#I[%�H��q�`�(7Z��2��D �?��/�I�?k]읕DO�3��	H�����4Y
�(3;�	�_Ex����������]�7]lD�H��7�$`�6c&>j�"ފx�i�Ԏ�|`�p\��W��F��@#��"�r�-4�N����Ī	.9�VBX>�t�T+2�o֓��H��Ȯ�����~��G�в� W��m�*X#`}�L����;�1H?`�o�y,��TQ>9Ā��Ty���iu��CM�v��C�7�Fyz� {���=yx#�k�t�3�؀(�x�����5(��$�xF�/uTñퟱv"�ēn�:ۮ��D�3�=[�2ج7ԠB�ctgZԶ&m�Zx�MHxL\WD�N:�����34��r�A�I�	�n�<��b�����)3|D�A.K�.B:Q}]�oHM�M��^,]����_��;�.G�,M:���T�
��E���_�z�<9�0f��-���
_ ��r~5��	a�tb�R2IV�x�v���i��sؕ�ɝ����a6�z�~-�� 4,U��Rι�\���u�V�zu�۪�4����X����Grۙ���Ut�s�M��/��1���"&��:��pK�mh�T!�Z4;=t�\��x=�Ԣ�GV85�?J�f~��c 
��Vg��C_X��r�P��
�n@b��q{B)���C�}�A*4�?
T�^�!I�vA��e�~9�ٶ�}� �b����5矚`���|�Β��n�5l��D5��e���m^!)�{��)Q5�l�^�-���QA�O�-�+N��Z^�TpSm�4����̑�SNL��1B`�Լ#�C�ط�dt7NeZ������<�>}�P�J�~�Ӥ�q �VCY}Q����7j�ǳ�	L�&���-�l�ԊVx ����I�����rO�m�{ݳ��V��3��a�~\*5u��p� PN`M}��n����+4k�zN`����hZ^�����\
��} �+�e���}�RL3��L�j���}*��>>��vK�W"]#���O ���M㜬���*Cb^Sn���7�:�NG��{�^F[O�\��N��8�jEh�%��ٛ7�����r.z�����\t���8"�M�6.@)n�Jz�āk:���9U�cH�¿�ٞC���"/�%l�q�?"�C�cI�OH� R���j=��/�=�z)ɭ��>N���r�/̓�aFGU
�'��b�&-��ʵBP��"�ॠ*����f�ԋ^�ztJ�X
}��?;�(n��-9.�j���?D���Tvf��%�R�٧D��Qk���	�h�]��Xo2l_��Vp� b'�Q&Y�%����c �})��Q0��褔���ߥ�e���u/��Ep=�eH�������x5U4q����r�����7�I�h�Fe6��{�����0��u�u�.���~�3�[>�y��^BO���1;����,HA�!��~o�o��Z��щV����遠K��/�O�ѯ��N+�ѝ7y �Lo���y����0��c��d�*�%��q�T��*�@z
E�m4�E7Wh��0��K��H:'��w�wQ�쨳ϰ�&�i    �.'�M�hfe�ce���r-�;�F�X��J�VÔ��m�ez��&����nJ6�x"����e��I݅�R�ϺݶTX\6�w�+-�V�_���O� 5�95{��񗅁�Ϗ�J����7���9c	n-�g����Ű��t&�4�p�������a��jwkƿ��&�-2�]i!������hX��3��8�
�`���ݐ���y)������ȸ����V��&ׂ���W0ô/es�i��@Sp����<v�q/������*ߪ�u�i�������ۯի��"��,�欯��)�?�|�l��HK�Ђ�&�.2m5r�5]���)��;/nz�]@f��}ް)?�
?�$}�g�Y����r�� �Q{s4[����I}�iфx�L:��'����@�
����!M��;�P�)���\��"(�40�U��r�������F����Arw4��#VDڹ��� p���}���n�h� 7��0�i�d&f�uO�g��)H�p�t.Tg0���C�u"�RH�忡ә��i$���v�J����T��'�ks˔3)-pY���\�y\��"�p�R�N�ˋ�'���h��D_�z��ϯ��sO��&(ԏ��/®r�ʈHQ@��+���p�|08��|��a-��Q�pRy���r�Sf��+~@���4(��-�Y3�B�nC�kO�d������a��ܝK�e�
g��kmQK�a�ݚհ�h�ݰP��R���r��V�z��l��J�CJ�p�A�ʊX�~�����ǚ�d�
��,݁�[f	�X���2�Zna}5�k�=��%�!��:���S�+�08�xr�?Ҿ������ߩ��"3Q',�K�ô��.�P��/4�����\�/���9���O3����`U�3Iүiҙ-�+��iNT�O?���3� :��a?칌�n�������>����w�u��+D:�h�8QB���	!��v�
<��V%�i����������_"YKVN1hߞ�9���ʋ�?��&��w�0�0���}���l��p�񊰺��=�d0$�����u�����ݧ�'~�����Z/[���߳F�p r�a��"���y�a3{���f�O����=m�Z�ox��U���c��F3���?�@ʗ|�5���l���D�����U�ʀ�ܽ�XGy�k.�oC�և�����~��;���}�g\�H�{v<XrO��ă�Wk&�3C���}E"#-�jҸA�\ʤ����/È�kW�3b��q��Uc��a��q��4�& ��`aؚ"e�?26%N$�G\m�0$R�<?�����O�k'O�S-G	g����XKiQ��B!%`�ǫ�Q�3��<TP�P���R�s�ņ
��a�m�*%�W��:S*9���st\M���D=��f7#�V�!#׺����r�X"��yAa��D�ʤ*�U٩����'R�XϒQ�Xnw�?V�e�%���� $���G!@�L�,�b�C�U�j��Q|'��6�h���%lV�Wk\]IY�5�K�V��e$�R��[v18�vL�m�D�`��}�F؃��8jX�8h�.�u5i+�����o1;	ƃTF3�� ����H��j�K��7f �H������=�s���J�]=�$���G$�_ 5�bI�P�j+�s��n͓���Ԉ��GL�A���/�1rC ˥ZrUO��
G+rf�1���4�J�2�t̥#2ٞUu�~�|��0\��[�=��3ӌz�w�)WZCF�i�UeF�-u�;$Ng��9����Wj�'�'���u��R��R|I��G�]����۠2(�4���U�ݦW˪xt��S�r��wJ��`XjU}�w=Q�+�܍wL�eU(��L��#���)��Q>.�6�o�͜��h�wS��3�O#v֞�PoF�ﲢ;��Fy��Hd����$c�	`"�6#��zD�"�3;p0�� ��A�Zx����D+l����Ǝ߽;��>��9�
A���ݠY-��2�,U?t�>Hߚ�R�+i���t�|�Y�>#�I��'Y��Ț��p&bz0�w��м-Y�l��5r�L�����n��s)�i `
�/讇^���C�QNy�S�<%���g��-[f����c��|X;pW�s(#a��e�/��!)Y�ß�޷�L�q�a�%� BAGvA��!3,5�ZK*D�(�#��o��Ϭ��]�ێ!�7F�͛X��� (C����#v�(�ޥ�K�Ig[�oն%- {���}���{�Θ/�bNN�ԏD��7���hm�6�O�(��IvIU�����I�zA�!�� 񻌢E�<b[bN�ą��ұ��n���O��6OvӜ�fzr�8�%������t\-�fͫ��fN��Š�z�zݭ�<�T^���D��jƒO>�Vh\�NX�,��ܴ�G
�O��ge��c�z�W隝}O�_����P�s,�F��ΜH�S)�M��Y�:��6=�(��Dف��x)�"�B�J�����MD��	��C�v�Z�P�#,�C�Ҝ��®��3_��p7�%�:N塞�5�� �C}���]sBt�u�4cAM1�a���t��\�-uYa�!����ʂs�Q.Tjx��|W�^o�V���X=�ߊ���_�jNE�	�I4�6�L9s���!�I��,Z�����6��f�'����e=�oXP���\�T� p��B�-���[�Wk�_󛕆��R��3�F>y��ƭQ��t�����Z�m�ok�n�'�"9�����7G���&Eې�����g�¶-�Y�	\=^�k���zy�e���#��͝�Յ3u��ا��~�=Q�g�a����OE1��h�&<s,,�O_"M_~4�H���dx����c 
�@8�E�1j^s��xE$B��yC���hP�L߱��w��v��J�����^����͵z(0�� w�G_���D����߰{uӛj���0�[˼`䀿�X+w0�ԙ�~������3C�;k���� ¼37�vO��%�s���1Ӧ������a�RߚZ�V��-��G�(s�1>J�m������C;�̚2EK0�����-C�L��d>>�N�� ���\�UĤ�敔[TT^R�\�B>�E�"u�
�v���f>�t)x�T-26�{�Xs�m�fgh2�/�r=Q.o�� ��a� og�`X=���sg�\�
�K��$9E���=�[S�Ms]X�ͧ�u>�g�[C�A��BW/��W��K�Q�G�v������B��F���s�����z5���D����� z�щ1T��z#~�>Z:h$��q-�M���	�i������
��H��$e��ߡa<��jOsiu��C�^GŃ}�RO��H'$�^�$�s�tn�����ڭW���N�H��,��7
�;��[}qpy�����L�݇hB�8EP�{�\���On�&���:hKV!7��6;/�B��ޒ��-���Z��q�z�Z���r��[��9׫yu�+���J�P΅������6=��g���r��{�:��Q(A�X9��.G�r���T�6SFWa6P�4��+u�n7�{�9ɔ
�'V��Vֈyʟ�B�5L	$2�!.�������<�>�ĸݐ��wv��2Ь�~�6?��4u�P�eq1��~�#�6^�)�P`.dF �B��.z!zhT�U��9'������0��!�"��Yt�)���9�P�s��r0��KL� 4�Z2(T�ɻ؞���C�r�:�^h���&�d��~N/�>�c?R�`~�Ȼ˅��G��k&C[�:;�M�����
������q7��&�@�~d؈�� ��i���.Qr���~�>R�+{��޵v�v��\j��M#��V���{�"���z�ր�`d�WБ�cL��a��Q�W�y��/"c����\!��+�R9��r�\�H�z�D�k����e�aں"g�E��y��#xk�6��nx��kd��B��Lo#($��i2SC[J����v��)?���b�`]��PtxFm�����_R������lJ��#%�a�3    ��M��;�*��*�5����Ul���.ԂOX֏�U	��R3@B:x����w~�ymd�a�ܨ�qSi�L���Z�ʹ�����J����RX���ʈ�������+�:�I��*�h�2f�"�9=����ʻ��'M��*,�V��(Q%�c!��r��Ž�ʯC���{�v\����\�wêڱ�F���¦��XmV�^�Q<"px�����3Q���2��	��m�΁G�
�B+ ~�K�<�}59�i��i���e)-M+�T�
��a��}:��&�>ht9/M�}d�ޱn2?$[h�<)���SG9m�}D���_�g���<������qi�q���6yH�Q\�fK�y�H8��.���Mt�Ӑi��}�5�n�9:��"}d�'"�`І��$�©$B+�:��Q��I1
���/�E5�>�(�ݩe=�/ب��� �aXwo㽋�Q	��Ȯ�C�����Z)(��9���
K�Э9�~�T��a._�������P*5Kc��lD.KZxp��=]U.:����-��#y;�vRih��4R끉��=�|C��)`�G�B�!A������9C����M��R����{�f��axg����F�q:w2c������g�*���`Y!�ω�?��s�ڦ�
м���n[���{����E�J�'8o�RAy�pE?~��6Q�TCq.'�p1O�و�TW��ޅ��۳�tغ BR�t��n	������헿��W���	A$���?��|�)�Ш)r��A���zsj�3�$f�C=�RdQNW�w�V淯��x �~�Bmƽɋ�(	|D<�p3x��hk�WA��D��Qq,��@���9�H��ͧ��z����|O7�fL��ٜO����}�[{s3k[Ǥqu� {�8������J�\vK9����:�W��B�Z<z�j�=�~�2q	U�@Z�p������^��?d�tw�w~�4�|S�������$S�쒤U��FP*r��ȹ�ԫ�o� ��Ѿ�KlL��u9Ȏ�"'EueftR.G�m,U��$y��7}���m۶%�}�N��(m����tb��"xRZ$5gN�2�ֽ�����E)H��3ׂ�E�k�Z�o��B(��G�/��@��x�$��|x��i.{�avɻ袽h�;F��̓�_3�ӰC��1�U�cC�8��Tgy߯G���䳘i�]�V5�}��'\2�ީhw�ٴ�?z=kX�����|�0[Od8:�<��ӹJ؉��6�肓��Xw�4k��U�Rs{W��RB�J���t ���g�r/�+5<���!�����_~44<f~�pB�N�Wg�)�_¬�r��aB��ߑ�Z=��9\�a*n�0��0/��A;y+O���l3˕�zz0�w��
*���[o�sn!(��z#����w�M����P|
q���	�E(��G��vhz��y�v'�W�+J;Ưkn�&$�����q_��a7�BC=�������)�O�
�F�[�&ЖT�M��N�%�O�K�vN���N�3���gr�Sgq7g$��i�ɢ��/[~H�#!Es'0V E>��T�z�̣0ˆG-q0Q_����K��h�����'߿׎eff�}�DX��:wT�H��p7Cvh�;xAMv�p����s�4�m���0�F' ��H�|=�ao�BR<��A���/�K3�P">XE-j`���X��ξ�R�XJ��[�s������b�zAP�r�f��*��+հPn�Y�{���[�6�R���b��x�
W�ɧ�g���y5�����RUtEU�۹.�~��ˋ� )���k�|��ä6������A��m���Έ?Q9g�����.erH�V]��s�#s@n���������6��1tx��5���N�O�y3���l��h��`ѣF)+^�����"kj2���w�k	���� O�jW[Du�k�C�HӢ��g5�-���u°!OMe��b M��� S�<�NH��"֒���S�ٽ������d�����zt�P�䏛��rQ���\Y�(>5Ju��R�TR�n��d��z��lp���Ů��z2�G%����!��0S�Nm��u�9�%�=����G�~�«0��L�~���{��^�*'��<>es�	UvO�N��􁴊Z�@���x�X�	�I�+/�����1YB�����r�bl�.�p����{j_�ʔ�K'��N]���;��&�ye���E�SW��˕p����Va'=�[��~�oT���K=�4��D#�1l*8� �H\��(���9a@ԡ�~�`����d��{z/�K�V��<�jg-�#�m�����ݡ�R��Ы��fέyAS}-P^h�Zv�\��Z!Gh�p�w�A�{���}�Ce����>�����۰UMB��>P���Ų��&1�R�:�V��t��x��騞���3}"_B�Y�{�iP���<�Q���[A��Iq�3ћU�/ \��W�UͿ���D̍tLl'6�:B�o{D�kk�y��Pr�T�G��;�O|d�:���<��oxX%�cH����U���D���М���`_�_�t���)$pH���|��"~����꧊�Ȃ�@(����/����r��x�5|��'�Ű�f@��� -�b1[���r���(W��N��/��
n/��d�H���Y�'�싿�[�Ӎ�>!�g�?qoʷ;�j��z�V��nP���R���9�Y�B��a�~�u�Yxa����c���'mgt���a�l�� �ɑ��R�]>l�X~2g �������m��19���g&���'�?6�%���a�H����H�7��ٚ+�	߬���V �\��ѽCJb�ށH�A����Z�rt�UM� �ħM�뽨L�,a~��S�0��	�fU'.��{���^�V|<�y��y*���$�z½@��=���@���h{��3���IWGmޯB��K�r�_k�nh�c�{��z��k���[p�YIVIhH+x��V��YH^�]���r�a��60����g���}u�O�c��[��W`��7)$Lk�a��t���jP-��|��R��vk�w���B�\)�ܑ�1�a_��� �ie����|u=��C�E�l��2�V����|JE�L�)z�?)���f��V@p����;�T<�K(��y-I��$�l̉D�`ɱ.H�dJж��L`B�&����#5�x�zЦ䀑�d�ym��rj�1ع��g�5G���mA�h�c��S�TP�P�p^	]-��
$�w��0�j ?����Do5&�`l?7ϖ�(�E��iWR�!QB���[:+���#��V�si*�Id�6�?��)= �a�V���ev'�λ`�]��Nv����v\5�|�˩ȣZ)��\�s�9���\���2f��7��43�7����x��>-Η��֜��{C#�������}RvMo�̳ڍ���L����GEӢ:?� +uph,�k*�d�����?��95���e������dFK�?e���L������>�P�;��hq���P�����YO�a��C��7��.�+"4�`�b4M��*��ǹIm��ѵ�i�a]ǗD�v=�?,=f���XE6}�Z�$�q�?p[Տ/K��uT�Ky�+6�n5��a�XD�#n�za`o)�����r�9�{7}�XS�I;s�������~eB��;��D QT�t��ä!�$\�X�P�-QT�4|�N/�n��/�
�ܓp�f �̉Σ"�lJ��E7�w#j�EK�ïW�ӳ��_ɡd.���.�:
6U('��`�ȱ�|�6��JX��?�B��8���t?���s\��[��f������<Qt�Գ_�#��T���ؖ^�Z��|ѻa�$C�h��鉾]�{"�`��)�aƉ(�F�zJ@ġj9�Xl1s�J����"��|�IMrj@9���w�������Psth���>w���I��8�8!�1��L��G�ov57�a%�|�T��z��~����&Z�r��5����(U���9楑B���    ��E)'����F \�1���z�\�H���j�J�t�Y�}�%�K�^?a�cȃ9Z�\�$M�����y�����}
I�9ԟ'W�
���]}�%�}T�M���X�+�n�5I�t�Xd�&j��Q.,9�_��h��������{X�N�yd�������tA�n;᭤}�29��'�R���b)�t����\�.ICH���Eؑ����l��lu="��j��[1���\�Z���Քtd�����+U�����x���R|z���(�6]���qk~�V��Ū�q�\�x�|ޅ
�[��V��\�X�cޫ��#�2x��.�����wĐ��!���gըl��m�eΑ�}B���'q.���`����c�~z���H���/h����X����2#A7�AۻP���<����B]]�����L�3^���䭂�5�?1cm�>u����^u;���9�HS��Hӵ^��05I��+�#`�V��O�[R�3C�ϼ�5��	
�.Kt����Ԭ�3p���fF���%O�]��X���~�nJ J.K�O�t@�5rV���Y����B�$�3�,���U8Ω��P+�����R�Yr�z1t�j!�/�F�?�ta������H�2Ҁ�D��Y���	D�S��$��6m�y�]�;P��	@�#���7q�D�h2���8&6�th�Kd�ɐ���|r�B�k�:�+Nm�?�y�<�&i.J���n�;PU}������_�Қ~�v��3-���?�����{�"�6�T�lM RJ$!1�����`�Zr2��+�����4OI�Ֆxd$�S��$3�	��ο��Ft����5L��=
���K6ifḎ�I��S1�$1�AŶ��6�`k6yUM?S�{��*�2h"�8ؘKAh�A�>-�3|Vӿ\ʇ�h���Ƽb���L�b�� p��7�&����f]��/lѨ7��,��>y����0Wj�ы����ꇮ�Jn����:oA�v�</Sx����D��/sWh	@��>D����oخI𻏧Ԫ&�
��EY F��a.0���"sI����fQa��~Zv���3���2N7B?fB#�6���ߩ򆱉�]�<U��E�j$��y����ӰO��ĩ�DSz[�Ѕ�$�5�I�0:J�k�yR�O@���9��m�5Ȩ!^$�,���6��L=�O��Q_Ϲ>r=���B79Ө�G)���n5�l}�GmM�!1�.����{(�ʶ˟R#��#�~v��4�Ǆ��Z?0W�}4�����C&Fx�e6�#a��6�0X����"�^T�4	��j�Z���*�:܁�m����\�/�*�HJ�6����
J{��z
E��h���GG'�)İ8����z� �˱9����ZJ`3rv@�u�i��2"K�R�n�;�eG)V�ڎ���K_[S,=rܞճvd�?�!=�D���)�d��}�&^�3X�8����������K��V�R~IJ�B��a�D9:��Z>(�{js��V�3����4-E\f��	1���"����{�/�	J��W3��5����I:��>3E숐���K�.?�r�@����v5�%I�y��Z�����6�	a�r�h��i��1�(�2�y�qHw������t/l�`�0g� N��'+��x48���������}�Zf�4��1����CmM��P.�^X+��Ja%p��*�r�f��,�kAx�v��*Z)wx�<K?ۙ4B(�4�����+���"���\�5J+��
���i�'������h"4&��C���G��[��١�&q�HL�3˙i%�D+=���]���;�����ɦ"B�u�ړ^8M�զ��g�5�΄
:D�|_:L�j0*��W�?#n4s�W)GQ��Lk�>�"��n�d ���<���Pc���afx��IC�<U{���	&2�}ʎ)��n�������j�O�Ɓ	09�/�5ꕫ3#�:ҩ1'�ѭ^0X���6�>۷{�4z�!�*��7z�;�p�_�Ǜ���z�\���D��L�z������-RZ�,R�����Ba�,�i�Y�S���z��w+�|�-U��Vk6�b�Q�5�\�بU��r���n�o�m����F��^P�˵�
��#���7�B���zBUI���������-�!v�Y�S�PQ�>�0�B���V���y�^�J/6R���
)䥪]�O+��-�N�s���������~!]4��}�������d~�y��V ���_8:���Ӡm8e`w2!�._8��T��ؽ��R��y+s1��vض��+��N���Sw�qg\���*<ud�d�֏�
C��:s�_c�c�|R5g^��{e�tS���1�5�me��%8^ᗘ5����"����������!Uu��� ��r���e���Kb���9:]����
�y�Ɩ��Qn�GNr�
��v���5�~����s��z~����y^�*����G��q#,�j�b�J�<�H��J^�ŠZ-׋�b-8"z:��@�br���N��1�ی5Q�w��6����֩<���BTr�e���9b�\����@�?e�n0jp�#)�
�ʃ��D^O�8♲��mM$�������zO��&Ka>��̰�0���j�#&!Z���gf�nud<"}�#R.�.R��"g�ّ�&�+s�EH
�5�K���A���e�xZC�)�A�E�˿�����2ue�.��Rߗ�*'�<�yFo�5�f"	r�`:HŪ��ư�|M��\*:���y(�8ۘ:#�������4eF�'v�^��O�=����8t��ZT��ҨT��k��[��[+��n�\P,�Üt��6i����ۏ�M�L�i��4�!�ewiB�)�S���]����l
r���q������̈��d��-b+F� ݁y��Fw�9kQ{o����	&�a�&���&�ϵ�?baޔ�᜙��:ljaS��0�^�Ω�+Y�]���0R��&B��I{�"�֜��`��9�߾$.N�����g�s�{��f�5e%�x[6q�&ьPy4�s�_�ߩ�1�
	Fɒݚ�tcf���5_M��e�����3b��,2�O�-����=�ȼi'�/�0���|�9s�5?3r�ў�K*ɫ,X�5��tj���1��z2KU7��O��(R�3M�
����R����61f�	Y/X�;3K��T6vsumqG'�aٝ#�M��1�I�!Sk�Z�Ì_�8 R)��|�以J��6<_�N�F5W(�˕Z�H��}$pRZӍ�?��~-�&���z�ɊD;�$Qo]D�	{C�(�_H���e10[���ۓm�c�2g�{�*�٩�Mz����`o2oO��ͫk,II�6���1-:���e��wI۶YP��o��|����>q��)�!Ngͥ�}��̏D
�!�L�^{p�*	��`:럓�!]=�#'���Й���9��B"�gY�V53�-*t��f�9��+�ֺ�7���ĥ���I�I�X����|2|^8qf�lN��wH�SsuS0,�J���ƙ$��!�e(-O9g1���sI����^�48}�5$uO�T���"������dwDi�Q�����;��������1ݟh���o�Ck{�U\�AYK�4턚�o�`����==O���E��,f��òW���R5/ؕ\�h���Q(6H�xAВ���>�=ȃ��i:�1�9Bv��'ǘ#���!<6)��:�~YE�i���_���:/U���pF�FI�M���@dB��i ��،�ob�?U[c��oA� �����S4:8sR�p�6�����5A֖\�Ϻ�>���*��+(�^��@ZS'�S�wU\�QZ�r<�x�r ��MVl�w�Fi)'ډ���w�����uN���ix��qڭf�cpz��M%J�猴��u �ES�Y$������h�KB
yv� ���
�c=�p|��p�t��K�|V~~m9�X7u�/"�,P��>B��i�H�*{a[��'�nB��=`    {���6&��o�fB��~��JA�-���-�a�����m
�F.��׻�a'�jM?y�����6mf~{s��{��RF�I�ˎ��NK�kh���}�%���%>Lcg2���{����4��zJ������a�S���or�Zɘ��Ο�F/��j!o�G��)�:s�HŚ��Ў>����hz�ʭ/�ȭP+�p�:={�N�c�1�����7�{�'N}*_�^	d�)���;��e|�	�K�n� ���h$�G ) k�'�SsM����mx��8k���	�v��vLy�ʖq/x_{�E"/�v��i��No��	����Q�F�֢y��ނt?�q�҅�Gga�5ߜ��S���pԄ�8�����wi��"Y{�v�ph�f1���q��Bm-�!!Ͻ�ϱ���*�Z��D)�:�d���U��w���ڬ$Q��:��X�� �:� .��,zJA��4�uybf���@�:_n�/4�R����R�憍��yr���h �{Nǋs�}eas�sk�	}g��;'�F~ڛ���*ZI�2Q��g��b(�W�#�l!�������o��Y�$�i�����c�Q�V�Sn���o1c�Ø��$���}w�C�?�_�D�pb���0<Ǌ��Gʰ��D�'fp��x�<%n�v���Ƥk��}�̹�8�c,g���D�L�B�қ-5��V�E3cч/�zAw�<��:�?�(����;sh�ٻR�'�|HE/ �X  h�Ӑ!|@8F���C�o<����^�E���[�aN����jrA)�^���ɅgMI�d�Ć�V7�?��\���I��d�^���<3��so�Y��o�����BX��Ŧ���G�%�ި5�w��\�R󋕲��ar%��ş���~a�dĪ(�W���|�Y0�0RS/f�w�%8[-�5C@9L��D�.[.�z�6m�x���v��w]�Q����D�G�`H��u��e���C�Y�Qd�l���~�4�]��){�w��x,3B�V�x�˖y8�"�^�C'��Ma�Kf�09���O6ߗvC@�C�jp��PG��P�ѓפ�J�qO4�F�Sg�vgL��⼠��~͉��z
O4��&���ɒw�V1b�p%�y���ZZt�)Mv����h��=m��[=���y�B_�u��|ڗk�;��&��$j���{����W�쒒؎�Ϩy�r���_F*�L��$��dv��^��\6ģ�L`�T��B��a{���}" ���hCHCj.�5����o��s�򝳤�<��J= J֒��҇
U������7<=m�R*Q�'�Q�/)L���%x'@���I�c|�@��s͜�,��z��V?e�v0 ��P��)�e��2�)�˔��7Qb�=�h�X����xn��bZN��ʥ�BE9���W2�f�aͭy�ka�^�k��B�p���y8��v�\�8#,Arm�		���(�����	x�́�S��z���5��V)�0�������s�-7��=E��*�` �;��gɛ���O6g℡	b��ީ���:�s����l�xIӄ2Qȏ5[~���=ҡ)˜�W���7jŐy!�c�3u<.A���g!U�
�j��I�(�F��s^�g�����s��Tj��2�[���^�)i�iDpk��IS����N?����E�<�c�m�h�?ȋ������Q�i{0�=m�~���a�%q�#����{&Q^?l" n�̪P�/�R���iP��|:l{�M�Z`��˄hg/��k�x�H&�l���N[	^O�E �P׫�2��H�/u���w,Y�`�"Wr"Y�g�1�H�O��4=��.�w:�>��1�*,hu�_P��jg31;V�-�ք�9�,,�TlI�Ҳ�y�^O�7ѷ���Q��en�w��|�r�XW��� �?ۮm;� [�"aW3Xd�-#�}�Lg���6
�2V�\|>]o�-�x���s�����fP)���_/�n�\�/V�b#��k��ţ^�b��y�Ý���$�Gw�-�E������黊�DF�fhv�e�d��8��/�;��y��HD�t{)�N��g�zD���%�&��Ya�׺�)��J�0�kۣ�7񻽢}���,t���*;�%�}jN����X�^�������kuN^]hM��Dfz$&�zc�Sξ���ڎ����P�<Ro��`s.�{����+�0�9BRn�=�<�#HBJ3���z�w�7��c(B��9�;ٲ��mw_�D�p��=�"��?F��;�7~3��7ܚ�e�yAU��+ir�s�Z+��2_�y�.:4/Ȣ���Z�Q�P!��Hm������hm�{�ء�q<�MfW�]C�\9zSqD���o��=b�6��㺅����|�
4T�N�s�S�ۻ��/-1�oU�9/t~ ��J�mT�M{���k�\)8����z���d?�]J��̌i�U�h��k�ڎ�ltE���:�MD��T�j��o���诘2;���(䶝�k��x�	����L�����n�"c|��ޑ���5"2�5j�еĴu��l����h"A$�AnXL]�*ZI�P}�Ȣ���(sK찆Tt����R�xM�ħ�E��i�qFˍ�գ D�O��Ɣ�T`���k��A�v� w������|	=�՜����������c���!-M���M��|�~��k�R���Ͳ[��KnE�����TÐIm��u<�?f[�����.UJaR�cm�0	}��tL�CuHf#ikw��Z�|��H�b�-�_|L�cO���%���+��z�+��1Z���%�r;��>�÷5���{��u|*����Z�땺	5K�XE���S�?��iMR
�o��)�a��u_�>(�\���TC�4@P��E�̯��Ut�~�^Q���n�Z�Nb�ѩ��ȡ|wē�4��}b��*E�m��9�5�R\=B�����Co`���vs�`�T<�N=�Ab�O��/�:(�w������ F��/P���UQ��ȎqG�X�W��`.��Hș�K�T��0x��,��,�ʓ 6�R	�� �YF3��������� ��ߛ�v��<,�^�K�څ9I&6$�ġ�L�h�g�i����܉��o�&��<���r��'J0�:��J���>o^�-��U��s�_�y��7��Z��@����b������`�B�0]!Ac���mtG�
$	#�����픚i��
op6���7I�����C��&tw,ʌ��#�G����݆��[3D���38����G��%�n��}|����J�����@y�`T�?yO|\+Z8#������~[�VԷrW)�(ՄO(�v��-���V�Bh�y@@��J"��ZRND�&Үr��>��Wn{�Ώ��5]�BrS�]�1$�(���m�$�e��j�$��k�}<���9#6�����?2�/�s8}-�ETWr]D�~q!�(�L)�^��VZ�X�A�E����O��1a�5I�`t����]VܶTw�oi�=�1�T���u�u�R��A41^"��Q5g�%W"l	�1���|�w���T���>�x��|�i9Hx݈4g���TƘ6�S0�
��p |&w\/���Z�|=����Wu�\�-��_���f��(r���F*�9�"�ms� �FG3�i�wx?�i���S�0�y�8\{��W���AR��[��;�Y��ޓ]�0$�"����/B� ��B�����!�X`D&t��|�\πa$_���[��"�O�qz�ط��O��Ԅ�uㄢ`�F�*����腺=�D�|����A��&FoH�P��o#hkCڢ���'���K��K������<\N��9L2���p������Z�$��Nޱ}�̹݂�i@Q��a�o�g��o��\�?�1�^�r��Fhb������+=�ч�A�+g�/�ҕ�{�@%�U|����3Z�;g�o{}a낹��[��x��Ɠ���:ߍ���b��K�	�p���Z!�	\gR?��~r;h!���r��W_��f��y��U7��k��_)��`�Q��}"I�ߖ����a�r��x #	  �,x^��C�ӧ�	,,g�a�\K'� ��QM��2jqcZBk�J�ik
H:��v�m2�����oB�ܞ5*UQ.�����{(R=�h��	+�'��$E�� �A|a�X攃T�Y���[��U��HY�͍�ڞXwe+�V�����
(��%��/2�y�Z�W<��l�Q�$ML�wb�
���c�}�h���>Â�ӡ�F��3�k��'�S2Eצ�*&�(Ҿ�������%3��Nd~!��-aT��/��0���N�Ό47��X�O���Sg�Ʀ��*,ڗ�;`���7���a-f�����&Y�`F~�i�Gv�q9����ޏR������z�J��5�U��|�Y<b���^d�6>>D9g�p���d�G	�gI��f8T�v'OO���L�,F8F?Y'�/�\��d�.���DXA����$�y��É��4Z��U2����)���8��
$@\��^6�� ÷�o�s��0����-k�o�7�@�m�H���k��fL����.��bpތ�t0!�u�ƿ��/!�s��K�9�p�V�����PK�L$뺋V��*�#���9�ϫ 	�Hܭ"1�����p��@���Ww�t�&71�1��ELV!�-=������qs����@�H���b��I}k�[�իǕ���x5����&T�4�|�^��A�Q�԰� K7���l'l��N��Ihz$	f�]u����\���j������:��7��)t��|a֜��ag�
�h��h5����[����j���:[��7��cя�`ϡ�`j5�Eld4�n���%�z��3wU���2B�lA�ۓ@��*����HL	W*��Rt�%s��{�K��
ؤS7��{.�k�T�I5t�wb�%��~b���2;��nȤ�� <'(�Ut9k�D��?�M��O�i5%i�L��.S��'}�5n���2�]�ˮ����c�W��~h@��a=p�a�ꖂ��֚A�m���r��W�^�ȰVwZK��7?�·�U��Zj�':G�+��z�5���U���j=*ʮ.��g蠝����&-�/½m���6�_n�K�"s�g~�!���$�>��E�b�-���^��ߢ�ƭ,."ne�Vϝ��3�
�wɊ�?� �O�R��Ͱg0K�����+���o ��L�L(K<He��x�P"��J��d)�qJ��\xӥzu�� )����Ⲱ���#%���m�['�}�Jn�0��MQ�w�Z bjͨh�~e�hM�Ω�w�y��u;@/��:�������}r�)�Φ�3Q�Z/Ԍ�Cw��D�Z>}wk��ٯ�fg��Ƌ����[x�j��'Tf��� �\O��-W?�%�Q2c��w�i�����l���~<A�?g7�r�*�rج��r��rACE Aѭ6�ŢW�+�J��ٰ!��cُ?݀R��Vg��L�.�-��n��w�Ж��+WAQ:O����
zA���?L/i�Iʵ�#���;?��(:���B�ة�����Ձ����[a ���o|��u��A�������� �n�{.9[��v~6oA+�[M$�0,���A*�3F`��!��N[�����W�&�c�ex�A�~D�!����C/R�":���0��G��7e���/o{�� ��0��*���(��.�[��CB��Dr[S��.��[x+�"�`蓸�&�&#˫�Q����"��� s�x��ڿǏ�G�\�'ږ�w����p:��y٘as4`���`�T-W�׃��t���z�S��
�z3x%�H��Ti�����ߵ�qyOs�k�j��k�co����B��2ڛ*��(m�Q��9	K�Ht��;�!�>R~��H�2�/^�o�����M��e&�� @1��Ɣ9�d���ە�`¦��$3'{{A�D8K&$���������$S�yj�Q���;��1O�=7�x�)1�Hj2g��t�O���ʩ�#��x���糯� ��͠������AR����� ��WX��%
D�N��G�=9k��w2{���Kz��!���w�g�)�*��y!�b��:��'���5�7�.�2j⁀UT0�j�%v�el�7�	��j����;��fb;JP¹���t�G��c��%~8u6�^O�$����A|G�q�m�a�:���eobQ��Rχ�7���V��:3�p�㔃g���6L����]vG�ƨ�M�b�IcK�Z�#ۀ��[���mF9+&B͉�yb`%�TD�OI�睞���j=Wl�A�	��F]�\ӭ+Uex��BՇJ�_??>>�~��M      �   F   x����0��T�܃��[�K�_�wAL�UeXW���6��`�X����
�6��J4zB�""?F      �      x���Yr$G����O��cQb�Y�%���m>�ŮE���Mj�W�*QH���dh~�l�Ii6#.nS{�&��m��ϐ��r�;ӣD#!N��*fھF��b�ǒ9}j�츬��T[�Y�����K���&��oW�Ľ�xI�e[�ǆy������J�Ě�����SSBKm�vX��J��l�r2e��)ƵWHa�(\)��p�����������5mg��G>����ݶB=\���B�=U#$��k��j�y�,�l�ٕ�pm&k���2�>;kzk��<R6�$r[Fٹ�&�H�j��ZM��V��J��k�,o-+pw�4J79ɬ.zߦ�(�E���b�7��U�r)ER�f7hvch�M>��s�r=p�m�m�5����%r�s�.ޑ���!����%�s��ۥ7�\�kS����2�-�7_.��+T�p��vD�HB
��G����G�[b$��z����wۍ��,'��;�ٍ�A��/��?����wg,�c�J1��d��+��R>F�2�,���܂v]�&6nS�����%�־�rQ`��MoN.$3���9{�Dc2�`dS���jа��<c�o�v�Nޢ�XnV�w�)|��4�!���Ц+ۛ�
����}1QF�+ڞF�o���ps�*�,�§�bof����:Sǘƭ$���GYD�V4>�k�*�M�~�2�_�{���$^��w�Kr7���f���5�/�w����_����1JX��`�0L�|%?K��E���[
?^r���O�ޠ�g��n��5�M�-h!�bs)\?b��'��K�*T7xp����|�D#o^.!��7�~�-�ޝ!��4�I\v���]_s���G�Z �b���h$�p���R�Ѯq������B��.�O,Vn��c�{��3�M}CK0|����K<�^ �Ms��@C��+���+���}�n.�.���'4<w�>$W>h,��꠹�Ҹ٣9�c��Zӎv���+P�e���+"���4#����/����=/d��k�E�hw��fDMIy��i��`�t^��QI޹��A�.�`J����!�Ѓ�'����e����Lz�F&R*qNS7�����E/���J������q"D�%�-:3�o`�/b(��kiA���g��=��yM������i��F��W����uR�_��'��}�9�/�{�7VFmdK˒A����X��i&�ǲ�.F)TZ�*ҝ����a]��}G�ȵk��CzE�E�M���[O�~Jsi��4���gO��N����u� W����q͒V{	٧}Rސ?[߬�_�5U�#�%�ɛ+�*(��ق)�$���"�.��[��U�y��f|�!�Cy�nJ-?�G�UZzG����|�qŁ�.,mP@v݂��9q�d� �dUȰ���I<���l��I���^��顩]K��j���#�ŧ�g߆�),�էy�g��Rml��k8��������z�裍 �3�/���"5�L$v`��)��`'���2c�$��K���Ӳ}���ӹ��v��~(���v�-���%.���\�WnP>�۰lw����J���v���v�`���N���\��&ם^�+Y��f���6kW����$WMŕM��	��h[L�i��4J��jZ�$�ZG��x����$p^'�zj}Ѓ��n��6#�k�����PҐR���ɻ�j�,���G�'����%f����b���`�f	iU�)|q#��i s�l1�H�q�𔜱e)���ބ�G���OV�Sv�L�>�#t�z��1T
�}�P�������� z�X�;f;�@j��=0 ɒ���*܀�� h�������4��+1`�!a�`)���h�5���UU*-\�N��̑�ɉ�;�C�]<��.]��r���OqjX��nְ�+��J�4�6)A�Y�#��&@���-�q;�Ч�R�l�N�n��b� U_僈�=�yk����2%�gH�*s$�DG�X���E��A�2	M���,��2$C��p쩩�1R�^\�]�]��%���X۱>Km��)�Z�v�CKv�'���;D W�R�A��Ϻ��p��p?��Y>���.��U�cq#�G>R���K4t<WG�l�F�!p�sع�	�{"�j5*y�$��:��z}iD�W;_*�t�s����nm\�F$i�'i���p�}��2�[���㢅����z�ZO(�4�JH�9��B�n��k׫�i��ԁ�Y�}C�o�u�<>������^������͘�<����%I�Kv�xC{)%7PSΆ[��P�6_��Y�E��ar��p7���a��0Z1	3��6�6H�mk_�~��[V��st��n4��7��A3_J�r�2�0�G�vY�
���im�ά3"p�5�L)�q��'I����Գ�`;+Ȫ6D�u�(���n���_B�Co�G,D���A��@1īJү������6o�Q�1~��\��zo�J��`�m������4���h���ht�5������z��Y^&���Jד�h�2�!i���?��[�W�S��n������C N�9W����9�B���!�E5�$m�i�f�lJ��=��6(�K��H�7�3R��	{	]m�B�M0�$�	Z�^רy�{����'!�=�uB� x�#��'��>_j`�ӷ"�C���z�RK��v,c�=L�N\�4
��5+H�[�1�ecR�>֌p��l1Ȼ�vV@>����p�\:����U��6aT�oZ��Cc�2��Y��E1���Y*�x���hc��<��|D����X!�w��s[j�V��ʊ�]��
z&�,��m��-H�gѺ'�}��-�B�\_�W�~�� ^�`9��R��	�Z:e \t�I��z�v��J���W��=x�ޗBw$���$v���zm$�?迢� �]��v	��G����l��{}�������i���`�u�(�#�!b�x\��Wօ	���m�űdE���:G��,}�|�	\%� �8���"<V���K�I�@J�H�{�`�+2\��9Vh�f',���Ο�"�J�!ܫd�+V�0$%�1�YQҲu�g�F� ��c�����F��p�Y$���u����`����� ;e��m�E([ӹ��Xf`�p4fٹv��5����0�*v'n�B"fu�S�	�{���u����pSx�i���8�(�y:)�G�[@e��tZ���]���`�C����5:;UYL�y�у�=�6�Y�}<_}l�F�ҥhǿ����$x�Vu��L�1s��I��d���|��z,hӑ��b�B��zV1<���b@�:�$/�ct�e|K���B����4]iິ`�w<|�A�l=k�V��GD��*q~8É_�{K�u!���R� ����|$���Ё+]M��:�GO�����J����ʱ�BS,=����S&M'���ʑ<L��XlAP�ޣ:Yck�G��
�Q���(���O�%�7�*-vH^�1_}��q�8m{�	/�+袐d��;j�F�ч�@C���M�;^�/�pm�)�?�]��G��Ě�-c4���\� f�\�Z�)#�h]�	�����%鬯��4��(V��n�����po�+��m���5��'-��X�$�|�(:ҍ@��V5����7�U���p�? ��������4gv,�������!��tA�u:#���ԯc)Ԝ����C�{�}l���ޘ�&�,�����L���*��[k_r44�ԭ��H���޵�F�E�Y=�x�&��0>�^t��ZE��D�CC�[�u��������M�Kf���ƾ�5����vi�j�j�6}�;w�b�4�ZEŪ2�ӳ�*���8z�R<x�^Y�ԶZw�=X��(gy�JdB��B��Ycz ��k�T�|�	��z?F=D��@��������YT4�Q� 5Ӳ�Z��ɷ��_��/���N�J��}��]�襋."��Z���a��FG��g�
�,J-Iq ƣDg�����/�'Av�[�h�y	m��q=�ru��vX�X�^�?��'�\Ag�jך e
  2ç�[��g7K���}��ŦE�>[o���$ު �:#E3��k�K:<�]+�PL+�d�:�Ű����t����� ����ٵW�#������ƨ�!o�=M7/��ۏ2��|l�+�h'b|:�bhIY8Ί�5��E��͋kr���;�����@X>.KZi��ה�|�mC;t�$xs�N��A���B�'?�+q�\�U��&!{�B�B.�@n�i�*{Ϙ��1��2���tӸ/:����Nbv����%���^��_P�!W����2��n���y��A,(ln~�<��tIF�.Vkc^�#[��������)�X��Ȗi��*�������X�߇��
�C�D\:PEh������O[�^xn�u��M�-���J]t*x�P���Ñh?ܤQ2}ԣK�/8l�!?���R�!��]M�/��-��y�o�T��"Jc(u@w�DR�ț�`���������@x��	����D���;����P{g1����(}vC�h��w��Ꭰ�6-M�Dg�[wv�6���֏��-�;\^�g_�������U9���=��a���٪GTy�N^=L�<�F�iV�O׃���<=�q��p;������1i�hjEs�BaT0a�����Ԫ�AQ��(��Vŀ���mE��*p��`���y����V4����ǅ�z�(��a��S�<�r��as�YWs�����b���>�<	��>�
W�m���!CU	+�Λ
�};wu�J3:hyu=�� �Eݐ� �S`��[�$_�G�>�J܅���8uR�a�c{�dW�M�O�*����ZQ�<�'�d�29�9E���Ƭ�R_���z��KEo�^�cT3{X�u�.]@�j�u'=�����Ċ٢9'��م�j�$���� �G��+�|^yn���:r)�}{���tQ�Mp~�=ҪR�!�s�3�37Jw�U��;��ӱ��.��X�zs>'�c�:�ʪc�4��*�g#�Q��`�DG�+�w�8lO֙�����=��A�]����j�X:GP�ӼAaL��s��u6����51x�މu5�۲?<�~6��C��ou���yk(��̋[�}���cN��[<(�^�t�T&:�C�m�?�l��|����1���-<����m��U{k*�]�e�L���&�(�]�&�rJɦ��ǂb�G��7���
��/���U5�Yq��:E���G{ΐ���&�K���Js�e#�(i�"-���qI�<��zIĮI�ç������>=9�D@����.���`5��˪�P�q�D7��f��G�8O#b�g�?���@Y��[?ՍC`�`�Ba��� ��婞H�6/}�qo�rM�(H�ԓ3/H��y�-\���$��3ݺ���TH,�-2�,>C=$GnZ����5��G���SPx��W8O����lաh�ϸH��P��c[r�u�m���UN}J-j���5��=V����ޣ=���?���=��aE=��0�9,��tK�x��yG��A�u26p��b�6�>���Q]��2����y��^YA�פ�a����[L���um=�}��������Zʄ�c��O�=v�W����)}t߮v@��u��a�9�,��E���t[(財��pF��d쩕�w��V�R���4��{���Qg�� ftoW5[�K-�e	�ȣ.]lC���޳��:�e�e���D�
�mԢ�G��U�MW#䊲�gg&X�/��ۯ�lЏݪ�T�M ��)e�@X����f}J
E�����}�#½��:=^E[��W�b�ӏ(��X�Šw��쬿9`��9�
��7�{"ܛ.G �n��2�"!�V+�=BTk��?ˑҀA���jҶ�xx��k8��tj���k��Ed����|%yŴ�m(t:C�kɑ�DT=pՅ1�5�4�E�v0�>��p-^� Y�=G������Pv�����e\�Ӄ�	h�R�,X�',���D�ͻLw%F����'Z�R���j�1�ӫ�]~\Mҧ��_:lp����ٝ��5k9���
��M���t��G���V����v�ǀ^d��U=fǇ7q(��s%P����ڶ��̈n;ƪ��k�ө��m���FKU�������~��n�N

��ԧ
�.慨�,qv�\R;�p�a��n�.�H�� �ڝ����No^�

KS���-��+�^�$�'D7<���bc����Ϝ�N�i���$���}~h9���Ó�"�`��sE�{� �ش�5?� e��jJ�c�kvG�z���qU!�JH���CIxc}w��=�>-1<o7����s����ܬ˸� X�fC6��#�6������z�mRj�`G�#�sW�����|k����'ES�D���Uo���x(}H�o��Y^�I��:��Gkv���H�ׂ������:ɣ����g���U���a���5![�**QA�����_*�K��:=x�Z�<�Q,�	���t_u� ��P�#�,證>R�a[�����TJ��"�a��|��ͳ��8yl����zt���1)4��w��PsAi�#���E���OW������� ��V�!p�P���~����e�'��;vmal{��wl�*�N���@M	�놈w!�mݟ��2�'�_o\�h�/�~�� 6��      �   j  x��Z[o��~N~�@X�-@�E��h��ݠI���';�R�(V+�.I�1
��>��E��űhQ�T9�j���K���E��� ��3sn��Ι�Z�Ͳ.�C��RU�uC��e]Q괪h����j��VuCnU�"kZ�"7��!S�Q*�JJ�j�(|��£���b���G�}f��n�����2i��k��{��R�S"�����z�M��w�ePǱ�_�G��L��Vץ/]�O��G��Q���WWm���/p����ݖ���n�v��G�Z���j��T@Kp�p��&�9���N�L*�5P;���:.=�;j�m����]j���Wm1�ۧ߫����{.��B"���������I��\���w�5���l�����D��">��SX�5,��/�]�"�~���۶�Z��cP澮{K�/�����/W��|�ŉ��aH���Cj�H��?; �S�Zz"WX��h0�\o�OB9�Q/S�!W�zY֚ �f�0eլ�F�Ԡ���?�T�ٺK�CJh�$V����a��1(��o�7�����4�M���G��e�-	�[��|{S��<���O�	X��8�dI���	�D��Y�y$�BX�6ʼ"�{�3r�eKb�McN&#o8�=���#�7�Ɠ���hB�l��(�s�˄�Y��i�ı���B���ף��Y���A��9	�,�-��>*�(��d�z��6��DN��:�PJt�<�C��P������fd��gğ��a�H��	��GD~�w�Z�s�sݨ�6}L�TG���ѱe�z�>H�!�E���~||����}��ޘ3�{�1��I��I:��,
��P�U8�$^4�	�,�P?&��w��(	3>�1$t;�lU�(�P"������N�4<AW�T?"G�bPM_p��k�L 	��+�%)B�j���l������V횖��ܫ�ԶH��*�_�!��TޱN��=��AH,����x�}~��g���8��s���)�V(f#���]��D�K�BB����1A�����u��n����ϮPግ �HH  �@��~����#F���;��ƶzǂp4�^�)zI6�zE�ZԐ�0��J��h����¼�J�_�&��f��I���%\aB�&keX�V���(���t�U�ݱ�@=p	�'���,�6m#�@���H�'";�#�D~9˘�W�Z�3�n�xv��yW����1�/ 3�K��� ����➘� �q>� �0|�8����g�@)v�z�Ҁ]��p��ϕZ���e)Dހ�>yœ� %����������܏Կ]u&�#�"I���!�_�	=����I0�&��G�:�Ĭ�}�n�d�	ۋ�P�>���9��ͻ3t����mGP=b/��p��*����潡���c�,�]��K�B�^�ȱ{(�H�u���nq;�P��x�x�.�U8�,-�� �XL��V����H'灠q\	o'9��1����霍���Kd
Cc��Y^�`1� �c��*JD�"2�M^�Bx����x�e@���4�G�B'��Ebm��2��RKp��fU��m�ٔ��bȺY-5�f�k�!]
m��M��ngȵi�2��#[1`$���B@C&]�uF	�"v�c�(ZR�}�"�['0����-�H��HY0��U%�XD)b7�����g�&c���Er��Kӑw�CS!HwL��aV=���Q_� ���&e�B �������VQp�=F��;�oz2�0a�����YW��oV��#��Gэ�������j~@����샖�܋q�bi��r�n��e�(�6%6�M��&%�Yc�@����2# <�]�?��fC��	�2�}V�j�y!�@5�s�����+�Ћ���f�LѤ�m�wģ	�"�Sl36FB\d 6����&�@�nw$��wG�ݑ��<�??���Y��
����i.owd�#�Y���s'�5̻����sw��?����$��D�]"�.w�������_�/����aE�+j�R��uvU�]�+�ZK�Jf�zLJ[����f���VV�Qoʵ�f6JU�M����qu�]������Z)�}Iw�쾤�?�����E�W�������E�      �   f   x����0�s����8M=;TBn�ÁT�؞��H�XPX[���q�5,՜=d��/~�4"��yT���&��RII�M��_��v`���OZ/D�ft      �   �   x�e�;C1��0�ǘ�D��������2L,�hC(���哦�q�m��/n����*�ȣ�� �<�9jw��cI�z�\�y����uQ��`�����5�^�j��R�%;)�C�ķ��{�1�;@      �   +   x�3202�50�50Q0��22�24�31�477�60����� y�b     