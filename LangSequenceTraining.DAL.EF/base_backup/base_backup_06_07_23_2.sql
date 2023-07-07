PGDMP     ,                    {            LangSequenceTraining #   14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)    15.3 4    �           0    0    ENCODING    ENCODING     !   SET client_encoding = 'WIN1251';
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
    public          postgres    false    228   =       �          0    20664    TimeTest 
   TABLE DATA           2   COPY public."TimeTest" ("Id", "Time") FROM stdin;
    public          postgres    false    234   �       �          0    20603    UserSequenceProgress 
   TABLE DATA           �   COPY public."UserSequenceProgress" ("Id", "SequenceId", "UserId", "StartTime", "LastUpdateTime", "Stage", "LastSuccess") FROM stdin;
    public          postgres    false    229   a�       �          0    20607 	   UserState 
   TABLE DATA           >   COPY public."UserState" ("Id", "UserId", "State") FROM stdin;
    public          postgres    false    230   �      �          0    20612    Users 
   TABLE DATA           /   COPY public."Users" ("Id", "Name") FROM stdin;
    public          postgres    false    231          �          0    20617    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    232   �      �          0    20661    testtime 
   TABLE DATA           *   COPY public.testtime ("time") FROM stdin;
    public          postgres    false    233   &      �           2606    20622    SequenceGroup PK_SequenceGroup 
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
       public          postgres    false    230    3336    231            �   F   x����0�:�����cl2]��"�>wv�d!hQ�7bt�&<2wXi0�G�O0`������\*"?�e�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x�u�;n�0�Z<�	�>��]���E�)r �&��dW��Nal`�60�d�|�c�t����JVZW�.q��	���{G����Ӳr޽L?�2�N�z��-���Ɛ�V u���TS`�J��\�L��1RF�S $�@��!a����P�ee� W�Ƙ�fm �mTV,9DC��/^��QV	�=�
U��@�փ/���]�Vw_���,��x۔�8�����E%�C%s�9p��V�gG�Z5�>Y��?���n[tJ���M�r;�#�M�ZU�{��u�wr��:]��aZ��p��?��
6��y\�����^��3l�cV���B[�K!VTS��}v�i���2O���n��F����a��ӱM��zm������E�      �      x�Ľ[s#Yr&����|�*w���R�hT2�hl�fm2� H�� XY�?�?�������FZ���e��k�$� �Hq	�Lf�,r�s?'� Q-�������ss?~���R�Y(V*y���kv1wX���N�vK�\����W{_Z�n瓁u��4�~�-��|f훟�[��:��_�����M����{�ςGk^L�~����h�cj���]��w�u8�.��}����Ԛ���pg!��=����>��2�k/��w3��[�&�0����_Z3�|+?lҳ�o=k�Z,���z����w�pi]�	N�/�����ڟ�C�Ϭ�7���<5�}~��l轝��?����=k���'�㐾L�y8���h��У������ZZ���Ƶ���ju�A��zu48ط���ߚ���vzg���7�X�p�Yz�hF��o�uӃ}z����Y��z�t�8�U�;8r�����~r+��'��?дë%���|���\��ܣm�''�}�OZ�W���?�������{�6z�4������Oc�0�����2�:P��Y�f9��r�y��-��oiz���_[U��k}E��j���v.��;:#)+K�:i����r�����b�:����{�2kg��̇�uA�E]п�U%2���dh��sF/��C�Ң��/����?�o�,}x\���!}���;	�w"���ru}��������Ré��J�`;�R��f�n�)�
N��W}Q�6�[/ڥJ�jK����%���\�Qh�j{�S����=��Z�����f��ʐC�� ɹfw<L��'�>^m�^μ[�}?��/����?\L��b9|u��'	�7ܧ&��)aM*�Õ���rG2�c:`��c�Īo՝N�m�݆%S�zN�C��Ws��{�ѱ��3���������g?��/N���uO�֑CG������@J�z��=nխz��o�������z�%�����&��^=��q8��-fDk5������~$�=j�u��Ѵ����h՝A��ɐ$�Nz���Cp�t�Wn/���R�.[-��h*����ϛ�0t`g�>����ҟ���2���s�ߪWA�9�耵�x$S�o��d�<�o���7�$��%!	ǻ'NYʑ �ѐގV�h���"���D�Xg���^�X�T�Ū�w��v��4�t]�V<t�_ż��_ԛ�f��T�C'���57O_˹v�V��Pds��^Ct2o9��HB��o�1�J�Z��Y.��D?#���i��4Ƹ�V�$8�����r�z e�n�`�?���ޅ��>x��/F, �g��ۼ�~����S��Sԧ��&�� �J����,8_�����^~f��?�|:��3ߘإǓ�?���yvw�Cr�2f����ߪ��nZ�����}0�}I��7�>Ë�/�B�����gkC�s������H���ӆ�R�q�Z{��<���{�I���!0�V�~���~NGٷnɼ��Zg�$"�� Z�h��G����|����ܱ�~ʼ���'>��!͈�(����J�ň�w2�+�n&گ��lL�o���_�"l;����#/�j����wN�K`���՜~�S�Et46�:ᤖ<��3N�������1���Ӕ!j�`��}}����_4r��R�P�k�b�.J۩������B�-�*��7G���E�^#���`���.9ጺ�o�I8��t���,WtE�<g^0Y�~���o�$�o&�u���p��1�9���V�ۢ��Ѻ^���0%�kd<��c`@��i˹.:S�*_[E!�O�9���3�EcR/�`�d}����sڃ̖��d��$%t}�XC��E8i&�R,�^3�d93���s��X���d�a!�� u(oȺ'�m�N�C�h�}Cw`��)]���^��H�i�V�,a�p�[��{bx��j}��?�'E?O�e8��OH_�9tO,RM֫�sB�'��z���,\-�Wc>�d�����Qp�]͞a��/~Dr�F7!�%~.�wdG/ �&�'g�H�M)&X�$*$8��}��y����b7����Vr��)s���9��t�V"�iŏ0s:bC(�يF��/�&��N�9��9�y�\m6�f�D~:y�v%W(��F����z���+���J����2=�����j6���B�^�kY��k�,�R�T/��>�%ds1iGt'�le+�<�;|=%��,��X�#�
���[����3m̋��'l��9�T�����w���1w�;گ���8x�d��K
�i����U�+}Xs�ʮ�^'��m��T `d-p�p���׈?w7�!KC��U�:yC�h2���ے����.��!�0�ɻ]�����o:d���N���Ɀ��c�.���=����c��ž� �M͙ܨ!@��ؖS��I��j[�#��Q�}�}*��o��%FG�g��I�T ���N�\�7�cdz$FM�`����=ş<�Jt	==��ܠ�i�x����M]rǻ��GB'�,�x�I]E�;rVd%������!>)��J�	��ވ���ǎ�F�E�Q>,�M��T*��l�fלF�>�
�Z/Wʇ{o���Y5��D�F��ݼt���|�2��0��$8t4?L���䣊����'�����^�I~
�4�Ɠ�=�S:A䬒��h��pڟŏTc����"���7o��(�J0���b�ӏ*`p7	�_�>�/�t�H������`���A ��rjm�/���so��"#���6��*f��'���/��#�w�K����^{ősr�"�Մ��Jw;l� x����+�U��!]��r�V���	�澊�����nY����rF���/�zK�<���`s�pe��@F��G� ^��L#Z3�Imt8�}��{K�<|��ØJl쒖�#�����7��o.�Kw Yc�v�v:�ΐz����f�%����X��:���@@G
Z��8��N��H��"�PXZ��%ɔ4��b|�Dq�Z���"���aL�=
�S\���T'�R,�5Q-��b�\�+dU؅�[-U���V{=��>��V��UK���4]�fwH|���V��:��`��ষX���78����t=:8��/�g\.!��屗���9<}���0���� �w�.]͉����Z'��=A�Ђ �F�!�r�+�w�����_g G�#����Oǚ��<��-������Y�oM����H(��8��������(��������Qϭ�(�g<Th
�귎[m�����q��?R����ǳ�b����±!}����oh		ބo��<��� a���6EZ��Z�v������>J�q�E`���[9��O�5���-�ؿ'{�6nc�%�(��Շ1/���xTࠅX�c�:�KT�l��s�Y��׭F����Q����I���@#���{a�jҧ}zǦk*k�O��مu���'�wy?U�1�O����'t˚��f؋����2���J�cF�E�������M�^���[��Zف;S#s&���N���e���¡�7�	�Y:��i9I|����w��җ�MD�t�TɃ��b��L@�4��F���Ԍ$_~��Ώ�̌�ܕꃣ�?���9Uɹљ�5�?X$������k����cG�,W���9�/-C��>�'t�f설�%���ߗ���o7�ͤ���|i�2�##�f�0~֭m}��$��/��
��߾����w�/d[ʑ��		84$����C����[ޱ��?�?1}���h��a�H�DH@�b��$T/�I$6�&ds�ee�.&��x;d�X�T�n�� �ӻ��S�I,p�0B�s��C�E�Bγ{X��R)o.����ڍb.[���|��������4���{97GK+��2���W�i�o鿌Hdq%�Cz�T;�9��Kl�V*� ������Ę�u|�G(M�p(U<���
�8�jk��̐l_#=MFհ �����	\���(w���>���j��m�p�s�n�'AX�A@v�    �$�,����<lˤ$��\:!��Z�̊���9����$��Vg�a�����1�[�g�ͬ�i����r:�V|�{�\���5�nL�̘A �p�vv� `�\Y���B����Ԝ��N��?{���$�j����!N�$��t^Py�ӻ��oX%���j9��~=KJ���'Av?�|!0`�7J�`��������b�@��Դ�j�n�z�j;�F��W��|��UK����d=G)�����8ƪ�x_]�b� ��&��`�]Z��U��ަ����.nV��Ȼ%c�#u��Z5,��Ψ�}�Js��R��hV��t{��>�Z:�N��S������yЮ�����O�dJ��ڣ�Η���Ƀ�c?��6p2$�+�ķ$>�t
g�L��c�m�Յ���q(�ǈ$Wg���W�%��3?܇�1=�����|��@gj�$a'�g�����/������pEЉ���&$�̃$7G�7�2h<]2�y=U����?�K6c�/��k���͝Vy����2V����+%t4�߮�̽��GK�2��H哳�C���1)~��?:�i�e����48J"�J�[?=v�#���s�<w=�����??uz�U�*ÿ�|)��0��CJTN��Vt&���["P�`��v���_�����G��7���{��^7-{�����Ŵ�8�n4�~Gu��X��rNα�
�C�`WJ���h��:,�
�~��� xg�P����KĮ��!���dO]g=8A��)+ɏ�ƶ�'?ز}����q�>�7|ɡ�3��_�;�i�V�|���jq���D�'\]g���u=�խO_�4�m���yL�f9�L�v3lu\Hl����z���!>%�C��<�2%��r����(<�bLi8��꽇s��xs��<U>g�yM��O�߆�A;~&��طO���~|�Y�ݯ$ P�W4�ԉ5u����q��-mY���bW�w39���_|QX��38��%#�L���#�]�p��F+̌l�ǅRM
2�O��)?�r��܍m8�un]9V}26d3�1��u���N��s�N���ǀ�5߮�9��1�H�g��:�����-�d�O׏��1\�����a�xӆ���p�-ښ���7
 �|��R\���Fh�]m��%C�Um��	��#�j6W���������d#]xP��r��)0�X�5kn�P-�!��-#m��4-�l�mc�ܨ��U�v%1��<F`�}J�ר���Y�$5���Jc�,U
�� �k�(=��򟶢D�%H�=��H����-�Tɔ�m�����9@�~�R�iQ��}75���E��ǵ�(�����O����/P�i�E�yݷZ��1:���WG�%Վ�h5����E˴ ����\j
��Y>�	Q��
���H�[���l"]�(4x`u�ONWڜHYt�t8�W��GA��`N��]Fό�ֿ�����ߣu��M/�"\'?�$\�ȣ ��#���c��a�+n����Ϡ�j����fs2??m��9���y��>ߪ����rF��k�x�1S�,�3��"]8����/>?H��J#d��Sof\̯Z�����f/!�|�P�<gB�t��3jl썮� �E��G1�8�Fʃvg�W%#�=,4��\0��Z6K�b!W*��U����a߀�R��(����g�������	c���Keg�����ڃ��_� � ����q� �Dd82�"� &^;	�!�/�Mz�OIDmQ���٘L�'sb�o L��툗`,U�4UHr�'��e8�F� ��(�$L�B:��nk0*$H<��+��f��K�TAA�<��ZK�M�i����gۧ�,Ud; AL�J�nX�C�=9i�,�m����뾆���AD/[��Z�~<�н��<�>���gj(��M��e0�<0�V�[`�����.G��w�,�.[w��H���iI�LX��z��d�j����`�CL�G��)����H�1�j jgd�=`(������v��'�M���Ɇ�S5����ԕ���up֬ @��ŉC���o�P0����|���g���@��(��䄪^�=�Ri�X?+λ)�܋B%{�Ⱥ9ۭ7���")�\�dj��[��K�\m��U4�����'?}�H"Ywc���{O�^�*2��T+�R^��r\9jϱ5���1 ����Cm_$�̧��u�:�"����n����Z�������Q`��;0����%'�Uu�A�~}��׮>?�N?���b�i����q+�,����؁,Hm<Bg�'9�� S<EQ����p�h��D�4py��B~�͸����B�*���{���z�{�W�A�00�����IL��p�[u�dr��s��%e�հ���5�+�r���Cr�פQ�i2��O�4k��� k���p�l�~��xæF�������䏜�����K�F�X9���Sj��\�lW�E�Z�5k�N!ۨU�J/�l�^�9v�R����aͮry�����n��gs{t# e�5`�G��	�)'+"�#B��X �+	�#�:����7<�EH�Gϒ
������A�O�5c-PL<`P�xS�R���f�]ؗY��-L���C�5�0��ȃ�RU��q!��Ok���R�z�j�}�����D�
�������m�;�M�OB����Z?�a�:��V�͞��>bT����GΕ�3�Ɋ�:km�(.�A�t$�������M��E��)��N�(c}�F4���� n#c}��Ƨ}����$�n>�����	�������k���.����4��X�g������q�)6�k�A:Z~��<�����rl,UQc@��g1A���QOʋ۵�)��u+�b�Y�+�j�s�{٬]��
�ŬS�W�{Q�W�;�����珗��-*Z���)�91@l��iP�#��c�m���e�:��ia��x�:��(z׵�!��y���p��a��9��e *?F#������W��Ѕ}KF��E����� ���u���%��`���n>�X�-ׁ/@^\(�k�Wo�ae�:m;�6|��Vu.���T��2����j��@��6�8���v|�.�T�?������@�U��:�(���)��� S �nN��� ��`�8�;`��7�ZI#2��?�<��qC�+#w��˥q\-�?e�I��#00%��/�����0Q� �6~����ȟJ̐��Z$��2�&v��}���F�g=�F�� �_���и?S�uR�Z3_��n�R���e��f!W(���c����p��\�������[�k�(�����PG�>[ \h�h���o."�XQK�A0����6��so:KU{@{�r0���l|�����*�����`� 5���3o�#�����(��u3'�����@č��]���B����a�����>���ӤH����И
J��#ɡ�kHڌLD'��8ఌ���u��ʆ����K��s���,�&r����7������`�I�[k��v���
�鿦�ߧ��jsWD��x8�Ŏ��)�!]��@2z�|�Ou�F��w��هJY�q��_��`�Y۲a���{s���z��r��wI)v��i�~�ﻘ���m�o��x��_)F ���+���%
}���r��'_��u�A��8�'H�6�H��f��N��}����$,E�2�^�+s4=�����p��$���SNt���j?eτ��Ц!g|�Ӄ����żk�9q�jɮ���Z�e�圛w����j��+��Ss�׫4욓-؍f��h6�*)�=�[�(际�g�n\�L��ŭ��2��NVo�a74�`j䳦oҥ�J�ݳӷ=6x6�@3u�p夠�C�t��aUx
�6�-� �����0��V�X�d�?��`Dc� �������v��{����dV��3��@��gY��k�-�.�}>	.܌���dZB`C�5���{��������i��Q���.#�E~��{�ѧÍ���<��    ?&㜼������Q?1�䐲]�#\���ͨ�� ���;?*?��h�6��D 8��u8|遈I/*Z�D&YL���^�|�f �)�[w��F�?K�jOJ���1�FO�%b"V�i�n��ب��"��Κ�c�:���k٢۰�F�lk�C�V)��j=��J��n�,2��������۩G	��ߤ+*��!C�@�� +k�W�.��������5��j&�<�-Vz��;3�d��[�Q�ij���Q:6/��P��_�;h�8�n4��|.g�Xc��I����5�W�HE�!8����&��R�l5�W=�^�)m�5"�o�e04�j���Ib��{ܥ�?y�*�6,�"OYC'��SIOn4�Dh��N��F�58S�g���Ԝ����M_�����LB ��I{�L��^��Dh\������yH�ꥇ<�D܂�����!T�N"S;ʨ�fbʨ��M�Ӻ=�$�n�,�ͅc$���b�P����"��|cͩ�~����!����c����-�'�Z���2�`�jK�m�B�nDWP��(Y�}�X__۲g(�iw����|�\/�{����(%$^�q�O��ÖS��h4�a���O9��K_��|;�`�4H:�):IDXB�U�=�GC��W������n11�;Z���|�Ac�n�ApH��S+��Z�R*sn���Uf�2r���9d�����7>����p�El��Bc�M���6�Z&�.���&¿�g�\UH�y��T�sy/b�&����aA��fC���Fn�İQ:�6=�$c�eO��c��<@3v�f�7n����O�ʰ>nFV,�����0c��?����W�WN��/g��n���܈���z�<,�OZ�F�M_�ȅ�5aT�������\�K�^�U��AG�'c�=z���ܾہ�F~=O� yU5��C�(�P�#�;Q�$����t��+��J���ԏ�
�1 ���j�Z!#�;
�Qsu�:$�'�����:�$�8��v���g0M�4�� �d-�`N���� x�*ւ�
қ���:a�Y@a��L0�K޻����^�\N�2d�}���H��r`�@^Y����^O��g7�9A�:QF�ǫ��r��Z�l{��t�ߏHy�u�l-�E}2ǿvn�uL7ZtƸP� <��
�g� ��̛Ϙ�k� ����a0
�G�"�Lt�ס7zO�4W	����-Z>�M���dL^�3���'#V��&Ƽ�6Fr����(���o�ҋJ�T�6*�])��vy��S���F�XmfN��Sr�*
�##}���j�d��:�OU2;�?.u��H9o�_2LN;���(���]\)Ҧe@^�������b���sV�Q=G`��2R���L��Z_2r����=9�d�L�q	fV����.B�=P*�Q�����jpo���������&���:`6�n��&;D���َ͠}B�����`ܿg/�s|!���Ļ����3G��/BIF��B]o".b�������1�IP�"���C٤�/ֆ���A)%�?G|�94%���k��F!Ɂ�]g�SA�����P� 	M.���e� C�;3-~���Ӏ�-Q2q�n��)�aL�+	e�ft ��ƽV} L6g�/��J��)@&�����ٲ��Q�x�tL�t=��(S��#a#��+�DK�X��ޔ�PQ�@�\���H�����;1�F@�
[�P=��� "Q��<�	�<��������QFX�>H/I�\툾��H�f�dg���]W�쫍R֮5�Ų���ǵ=�@ ko�>~�f�1��e�T�y7q�
3
L��)� <��ou"����0rr�(�3�*��D.�fÝ�x�.��Uo�M��-�j�C�����hd߷{0g?9Y]Nr���,�x� 1�[��%C�%S4��i�XsQ��U�[9��\�A���g�C9Qe�˹7�,Aض����tD\S���O4�5"�B$J�	�:m�뽳h�sٓr���
K�X0��K������'�"��"���7�s�SI.r�1�:ϙb�Ѩ���_��䜞0�@A�-��)������Iy�y��[	p�y&AD �� sZ?X�nrD"k�h�,i�hDl�R˪�A��U�l��u-��#�8"3g�6��N�j�"7��O�2��^`�:�ҋl�Vs�u ����JíعF�Tr�n�\h��HB�m �0�1>|:��O�`.���'b���G�J}�:(D�d�_
�����t�P5N��K��;!��(	����dqHDF�=.ڙ �-2��4\�y�2v�OC�s �WC}/	Z��vMP�|��b:��>�C��koM,8���nNZ*�(_:�x��!�r�g$`�A��Tt��-��������K�&b�B]��*>C�˴�"�,6Uf�k΋1��U�@��Tv��J����mJ�Ƣ��T��|f]������=K��#z�Ԓ?@�0�3��0A���6�c�,���v�2Mm���l&�r��w"@݁��#�����<��5�#���Z1Aƨ�����\C���R���v)�,����J���/�k�j�\���=U�(���v0?|�u����pa
���"�.0�'RqO�ͯ�6��p�&���������~i��@Q��ߴt����q�d�.u=#���1Ơ�\��I
iVU�Q>�?^��HA�T|ɠ^�֖�)����,�j�xE�%J�Q@�iB��i�U$%���d�y�?~����:]�����B�5E�G�NY-N�֧�,�� ;� qQ)��DR�R��纇����.@F@J��qiX�5v�=d��g,]�� $M��\�E���?�3�����Ux�����um�����Ľ�D���Λ�EA�z��~'�vKk�؏�.�lx�}e,cR����v�����9�cR���3W~�-d��f�nWK%RP�}�R+ڹ\���R#_pj{����g+�B�}�C��/�ĩi�������E�AW-E]��}tF�Ҁr���s�g�d��żb�ݢO������o=r�����Չ���#(u��$7��f�[��*D�r�r!�&�B<�����kwЏLU/�6����らϥغ�+�������[�]��#�TE���||ŕg�����!�0��߬iM���8v�g/��@]��~��'i�q`���;B�L�B.Mg�u6����w��5.��Wg��3���_� R3��	o�[��X����̎fO���sY�n7�٢],�69I5;���բ�m��8A�9����)J|��"��]���:��r#]3�a�c�S�IH;�l��3��T{%b=�Y�X2�9=�K����{Fĥ�)�r��2 îzd���t��{�ݟ1���\Da���/z(��|s'JXw���Т=@TZu�VX����� #��$���]����Zi��Qχ�'�W��=�xl_��k$�i�E�f����c��kQ������N�A�7uU��(ޜzs�]8K�%~<�������+�(�&��M��W3�&�8�f�_wu	7ˣb6��PM��Rc?��K���Br�p�v�^(�ȑQ+�Y;[���hd�S:��y�ڬ�ܚ�h��#mN�ӏrp럧H|���`זͅ�I|���Z�(-��˹��k�u!�et�(?Z�p���pmn��w�|-�]IB'\T���_d�K.a`�h��]be	j'�
dʟ�$eQ��M�=�b�[�^��±k�+��"�"q�Hˑz\��� Id?\26N�TaZ��p��ň������Py�,��0��ϝ���`�*��6kD��n=�+p�Fvc���+���&�H�V*�Y��{�˸��$x���f��.7j�i�^w�o^j��h�'��Sm7f��K�{/��d����������R8���\�3v^f�x�Zn��n��%R�p�PS
����VT�� ��M[D<YB�u�����ɦ)�ȹ�B��k��b=o� �y�Qp�n._h�Ž��$��j��2>|��G;Hq.G\��t^����[T�    �-����f�yODO���H
qب�&J�d�P=��	��q�W���ϕV�VŪӾw$��v�͚�W]��jt��s��O�`"�BZ?��E�û+���%��($�-�.���w[՛���|���s��ZG���(Y�t>=��*�m�e�M��L�k�P��ɺn�u�2yl�C%s�if&�x	�|㉉�������n�{ҥ�.��hǁx�����"Q7r�`�vs�N��a"u�yzw�'�2`U�%ҏ�X�D��t�1�g�xb��HT2"t�J�{gv�R�V�f+���PAZ�7�Z�)�?K�b�X)6�{�L��>��G���;�W��8�xf��*6�=GG4M0�o���rrB��[o�X���#���$���x�p�����϶��Ҝ��U������=� ɦ8,4U�����|i��U��\6�  ���]��&;>֧q)p݂���> &Q�g�5;~�^U� �$�FOϥy;�7�Y_�oЮ�+�%�R�:a���A\�H끨�B�!K���!$���!�2����CYm4$TZ��Ӌ0l?9�>���wά�;p{ q6R�ƪu�!��x�)������ �P��2;�b_~�y��>�.�w�{� �1I�MD e� �����d�M0�S���?�"��=}��Z�0V����1��Y�v�DE�9�⵸���N6��*ʿ��s�g�jv�6�b���f.g�E�Z���f��*U΁�L��`��q�Ô_���+^������@t�;�5�R�����|�@��ܿ��_��c�` �4VJ���82��5� �jO�(���K4��'�]���WR���P���u�؃��_���]o�A���ij�ͨ)���m��A��R�7������i�k�	96����J	�|�j�'��̃3~�`�0dHGi��%��'h���C^�E��zF;}<o\�\11_�^��W�	Y�7	���uN��6��HM��_�;u��U���@zd0�ۿU^�J1os*��	U���@%�y��s�B1_^p@0�H����~5�*��>�f�8�2
��X��Fj��J�k�ױ�疯ԛ�Jѵ�M�7��\��'�ȓ�q�Ε�`�K��7n�X�O�ך'��|��?����K&���"N����40� �tn"�]�uY�7�Zs�E��Oq�y|M(���r��ި~�0ݫ�٫��;!������n�����U��r(����u�VE��JKd读��K�D5�a+��K:��v2�&����D
;��"�����]7�1zg\��l �;g`/b��d��n��h<�4p��,6���K����#��Am̞݊N��X��b=z:�3�A���E��#�����9���eH�պ跔|��Kf�(�����۟��CHlN@�O��J�.'��+��
O
:�zdW?���Z�Α^	xyei4�F�w�o���r�f�j7��KX�dWj�c���j-�+��<0�nx`񇻱B?��R���d`��n2�e��!��<�a��c�$�]L�d�Rm�J�
t��$��ߩ+��*۝4S}�8�͐��Z����f��ֶ}�g�ָ񆗏�"�5{�ʗ?a�;4�=cX�1�(�ȑfe�n�zN��@5'��R�W ��]c	�1��B��V���2� B#G%wPG7Pdȍn�
�d��5���	֎튛�=}�"T�
������ v^I�6BD�ύdώO��~fm)��8`��)^�����/��5��:,~s1��%p�.���"|��ƁѦ8��+.Pc��S����8�����(��b�дs�C���C�֨��G+��So4��=�"�C�c�ҍ�<�?(�J���࣢��Ǹ�:W
;fVGD/F�2���S�L�2Q\p�<�.5q�Hw�z��ds���CD����V�D��{�^R�J� y�H�n�A�G�%�X��'��{����*%���
���]���:��dvچ�PS��^�w��I�*�+�((�V���-�������A#�S����uK���y�;]>��Ő0ѭ�E"��1So¡�	�3���l9&��ok�G]��?q����_���b�AZ�6�h��T�Q��޼Ϙ ߑ�tx�St�ҧ�|^>q�L��M*(��bc�l�3��#���u*5�ܰ�b�<�f-kW�jӮ6�nŭ���Fn��;U����3�ake^��&.�c`ˍ7G,x>�[�@�T���W&\9���GK�f���(���3qm���D W�<j�<�
�PB,��F�!̓�1"�;�Q�|���d�@�'��)�6���ƃQ��X��@6���w��[_t^�m&���V�-��������sd;g�^�GP��4��
���F$� ��O��=����0�b:8"��H8����B���tΎU<&��^�}���g3�0�G�b#�bD�+͠r�-�����GgBY?j��Ŭ�+�������ruA#�R@� ���ab�`�W9[�3��G�D�w�>	����j��{,��ä�a�:#����7wz�D��喝]F�V��z'�P��Ʉ�P��N���%/C�`%�\�w�c���:�]r�<#�S�'�8��*�_
o7LS�E��땺��d�5]�� �-�k���[������(��������O�0J����B�ϑ�L�$:��;�7���{�-V�̈́��.ڜ������N�ŕ�W�f�Ƹ:@()�c1v4�1-7�;Utī��3:��Of�����Ԛ��L8]c \�r�EK�Yh�n.�K]��W�-���`2�z�+A~���K��ז��SG[��r�UA/qW`�;H��Jl�;�,�+:���9e�����HOs��i:����}D6��b�3�� Q�'���/�,T<�Ə��IKZ?F-��~&v.��-��Yj��| 5ǥ4��5f���l�C,�(2g"^LO��P]��'��p��ņd]�G�����#��
�&��YJ��,��!P�k�z�Jc8�����4T���A�_T�d+�v��@Ws��]��+v�ڬTr�\�-���v�a�(q�����۬�Y�G�d��$~���P�b5E�qR�jOVQ@��̬so�\ν%/�n����Z_{� ����c�T��Gg����%(jF!��-##���,δ��U�f�٬�\ ͵dL�����ri�c4�v; V(��S��������RV��ܶ���JW8~Z�`ɩ�����
��=�k}q��Z�NtB�S�QEݯ[�� ���1�@;}�B�6h@�Ë����&g�Rj/eU��S�}G�i�[�A���KP���jU�����0Hin㴮��~��(E�=!%R��z��O��s�ܟ�=��N&>"�`����i �&���r�q��F�퍽��TKE�zC�ϽTOp�!gM��$`���N=M��.��E1j�����H�?2��?�����=���9F[&�u�L�J�HS��uH���T��6�N�ڬ՝i�b=�h�Țra&s�Z:l��Z!����F��'F&�VF��'߿b��2$��o_���_���I�1��#΅�
5����Z���d�w�E�u�Ϸ�H�w̡n�8��M���J0�ҧ=L����U\��k���FO�Qig�w>d2UҸ_����c�Q:���H�C
?`Cn蓵&�#���=����P`4��O�=wT�|dD|Id���������T�@7�#�������q�����\D_z��(��������4���`�A(�����J��ilr��]]��ߛ�Ab���������X?Qt"��#�Zf�p�܋]�)�V�s�xE~��j���#��3�h��:*�X�Pn����0̠�@J�&�Y�|��"�l��4WGwI��o]���1Ѳ��[��0//�n������b�ڰ��}�i��J��CY!�ed�q���L���>ڱ�EW[X+��f��0�T����4�&���9Q������Y��3>9,�L'f�PੁZ�|    ��~BK�(^Tk|iuO\�ș�B���7w*VF�T%�o7��d%��L:$0����b�7אGzݜj�;�$@�D��7����(#��>w��e̊'`r:Ǔn���j��.�/�QJ�����)�jՁX6��[�/Q̓:�A��J�+�R71^��E'�����A�L��e0�G�@}��i��������i�[�F=���I؆w�����oh�[���1�8s�u���|��)aY÷�W���p��L��|L{y�m��t���披�HSm�WP�ƨ(2N��d����T񙉓�4���ia>�~�~����  ��<��wTb7
���U��"��4�N7v	c-�|1��������_n4/����^-�~�d����ht�2)^���1��n�q兛���ٜMʷdӯ
v��b�+�|���7�U�"F�na|�4�
S!���>P��S	�dL���@��U��ë��M+�Y+X�(��!�?rRP`0�{\�}�j��Wn���(|���~�Μ&���|p?;�:b��[���4X6�􃵾��|�޿	��v��^-�U�W�`�OB��~��5��ʋgw\-W�3g��O��M���F�T[��yQ�g��<XQ�ǂ����JD���/p����V����拊@���K�����ou/Z����TE�����8�?���F����P7�ZJc���~��}����{ߎ����Gg�櫪�S��� 1a���ps�֫�f������7K��
�� 1U��|���H���Y�D�p#m�}_�\~߇(:���˟�C	�:�$h���
U�@r���a�85d����51���
CÈ�a������˾(j�\����N�ts�Z�k�r�vj�B���MX)����s�gqj7�l?F>�َNgh�4&7���S�,��ɋ��\(���^�:��vP���t2�pթ�c4���e���)�Z�~E~�� e��%�.'�H��]cf��?��"cE��}@��k��ϐV^��踘A}@ϣc�1cF�'ח �0�>��7)�)Z6V^rfT�t����S�»f��ja�����%J�hXg�TI�Qt������w�����_���,�V_�̕��o�"�>(�}͇���)���Mk"��P�A�:�*�v~�#QE�0��а�w�u�j;�@�=�x���Q\�8������w�Q��i0c�LB�y�2 i��j}���R���]	)��R9_(�l7����r�hW�n��r$�Uǭ7��WͱȲ���蛿�O��)g1N'�OדD��U^D	/�? I��NՐ��]��p���"���B����U�ʍN�k�'��l�4[�]�����ߓ��n�p����뛦�4�,J����yUo.u�zo8��.��%��B �X�,З�݆�V��5���,�����[,�Đ���1�g�D�Z��m�˒}t�.訣[r�S5�"P
����{IT�\W����Ux�PŃ����O�{�)o�^�Dta9r��d4�9PFC��ۇ���g����pS1�ǔ!��\�6n�/9)1&���gL4����K�\y��<.g�����9��B�̖�p�v���8����#�.t�[���4�Q��C
*C�$��D�)�̬�(n)eTŐ��.$�`oR�B�)��5$����1&�Q����lɱ�nε� �tټ] �/[�֛�CE���~�dڔ���eT{�D��e��V Ѩ��x:�i�k��oz�,J�c���s�7�P n�M���:A�E}ا�e3��^@��fck(��>����iV�?�q��cc-�A�QS%*n�g�3����/�'��R�BF����[RQ�	pm���籴j�(2���ޣ���������E��_�L��^e,��M��V�h�i�pgAd�&'�/�2:k�Q�CY�d���I�eʄ�L��(>X۟(H��җ�1QV� {�VV�����q:d�V��<�o]TH����ʩ*ۉ�M���@��h�D��<g�I#x�Fi�vu��=�E�DU���7V�M}*C�B B�E�˕ː@P�v`׶7]p�x7#��x e~�yl��R��ݨ8U��v�p��n��=Dӆ��r��o��-�,��*�n���$��r��. j� �W��c�]���O9S�1tVGO�>R5� �& ��!�C&2�U.q�p���$�d͓&d�:�6`m�t�:W$�NK�<H�nTal��L`����iq�	�7]����a�U�v�qi��A�e�(Z��Ъ��ď��Et� �3���������1��/]M�Rh�,c(���i�N�U�-(W���z50��2�B�Z\����Bs�u_Z�Ȏ���ʽ��q���|�#��&\���Rn�gn}�muH�g�|:	V�#����:;g�N)_�U
v�vX���Z�v�+[�:n�Q�V����qd0�3I�ƯvDԧ�?ŭ������@ݫT�ܿ`c#ܐKg��F>�5�1�$9��?l�/�W �(�׮BJCH�گ����	��HD��^L��~��8E�.�z��t]���DU�b����D����V�֜�Yh�/NrHLzj]N��@���FnNד�� M��-D=�zg�A1�_ɺs�q���*�ܨ��+��0�=C��p�3�B��6]����6��yү�%]������җ�w�kU�y1X/b!���GA[a�/�2��q�&X<>��_���Z4"�oR����wS�/*��a�����z�n�\�H_ˡ�i!�wʹ�S����r�fL�������� 8eEő)��(��h�8kfRԯн����/�H<h˘������5�B$�?p�F�d��Tt����ס?���V2+����[-���o ��	������k���|%>ɗ�]��2/�;�-�=��v�HZKsDo�z��^�*�&�LB�6�.�sC�p��0��1�gJ���[��D�u�!*v��
�y�Y���4.\��c��]a�袦s$��Ё+Z���h�r������M�;���vߕ��<���pC�u[ٟ�-*ġUx�_/��A�1��k
�m�s�N1-�0���O�)�et�A��&�jz�$�D
�[P!���m0J�n��Y�̈́����!�(V�Jhɼ���w���'�(T$�<����)�(TJ��\>g���<)�R�v�u��J�Z/J9�#BN��>P�N�=i�Wߗ1!n�	ŷM�s�+U�gt��R�M���H�՞�^8�%J¶�q�'�a�O5Z�D����x�x�~��\_5���n��Y��O�]e�!�H�H��^��2���4���*;��qK3r�d�io6 �ZI��<8m�����_{�[f[S:�ߊ������������=���P�o]����Y<>���uk�G��w҇ �����i���r�������(1��[�T+%�B�;c�1�� �<�w����j�n���w���9V�[s�]�r\������랬\uU��T�7E���OV�|M�5�[\s�:�{�y��w��)�����1&n0�1f`Gui/fs���bJ�ӝ�ӝf�i��e��������e��S�X��J1[�BC�'����W�E���4*�D�=sQ$N�,3x"8*��L>�6��u.�DVf�zk*��������9Y>_R�	ػA�����g�fKf��W)�[H�xz���v�yh���u��/b�<L��?��f|H�X�S��	�SW�7�<�W�=��4�pdU$���D��y� ��ʅyZH_�D�Z�0�`���E��b&�-�~����L����c�\�OE�^�nT�T�101a�2�c��H�z%`��v-kҸ��!wr,��Tk�tP��C2�s� ?(,4�w���3�z�6�q,H��Ur!�]��J�j�\?�f��z��k$u���n����x�x�Cg�Q\ȈP��9U���F�c����9e��a���D��Uq������JC��5��<c��0F��[Bf�s�b��	�� (�XR_oF    q�'�%�ehI�1�gL�ĥ)uT ��ћ�/��4N�$L��f&I>A��K�{yVTD�1���ut��W-@�]�)!�-���ކ3��w��~ʍaS�6gܯ�sl�}ɩ�`��2���OQ�\���+�+ĜOȷd�	���ģ�p\j�N-_䳈�(�(�/��'V9�-�$�^�C�)���B��������ES���}�D�~B✓?��USHů<���B��I�F6!�\����y�o� �z�:���b�#|��>��P�}�$?���WL������@7lP�����`J=ܬqigL��_�F���U�>�������b�����v�P'���o8�b�.��N1�h���^���
��BR3�^ڄp��_�
#�燦�1� ���6֓� O��_{��WᏦ�R�%��BhJ��[H���K��x���H���`A�$7������T�	��ʧ4�˕n�M�����7��<=V���*2}f0��l��[FT���1�otτo��S ӊ)v��Ǣ�|����:U'�5��N�A�y�<_Z`Ҕ,{�|wH�����R��(	6V;^k��,F��D�ۣ�I��m0������G=��?�IL��~]gO��)0j�+ɿ�.Ñ�	�.��x8������K^	+�α��`s5�eH�=j�Z�JP�R�.�W���a�9G����:�$���GF�B��;t��5�Wօ7A�����ah�!ݥ]c�\��)�f�]z�8���pG�㋊��Vb��
�/���ݍ��p���Z|�8��]���<�޹�]-�+�[+��R��(�j{��;S8�Ѫ-��n��6�N���f��U\5g@�Zp�}���p܈&���M���ݹ%��;����) ��<M3�í��Pd("δ�@�V>y���:Cƶ7�a��ln���0�o�L *)�.6[�'�9�x&uY0����%��y*y6{d��X��d��fL��>���1�#���Xx��PV��d�a�O�E'��uQ���A�zV{��n������8�[����'esA�o�p$n�g�C�� ����F��g��n]֘�9����!��=bx-.��j�N���[%��xTM�=Э���+��lՄ����]�<��&�kɧ4����+̴Tj�r��[��n5o���5�֫�S�9�ja�=@���O����ajkSN�J'�2Gh�1V���ub�F�,��v���'���Y�
R�>j^ӣ��k�`!1z.8�s���W�r�]�������Cէ{���H��<<�%�2��K�C�ua�Uq,qp_7#�����׻�q�v�X�x�>zA�GHr�������9'��X���6=4.�u����^ �6��;�Q�I�Zc�֧�3C�A�r�s� �&m!�7���ľ��ʾ�_���.�@�Q��K鯾�Se�9G��̗�M��^�d.�5u$�9c}���i���O�������s��/��f�S��A#k[�M�z��lM;��b4}�!Dam�5�n�����-YHH^�p!�1Ko��[�ߋf�V�6�e�>n�Pt�j�i�岓k��f�^��)k\(T���������#' PV�b-�W��|�6&�� ɓؘ�}l&F�*�N��|a.Y?��0%��o�x�S��֤��cO:*�e%6�@\&�.������>K{��~Bz���2j�:�~5b� ��U�|b=���y)�MY�&�s� `[��+"/wЊX���μ�eN���$IP1��?���:{���$��+��vj���!w�WE2�r^�%�>#3��4+��� ,�(	/��Um��O	�N�-�(K��N�=�H��B�)�"^��R1��j�cN#kW�J�.�K��r=G:���uq����k B�Ͼ�B��A��l�dQ��|�w���b�6,R3���I#VB�qK�O?ʝ#3����G�;C�.r-�4h�~1�$#t2�;�9�@�`�������Ȥ��C����P�� �WI�����<�]]�~,@�G�9�>��_���c��J�.�������p�23�����$4S��,�pAj����83�i�5���>lAƭ!�^���崁��6��{L\�+D��q�m��_@(U��ꂶ�r�q<\#�(���w)��)_�y�Q��6�6�����ӵq^����i2�^R�x��1z�5� o��5�T����~J/�Mr��C��e}��ە&yz��R�ԨT��BaOaƏZ�H�}�F�`�f�1�^\�+��+����i1N��K4���g�"�I8F��m�(�����Z�j�Y��ј���`��hb��l�L�*��$����I-o�A�����䣕T�V������?�F����`��%]�~�6L!�b�
�l�%��J�Q�jҲN���<���+�jt�N8���F���h���5ƛ�~v�P=*
�5�?��%���;��t�ۂ�lcy�=���	�&�� 4m�i��ˈ'���n��GW!!����x,���*���[#�J�"�h�%|�:���5�v�ڔ�$ l�8%��8����Ɠ��P�G_���@wO<6�b�\�+�*�m�fѮdsy�ifk�B���֝=���]�<���X��.��[o" �M��	�c4�k���)��R�?�QH�hv �c�����Sս�rH�f�9D1��&�@�r���Gn�/���D�k1.E����5��ݔQ���Q�����i�.�\c?I�f��m�3?Y7Q��޾�������������zMG0��ix�����.a��P��������Q�򁢶郥���eb<2E�S�������%r��w0��EC���_���u��.�x�3���Z)����>g��|&�u�}!�iw�{ps�$�8p�`7��U��	ں���+�� s���gr������$`�'�M��d!:����O��㙏���:<�oT�Y0$���>�Ѵu�<@B)#v��Fbr�f ��r5۬H��
Y��˺v��0�(7��R�"�W¬�����6,BUJu���-7��l{�`��W�l¥��'č`Wsa�]��`LwKZ"O
�k�iƇ�ĳT$"��p�T��B�5��������Fu��3�I)��vc�8ހ�6C���=c������N�l[��b����p�<,bd�X�#��EE�Ť}�s�Q�6� 6�T+j���0|��]lې���v� Mda,�Z�)r�Ĵt��pK���GS��'.⭹;}s`]����Q�'U�.��@���Rj�K���˕�b=��k��cg��r�X+׊������\vN��o���1�]#��i��m���t�K23:��ʬ5�e@O��^�]��U�F��1�����r�wB�'�s]:�'Ggk�ٳ���^̽w��%v�U��x�O����D�.�#��h�Etj.�F_2I����]�Sߨ�Cˍ?a�(�޶��>/f�M�Q�$�H�V���H�LTt�b�\!0��ArpgN��x����|��8�-����>�Xm.��؋�@���m)�["gj�qD�;���<��@��w)��4��@�5P�/Sv��q��l�M@U�E�y��]�C\r������
U*L�����G�E�-��[���
�Y�1��F�Y.��ZM�8���;����d�&���=�l���"K����KQ�<o����(����{�	��z�:{�H���Ѐz)L�%` ������Ə�!)6�RZ?���Rd�W#)��Y�$��
n�_�X�hq<�䣣>�21���-�۴�N����g2}�ظV��aν�<E������Ҳ"R�����r�D��U[���������e�`H]��ۘۅ35�Q�1]&��iʬ+�@r%��X��I�옍1l��8�y��:D����TGۡ���K�p+{��B�]eT��#�t)�3�j��KE�I��E]�M���L��<w���5Jd�e�xb�cs�N.p\��mw�Z��\ѭ7+Y;���b�J6O���}�TlV�簹bG�
co&�(�$N�pV��q��2E;���c�t��>{�4��    J�:�)ܻbQU��(Zᵬ�~w�,�)���w[◒m~1_-���+�hL���}7ߣ����oL>U[4�����%_���}=ko�K��Jq�]���9c�j����|+����|I��j�6��D����i�� D�|.4�f�[�q�,x�Q ��u�*F�j���2���Q�"+ j�K&+t]�eP���s��q2(��P�T�b�A~-h��-�o�%�n}��A�m ��I]ʷ@�n���~u����Bf��t�:QXpYҏz�ڏ'��A��]"jt�:[EF���5��B��tM����&�(�KUX"�k���G�Yb@G��FZ#1q!����J̇[�H�<�T�oK�h!JGA���Gs��,%�Q�G'0��4j�o-7�H��]Dǔ�"qRL?Q��pN&9��&#`�:C�[��x>x�ݐ=3���$'�xTu/���1�jK-�ݶU�����H���q�lR4b6@uX�~*�� �M����B��f�&)Hz/
����81hG%M�B&��<�M�����Z�����v�R9[�J����U'�ԛ�"��ܞ�K�rAk��߷~���v�Z	a�L���@�hyE���E<)ꍣ�8���6E�u&<�E��&��KK>�w~ěp竊�ه*�N�@'�\���L�?�LS7Ћ�+�|^�rhc���s*������H��zze	ǡ����,��t�63����lm(.4_�[���p`f�FD=T��2��K���h�����ϔ�C�����q�=�G�78���Vs�6g��+�x��C�:&�����M�A(�{j�p���i[
}������ۭ��w��*~l�9w0���H��X(K�;m�B:;���g=��΄��L�΢ȵ��y8��13��C����ɷr����2��t�ƹ�YF��\B�����T��m�����6c]���9�P����|�aכu27��4׬ڕ�[/��F�^)�i�/�8����a��0O>��NΚ)Di
]S�azlM��p��;�qSR�j|�)��ɣ��L2m��Ys���f2s�i���_yz�~Jb�R�DM�� ��b��qQ�+�Z38>����{�[Uh��o��5�}G/`M�B3��!b�w�֒3<L�7�?&���3	ա��gI��`}s�X��w�K���!h�ɍ�-��t.����x�套Xqdܓ���r����g`�����&�LY1�?g#���樾���+ٚ]*���X&3%Wn���(��r��T�Q����.��>J���=<s�*���I�R�(���|�����b4~Kqz����uL���:�\��s�:x�^j��ܜc�A�
!����z�8g�,5�o���L�!\H�1�I�
	U��^�qpp�C�S��ڨ;Ws�qv$<ZY���ྯF�Z땮�ԫbҶK���)�ՃN�2,~�&3�Ժo<T�u��9e^�ˈ��2#(f����w��V��Fqգ�c��1�Gـ�[T�nL)���h�E-����҄U�L%M���U�h��qbz	�\I0ۀ���X�%>{���o�ľ���M�q˵�a�.'Yα+%tjd�l��Ϲ�:�ܒ���NtW\����b%��
Q�8%-�c�ptI���ِ���h*��-���;��r��UM�p������Y4�@!+$F�/B�Ji~o�5D��@���uc^��\w�҇��XO]�-M��uѧ��h�W�!sܞ�d�rUe�}�c˚�/�:k?_�Q�����[�0�c0��U�N*�{�^� ���w{�V����l%��1Js�x�XҤ(�,����c�$�Ĵ�> �P��Vo�݋��\/T9�H�M���2"��9�W���{��33����]�����C�YQ��2)��h���$NL~��6[�= N�1�"-R�S�dIg�p!�(��*��< �t�T8�3��.���)},�*q��4����ܻ�6�di�ϊ_������/�RH�tOŢݻU�<LN�Sb'E�x������_�Ѝi4��6k��A�(z�ŋ���K�"�=�9f��HTd�U��(wss�c����	l5E7���Q��4�O���ԆL�Eb!m��6*E4{;�.���CG��*N���~�͖J��C�~�U*I}�S;*��+V���J�,(>#��Rx�!m��ܱ�g�kG�T!o��}� @��\��W8h�e�#F���J缴g�8��M:��R]0�6Z�Li��x̟��3%�Z�pv܈�uF�B���h���&>��m���$��U����"�Hg�RD�Π��?tt�ԛ�;R��w��t��~��z @�#�S�>p`������^�Հf���(���&�=s���d�e[!<T��;u���W5�n���$�D�=�J��[)�N9[*���5(^+��Uϗ]���+!^S�QI��>xBy^�/�*���,����Ϭ��^Lw�ɶ�Ct'�F��6���Y|6s3�a�fy4�V��i�O5�<��2P������@?)ˑ�+
��h��9'��w/n����S��n�d]��,�i��N��~�>󕢳���~�� w���iBo1�.�u�'{Bcʲ��?#K�ΖE(����C��)��4����EM����#y������q$��Fќ��Oዐ�o��u^~���ƚ�n���oW�l�����T:o��ֺT��'���<_"���93���y+�dq��$,����݄�|J�́q{�
°?6���6�U��+��b�Zw�r�ur�F��+�k^�q�SDr&�h�T3t��~� �:�<��2}]�\����z���z�����(I�Ǣh�$#��6S���7Z�~�^"U��1���b�,j:w��v[=�Bl��Ҙ�S��?.�x�F�'o���Wt�ʴ�׷���3;WG�Sy<$�>zEi�+3�F��>���_�\��7�;{5�B��f83��r�I�׼M��pC�R�����7��镱�	q���Yg ��~�!���z�h<�U��y�#��hz�b!��� �}M ��=z��g1��?�`�ٳ�+��eL{��l�Ȝ�(���������� ^���44!�Jj*z���b��t�Rɇ�}ѩիM�Z-d��r�+�KG
�!j@��M���/�NRAka�b���i��3W�p`鵬U<'�f�\'�`4Eht�!|���|a*`1Kc�6h�s�������x
�(TA��nt:�ߥ���q��G��\�0m#��m\�f�\N�i#P��/mjC����y�WjldK,�S�5x�"��K�%*N� 'i�)��C�|C@��?e�vgP�B�fT�8���A����i&)5�L_�]� eB��s~�������m�|#?iW8�u�P��T�2Ͷ�m��j�{Z(���se���F���q}6SkiX����z�|�/>D���Kh�����D9]Yi�>~I��8Z��n���vg���沉GJ΅�����V�� S��9�Ќ����~�On��tM+{��o5���_���
���-��s0���''m_%	���=w0��h@��V� eF���MֻƇE'4��qp�5�vw:�׋=<��٪��\j�W�i�w�۔a
>�2�|:
(�iV���F��5@<��r
y9��/,>+��\٭����7!�Rwj�B���j5��(�k�*���v���lg�UM� ���rIS������Q�L��|L��A�ǖT�N���V�hp"�IF����.��z�߳����pS"�/P�L�w\�����k���P������}Ǌ�i4��U��+���/OJ�o��J{���q��ಚ�/��jOB�$�
I�}y�v��'1v�Dʾ��y��Z��l)y����X���cr���ߢ}�@��Xʭwbr�H?1��i$�J�!t������挍�%|�b�o����@��~.?����v�����-��y� k�Ӧ�-]�ٰ+��Z���a�j~�r?4��{�<9se'��N�cu�B1n!�/�<�/*�âXHْɶ>}����16i�]<��F<��jd�AX    /{7~Vd%������񌦫f��URsy,��+�	y�����i�� 0h�P�H�>@��m��Mr2�e��/�1/3�Ȼe�>�`O��0
�ɷ`���I�F�/��̴�,��������^�i�%��.���@'��%(ex&_�H^N�P���K�<շ�[�ǎB㥨"S|�����/�vK�κ� ���mj��&��d�E�:��jk��L�^A�Q�r	l�y�֘$��_*9����p_�L�"d/Qn�{I,"7��I<1_��^A����o���P,J�<��CV���߷'�q�i�b��PD�F��d'�R���Px3 렟������'���i3�Rpow��Զ�bl1��dL���ܩJ
���c�)2��ѻϏ�6V+^�)�%�1�r٩�+I��z�,M�^=*=+T���s
�[r�y`>�ͲS)=�2��r�?R|g�۱`���Kt�%�!�Xs/ݷ��`nR?r�JԹ��������f�q�άѹO�YZ7��ݬ���ْ�2��,˂t�*T޲�k)
�ޮ�Q?_�+����n���Q)���L�d��gl_}�m_2�\9*�q���Q�Xs���wp�6l�����)�}F���؃R��}[�����?���Ad�/2��ۼ�+ӄ�sgI:�;$�fs�������� #B�5� ��E�o�dI&iW�:W��[��h���ǩFЅJZ�暴�7�/Zgg~��BJ���8�X��MO�FY\���w��h�cA��y8�3u1M#O^�jkioDh�\jh�Gnסd&����w��*��T���� �Ǚs�G>�hm���b"�넥����F*����u�sQVa�-D���_�ߺ� ���Ig�ԩ���ߘ~2��[�=qR|�I>���*����MY4S�P*P�H0|8�����د$k����
\G��"�~�p'��P��k�*z�`%M��lΩ��%��-�l![�W���6H�����ӡu!\ݦ��&뗂�V�MzB�SI$KV�/|�Ė]�a$B�A'b%��Ȣ�V��+q�P��g�?fVt�����F_�HtϚ�IBu8�=
����QB��q]�� �1��S�ѹxs1�ൾ浴�OB;M�<�����,"W}�Q9ys�u�?Yw� >����*���	Z�*��sk�#�_Fx{#ֆ�>��Q�FG��*����f-��5��*L=�ש�ӗ�q��A�f�Y�բ3O���Ɖ~����\=}+� �YZ+"�^�{ٳ��
k6h6��"��~��=�ᶲa������[jv�����Ex���/���p��+���\�,`����g�Z��ի�V�l|�N���f�+��f�\��G8"�@��9�6hǯvJ�B��V!v��i ѹ)gk=Ov�uiΪq�N�1��"� p�6ARڐ��5�ڱ]�{Ȓ�cR�P�ɞ�T�c���1KB�ds�Ŝ���_KY6[~�+��{��U9�T�<�X�?��ܮB;��5SIP\h5������,C`8U��z��ًT�7z�)|g/�����Rl�>R �tЎ�<����c
?� n��6g�S��\>>>�6�(�'Oi����t�L�L�Y��)ﻡ��<V�X`l\��K�,�{��{=��������R����^��׿%�3��u�������J3c�k����η��;<��O^�f��2�4S��F�:��f�J��˱���X��B�Dcy奈F�+��O]�~�м��저b��*�����J�^�������,�1W�3K�:Y:���U��hd���e�e�JN�Xi��b9��״�J��X��A�Qh��)<1��dː�ǿ�|Ώ�|��ؤ�W�4e�.�NtE��MAe��q`���b�u���}%u�)q<vm���=8�v���NI~$���$�f=����:,l�E!�u����"��P�#�}�=��{f�Xb�G ����h86���̽n���Թ�]�;>2�BH�5֜�d�?I[�5�EvQ�i�Պ��2�:¥�H�� ����M�Ĳ���<���y(��`��\h0��n�'�Eބs��r����vvNw���]?��=�aR%�����qިP�q�-hjCy�N��Ũ'S�Ɂ�r�Y���T��>N)������ X�N-.r'��u[��39�?�	���h�&����_�]$ϯܨ�*��ՊY�~թ�ur�J�\+T��|ɂ%�ɂ_�k�ߊCG6u���;!�bج��'M�[L���Qr��퐖 ��2�R^k��r�F����w�jF+C�φf���GoCv��vs&����%�D|�n�E����������!���)��f���w{�)Jq۵�dhӻq�>�S\o�Q�X�Uն�E�<��n-�X�����S��H	���A�{���Jl�Ak [�e�XF��y9�edVZR�܆ɐ;4���ʦ����ܳ���<�o�ti0�����K��M���L[�v��/�0�lt�``�4�⣶C���P��TdEu�KJ�s�
�s�-��n��U�yzw��V�Z\���4�/Q�	� �'�"44��e.�Upi|���k��Ƭ�'�m����Z�Т����J��>E�� p_��;���=������P[����9kh�Xՙ`q���XH���Þ�4��e����ۀ��h?S��a�E8�z@q2����|�.�î�f�|�J�2\$��4R�0�K۸�7��)�'yW;j,��g��~��90̯=kx�R�r�b�L_k��j�FG��W˖�o�R��c���l����Fr�WAʻc��"�>�p FJ�(J*��|t��Tsi��J��=y�n�,�+P�3��(��j�	>q^�gU����R݃�җ���Jg����ѵdSȋ��ͤ$���K�q���B�}o�C������q
�`�JD��d���ðq�x2$�����6+m�36]`�֨�f.u�;
K����Z���-��<êA+�\T*�~N�����lZ��H��]��,;}���_���>p�"y %���+��#�1W��ߓ	� 41��.{Fpat����H�t�:�mnCA����ק-��"���Z�?1�?�i���ytI{�[�<D0�̃]�%h�5���5�P�o�|m�_P�����o���#7Oq �����c�U�GH:�#�|g��Y��p�P?���>\.-��U�F)��;~�\p��rͩ�\���l���6�~6{ԧyi���5�M�Ã=�4�a��Q	)�JCl�xo6Ћ�w5�B��*p���ѷ麻1y�6��[ڃ���\�"������0���E�,��݌B�#+��/2��`;��%[@�a.4�n��^?�15�����n�o��ZH�w#�ذ%����$è������P~�O_������0��ar�&��Kap����;'M��s��/N�&Y�,���"�<�~'�����xi�sװMp�k�� ����7,.�BV�5�BλKv�w��i{c��k��HŚ�����8*�i	o���,�����u�������w��o�[�����%�	X�<�B$)�C3r~.W����Ө��Gճe�-�Y�Y�V��K�l�Cq�a>���Qy'K�6�n��tQ�r���Ѩ��4��d��])s����๿L���>��j��=8��G�^;RW�A�����Y�е�b��� �?��e���%R:��������0X�bщ�`;X(��-WW9�C��P4IQap��'.Q���k3HY�sf��u���:� ^G6Њ��������o9s)Ϊ�I$�6'E�x�F��TG�"�C#�c^�ȃab��y�@�;.�����c�*\;W�zI�Ae�b�Zw橃j��xj���\�{��n��w��]��2��<D^���!>l;��Y�ԼF�VwJ�}�X+;զ�w��z���y�l�xĴ^��Not���z͗�3`��fK�Wq?z�'�a�?��~<:��|�0���/n�Y�m�G�	&sÐY�j������� SZN=���u7�)�    ��o�����G��]!#mӪї�RѪ-o����~�3�#ߕ��h�$�{[OM^w<c@"p��E"��BK�2�cj�τ��j6�0bO[�Mt��òA��q@��`�Ȭ�ۗ6nH?�-X���f���,����L���#զH=X���+V�~���x�7ں��S/5+�B�+�����-4�[�w��y5��&��֨0� �++I�
��	.��@�R�<�l�����X V�5:Q%_r�Z��k����٘#��+Υ����/2��!��������ku�����]�!=p|�:,N�΋̿�«�z�h%S�����G¸���y�o���E��;-��a_�����	h*�?&�DN1].��jEo7Z*�^C��$x#_�ᦃA��O�ߛ�����`u3�-�t�^A���R�j�9�m�ޤS�;��,0����r_8�ѭ�[S'���j��$a)*h������,߰���{"����44(U������a����99���C3%�2����'�+�����ǜ�a�F��gp�ӿi�(�lz��;4iC??dضw����I��0����l��4�ٜS�4+�[t}�/4*�R�P*TR�G=3�������F:ɣf��1]� �\�YӝW�C��T�NqG�O丟�BA�hA�|	��ϴT_���U��Y܃��zIA	B�H��]_��=\�<��5|��$�"`ɂPU>�$CR<�7�h=, ����@҄N��7l==�H(����I�׭��J9ˈ�>ݪ�-�-u0�|'U�n~��=�޸�e� ��L{�($�L�V�A�K�����T�^l�tg\H�pzw�j�@t�Ǝ�K��ht'���A��>x�a7ݭ��i�>3�3��_�gc�W�W8Yqq���⅍�|c�f�Jv,��Q\(Bnc8�_�9�x��<�ﶩފC�ء����j~��@���9�7�N�Z��)���J�#�H��'O����k�hG���ڰ$�s�&M���u�ß͉��BМv�>��<�{ƅh��I&��R���6G��W�,�����34�)���Js��ǆ��e��i��Tr���J놁=�v� ���3ݷ|3�uV�t�Q<.��D�F�z��_6T����6[���w^���5�m��4*dnd��8�)��o�A�U����Pձ{d@�㢩�Wh�"c�D���bهs���g�����|��t�������b}��b������,�,�0Y����C!�97K_���j�\s��f����wJ�W���V��QK�Yr����K}�E�F��i4O�h�\��l~�t`�;���x@��i��S.L���!��Pf��ޤ����&Q۳u���$'��X'�XX];��(�[��|��/5[�n��i&��\��6N��1����-Є�:�Ɲ˷B�D��-=ދ��t���ui�3������.��%1��p�@OW��e�7���\��q+����8ӷ/�2�[�ʋ��rK\D盒�ѷ�>�Ax�)^G�9��0���De�]Cy���wn�[I�*��d��r�<�ƾe~,����	٩,ZACp�@�~lT�<�&O�`A���SKZ2�]���f�������z�����z�E\�2�����n �W-���S�WN��zN��5�|�Jgn��7�u��1v���ҕE�tw�D�a�c���(��	��7Ѵ����ۢk����@~$���RF�5	�bN.��Ɋ�
��րG'���
�D�Հ�0� �Vd�p�dN�J�"/���z�g�;h\`ϗ�X$W6猛���j�a^�
���$oocxrI�Ni��ƅ��.6��B��4 iJ��嵉1~]��8�۹C�2y-��R5%�`�����u;H/�@p�T���˨��5T������cpY4/�~Q��P{2�fU��d���> ����yU��[���I􆂟�'r]�AK��5�И���Z�Sh1Ur�V+b��'�1�-r�\w��^8V����ŖC�U>�Y�l��[B�Ft��e
+U5疥G�\ݫ�ݒӬ�N�P.;n��u��ϭ��Q�Y��,�*y�Y�}��(U���y9��/4�G���l�,S}���h	��P]�.�}s{�Gv�4�B��W��N�ۉ.�.����
�� S-���85��l�BF�6�@���+��G�.�ĹG����`�MJ��+��(�3*�����Uq3��<�j�0z�kO��҄���u���n�M.�ɐ�����θv���s�[��(h�)�\Q�����c.y)����á~�q~wG+y�Z��{W����Ht�JhvR+C�"(ݏ	-%��x���y�mu��OS����ԣm�c�@��#ʂ�����U:��ʘꑵ{{��	�#��4�>��Hx�T_	V��gݶ�@�/�T���W�]���Vut��%F���d��F[���³�������{�&�t	U���~l6�U�� U��N�k@R>AiV�&���H��ᒲ��DlD�	8�(/��z�.&(Z��|@��b{�ғ 
'"9FvK�3�ߡ!��h�aO�-n��B��b� ���9GN?�Nވ���'�b�Z�R�Yh��Q|������9��<\\Fw�������G���&��_�
��C�3������:�e���<���)�Dv����6�H�G�fZQ?(���xl۩䑒%��Z7��G���g,BX���H!��ֺC�}Ӝ��m�e
�])��"�j��C�2n����δ6 �-i�=�S��*�zS��ܿ
&"�����E��V�?�Vk�S���bO�V��B�t�>�0�r�r!��N�kT�"�S��k:�j�Zkz�|��8�)��ι��R�>=� ��}�!��k$zp������1���������/�Kz2��{��n0�j�}���?�&|8lE>ҍ $Z�V����]o�뾡��8���	��18'3��w*@0�>����\}c5�+�aL��S-޺�ݵ���t���Ai9��ȴG�TS
WcQ<\��:���$����@��:�v���<aL5��8P^���
��z9f��B�Z�[Q='@#�4��֦�a6�՞���l�/����-9�
�A;�q�F3��j~5W="{~F�����?��zG�%)��?����g����?��L�����z4��i���}$��6�Dx�%(Y-��vƮ��?Ғ����I���E ��$x���[,ٚ��G_�$(2�,�[��:���#f�4�J�I�!��"d���̗bq����^qU�R��߻簕��Kٜn����d�?�����}����n�F��u��+�)�"r�#=0���fX6��x�5�9U�KE_�ws�>��t1�Ë��:_�0I߃�$������H	z����^Ѩ'ޝ�PM��񌎬R#`�S�ryd����P+���[ɒ�\zV*W�
e�z"��}�`�+Uj^5[�1M��W��CȻ�
 ��˭'��FW�V��V�s�{Q��`�R����~�f פ�9�~[�`�Zü�VLĸ_gU���<_�ɧ�|ڢ��8��%�s�^�8���A�c�fhjH ��g��V�T:Kym�1!�n6}v�ϥ��[�}�(偒�����pk��v,�2���*��/��h{�k!�m{�
 ���'�(�����Hy��.u'�����+qm��>㽬�����Sڧ�S�i�-�=k�uX"b��+�>iVN=\�j�>���Ԋ=�����%����VF��P���l����7��D��r�(��o��r~�Ʈ�M8_�U
�K�lkuК[�L"*ryP�=�;�����"�k�i�P�-;�܌��h����Y����$@���Z�Tqje��W����Y�T���rͯe��� ���M�|��!d|wul��8T��P�9!����?NF��+����9i��|Tw2nCz񖎥� ����h¼#QŁ��#�"�: F(lj<����%��b�Ge�h�׊V8BA
�[:��΂���*^9���rI^�"D�Al-vD�[    P�6���P�o܀),����LQ�۪_�w&�U����N���,J0�
�zqQ��3�E�)s���M?��@$�ۃ���	����sjk:��)��GZ	���+��ԴXK�=� �ș�GP�~})n ���uo(�0sPtֺ��<k�~C���8}$����RO�|�;5�۳�u2^�� 1̐_w�@�ᴴ[Ls������s݊tY�H�@��:4��;��<�i��)x�=(���u��>����;���^?MK]�A��s������$o����;�<9����8��)1�k`殂�z	Zs�g���v��>���b��}���_��Fg�+1��-���h���2P�b�>���h�ϼlի6A8_t�k5�u�~��K�b3��W�r�H�a5[=�%6C��oʊ�.;KW)1&��b��m��QU6�J��Ȧ��fθ���pp�U��Qć{�i�Z��H?�bČ߮%:Y�q�P�*���Dk��|�+��W��[�?��ߐ��j&$ېI͐���Ӓ�����[� �bX�B�����$wH]���|*]�tI�D�Y�´�����U�1
Aɥr�o@l-�ѩ{v������Y��4dF�89��ݠ+�ǣ��$�����*��j *�W�6�ۮś,6���N����w����B�`Kފx�	�Î�|`�3���J97�9�f���q�"�R��7i��K9:�*G
��'R_�'OOr*| :�«���*P��@`׿u-�x�D����H���.N��:m����@m�������}�X��A�t�#S�����k�98�V�?@G��H;:�d�l`6f�K�nB� �֞޿U�"�9��\l@�2�^����5(��']AB���tTñ�3MZg�7��X���T6�ޙB{X�2hȷ�φctk�&m�Zx�M��$�$�w�g'Ϧ�}���t`A�9��<�?#)<�`.�"��ߪk�-
j�d��`Lu�i��J�B�iv�G�F�ud�4��	X�4�B��n�����er�����5��
_���2��ˈQ�K>1P��Fh6�ޣO�oG?m�~�:��S��aa*����0�Xy�g+^�Q� �/�M��uj�b��k^�Zqk�ۊ��������8����#��B"Hz<��,%@�� �X�h_"ZG�*�J���E�C'���+)b�ǒZ<���\$��qe��;)�lu�nc�)~H�;��k!�BE7ȉ`�b��S,��>�C�4,L��=�GI������.���� \�J�-u�K��w�(̼�CI���"�;K&3���2���15�4a���m^sW��o3���j[>T�
�=ly�H��;�r�%�50�xc��0u�9"?h6��4`�!Z�cL97���IrظZ���MfsC�(����!x�N�yt4'����*��� V�h���L�օ�<>�$�"r!s�~F�0hPr3��b�'��6�����s+e�{�0�W{V,6�5�Xw��F���*}�k4���n�Y���p��.^G���GO�s	�U��v�d�S)�$3��W��7��J�g��'���H���ן�3���������FbC6!7�{d��^'��I�J��e��4�5�w,&�J�I���(BM��7o"����������
�袓h��P�۸ ��5?"��5ZH���s���2����Q/��"X
�m���'���" w�TP���D�=������z鈢�w�E��O�{��/̓סb��ʠ��kz��u��<|R-U�|-�P/6JPJ�{N�VnV��Z��W�N����gR#�gōTuB�Im�a�̗�S٩�S$�ɕ�MrvĖ�Z^�'��_6���~�cſ��O��9�UM���<��.���*Q�s�7y�c�@��ꖃ���@N�Hkqĳ�s�i��H��qH����gᯆ ����X������̮)7��(�#H�$�_�(p��{�ޠ�G�~�����2^s@���3��{��p��r��:E�zYb�~Rz���,����-��~o��tM�{���"�Ǧ�	_%u��_pz���a���s���� ;nrϲ�E=&�`l��5��y��o���V��#X�/?+k�l�+��;�J�s��\����^�o�KŜ�z�����w1o勉ϱ�&�U�"!����P��hN�Ky,�2��k`�5[�^����H��s���6��#�_(��4�S�]��A����T���m����"n%H���Mw�J�GO/M����H�4�9�_��uo&KŹ�1z��9�3����;R������a$,[���Cx�����-R#^��35X�2�Q�q�Bv��g[q�
J?��}�d�Gd�Д�HR����𗹦y>ZjA���+�aڗ��a4T���D�����w�q���'��?�o�v;�i��h������U�(�>�%ڜ�5k!����m��|0j���f���T#��{�*���7��.Њ��>oX�D�-���@�kڒ��bho����"ڹ;�+)��̉Igs���`�!W`����l�{`��95�\![�[(9�zBs@C*�l�Jޓ�<)���?=|a��v����<J�6�N�?DK��og��i pc�#�E�fbv�P�2����2I�nå΅���EO}�5' tݕ���Y�&�>lTZ�Kתb��-�֤�e	���s��q�f���J��u
������g�>�	<��V�(�������k��ܳ�
�����猈*
(��Jh�=�N��
�d.�X�`v�I*;	Q̀�+y@�����I��B����ru{L���4������a�q��ˎ.rF����&�ì	��+~�^�9~��:�r���K��SnԚ�f�+��,R"B�O{�ѷ�"֧��QL9�X���^�%�v��nR�i�92�Z�x}9U8ˤ�R���:c���*\��W�ap��с�}�(���"�����R,B�8LZ�5��R�/4��(�R��,��0���	�/2�6g�Ig0c^6�8�_�EX���Ӓc���n�δ褛��}��"��f�3�+�.�)ъ��w�Y��+��h��}��l��t���~�D��>JjU�a3M�w�
�_����Z�r��-��D��D�h��t~kzwqk�^+�Q(���ws�m�tUβ"��K����D֒?�.h�x�}~xf��������5x�Ş5�� r�~=��9�jl�ܞby��41��xc��Vg8<��*$'|4�e��=����Ϸ��A ����)X�KP:h	�)�� \�ͭ�ݓW�����6��><˜��鷼~���ݗ|�9E��3���*��2S}Z3��Rrw�׬���ھf�t�T�|���'0bz�d9A{]A2Q5���p�Р�3!�此� 1^~������$H�Dg/R=&�~/��&�<?�(�+����kǏ�S^�:d�,<��.���K��[�8D���x�/���	O��[ɻ�Z��4�%�żS��tK��<��z�V�
Ŧ�
u
�s~ɩ�E�#��Δr��ңր�rTĠĹ���R�f7�V��l~���G�c
�p�^,�Yü�0|�"v��WǼ��pUqj����T+��h.��|�xw�%<��JeoLF@=
*�T�E^Ȣc8HH=%jx�;�mf��s-���n�Jd��+��I�����e��|��^��$nL�/b�i��f�=G�b"~�����&me\�-)v�[LO�� �h�*+�!�#)z�>�}U?���8�Ѓ�i�����\%Į�L#`�$���/�y��\��� �S�M�L�Iυ��I�Ayt�71�Ƙ4��^0AnZt\K�1Z�?Q������Π��L�x�a�bՃm�*�����k�H��=��Sӌz�{")W^CA�i����l��Z�����+Z�̩�ɹQ�{]iKEJ��W�0)\�B�f/�A�k�H����7�v�_��6|�3�*9{��Mb1[,�n�2e�83n+g*��Ɏ	��
���$��9�`���l3O7ˌƣ��f�w,f�
�[��>×���-���<C��T    �i��O��0suN��3�Z�k�$�2��ܟO������g�T����D�\1����a����am��g�j�Qiz9�Ѭ�b	@���;4��\���� �����O}�Y�>C���ǛX�$X�\E@�jj�Ǫ����B����fv�m5�n�Kk������+=&_r�ܠ{�F�FSc���&��3k�!�%�-HX��mE>��a�n�l�߶��߳F�ô���YK�n+�G�m�5�{!cL�������XQB�w�n��
�G�1]�U���a��Xs����߻�`}%5�4��m[�ڵ'H1Lī���@vF���9;��~�F��y���F����0?m&�(O�{.�c4�-��Dz��H�!3*��ED�q´ʜ��q �/�����~zh�7ͱ�L�n��f����g�R�mVݲ�kfɅ-4*�[�՜j�u�r��I3VR%�f,���m��������M��H���$�O�V$��A�0��5;��v����#�M0�*ϱ�ţ�9���>��5�CV-5j�T���M�>��";�?E/a/�^h�7�PQ�j�*���%�b
���5(\��q���Fi���Tq3��3_�:I7�)�J��2�s~dʦ���y��7�����y8ӌd��Y��Qh@2�X�C���ۅ_�al�9jch�r�f�ٵF�p	�����]��z�qOXiR�å�Q�4�_�ތQ��͹ 8&�Ɲ9g�$��4�\̓�zo;��m��5��>�<@�h-���x�
u{���Vj���h8�j���zΩ�*Uǫz�rݫ7�b�eTR�F}�1w� i��{��+:�:�^%OK�T��&�e��okЇJ_�9��_<	�2lABC���W%�);�zl۶�g�$8p�p��C�����婖��w�_�;��d긏��5���{ցJ�ô���_�VNLA�x4z���f��Z���ԴDC���=���jq�m5�/�	�ݖ��,��Q;�/� �(�Jt��#,s�a^-�R��#�$hI����
�����u���'͵z(0�� [��C��c=�������dOGW���s���3�/9�|��;�}��_��rT�d��!��5[�i�� ¼� �vO��%�s���1R���+�Z~ ������R�se��&�f��RA��4z��r����������N2�)�y6�����-��fy;�'ک�3���Z���1���"�E�J����s~�R�-Rg�F���!���
'���$�^	��Ľa���6i�S4�p���8�7�|�p�,���3���/ݟ� ��Y�6������-5�CNQhw=���֔I�\V�sE�̺NF��(3�[ÝA_����n�����D��~Tn�P5�Zb!Zo��dwA�f�%#|�^M�;Q���8����Չ1T���9eD��*0����w��B����;�NuU�&G�G	��j��	�)Ve�xK�.��:�9JU�)jd�����A*5��$�.PZ��s��*��j������7�;'�[}��������ۏ���q��>�g�K��׏n�&�V���ar��l�a�-�/����Qx�U,=�5}�V-W�j�Xw�n.�U���b%W.�KY�;�VWtܷۦ�������~� ����Y�f=g
%�E����rT9�~?^��$]F�0�H���%��J���^�tN2������G��U�؃G�%�[Ô�A�J7r�Q���ښ�c�X���uO�NCā݆��e~;<u�P�Ec�� ?�H�M֬;G*����G�l4�R#�K�sd�=�<���g�R6��������0��!������RR.�w1�P㘯B�x��	@ӯ%�B�ޑzۓ�w�`� T��s���$�,��o�eAK�v�'��7t^0�́�B}��Z��5w��vM�r4ʾf�� |j����aX�R�PI?6l�R�Ңm��W(9�1�����v%`��޻�.]F�%���Un�������P���֋��o #s��}�9�sס!l�/�%�\srd� �B�a�Qtr�z�Q���B�q���C�D觻�� "�p�Y��H�&����+&M{"K��&HJ$�A�����s���u�?g��W����G�epa�����U�,���Mc�rF�"�� z
B�F�~%ME¥b-�ӶǷ�)��J ����yc�y���|�����i��ٚK��c+��BL\gm���D+A���	�>�UK;�BϺ�-�Pg��ºY#h75���K��N
��O`@f ����V�(����� �PZg� ��}�ͨ����~�V�#O��	��B/���z�4éi,�幠ϑ�I?�(Di�(�^���\�J0����M��^��) ]n�Y�GQ�R�U�9��+ 鞭9�l>G&$_,e�n���)f�>3��2���D�)�*�~S������dP�l`����c$�'�m'��+<}��S�����wv��%?�E�X�k���"�@��9�����.�����ݞjg�gS�]���(ZN{r��/#�,v�����U a�dc��J�ʸ?���z���+��{v�ymXӺ�+�������f�_���!m��k��}�LQ�|�E��S�̴���L�R'����^X�Q{n|��������Nڰ�VK�m���`e�c
9��6�j=�Y7���L�Y�R::;�آ=p�V����B3���B;�Xϖ�����B�+T���[����$��e}����='L��6�zO�QZW~�S�/D����Œ+��>��5y���%��\��^��I5�N�%��Nƣ�[���{)m�,c��N�x�<>GuښyVfO20:��f��C�Sڧӎ'q�1�d�3PJ����or�I�,�,��s��Xt���d�y(s��d�w���$6�Z�tsM�s�铨42����e�5�Fs�C�#i�s�v30�����ɻ�U���Q"L>L�"x���Bý<��ѽ��A����H��xC1�Hd�a���Zl��lթe�躾Smd��b��V�l��;�vcW[Ѐ-{L�j�[�0!�ɏ%/<8_�NdX��̜�b9�$�ױSVq'���S�h�^2W�髡rc�eɫ<�>�B�c�lr�'3�K*��;���_�3~�b��f�ȫ�A��_莁`1I�N͘�Y���Ml��WXV(J���;�.t.�����Q�h�b�����ř/�HZ9��8��U�:#���jb�r22�r�滘Fo��ΰ٘�X����b��g����uΜ��ɵ[�Lc��y���G�����b�=!H��������J�f�PV� �C��zsj���?X��u�i1,�FNTև�6�o_O�S��~��u�U/�d��T����3�B��=2�NMǙ�qO��lBt�?�4�8��|z���d��!���	x0!�@�77s�o�%fckonfmÐ��hw��٬�h�y��/��b����|�R�6�|3��V
G���ݣ��?��+'U��l���e�NΖ����&�R/��~�˥Qӝ�Z��C�}?S��$A�2�(=m���/?I��#�;��	NjkY�T�^xU�.��L��,�p�r@�["��4�Wݳ�һ+d�m���]{�*���:}7��I@�G�D_jF���Sb��PoPM�
[r�ZFrDSD���<rC(S��E�+(���L��+�5�r�����dӸ������֝S�A�A5}��1;L���VYU|A"	�W���FK���z��-�`����/ %t�����ܾw��Ͱ63���n��V��:�����r�$ �s�	�m��H�r�R�ٵҬ�W����]a�KEqJsf
v�G!���x*/�"���-��U ����a�2�#��c�8:i_�����@���&��QS����s#kz��H!5����C��üH�I�<����8�,���tP�˅���=�X.����U�\�d�\�\���> %IFh��� �ҮɌ<p���B[>�{��c�4�'x��\���0�����`������<-�#����SgjK�_OmU�Zi%��S!��Sh1�B�I[G.�l^��0�2yN �  zP�7RA��%�G�n�w,����qFI��`�1Rl�P.�,f=B�����d�UG*S���oɨF=���=�<Z�k�~>h�T��<�ᢙ9��Tc�
��ɂzY��s���Ѹt�$Ѭ�󼽸�|(�,�0�Z6'�1�ҕR�B5G᠇t`�h��<f����G4��f؍�	�K�i�Jݮ͕��J����Џ?�/�놑椂WǢ�I6"�	��wW��������Қ�FP.��,Uo��66�$c�2���!�F�b��Y�	��|p�����WsN���8�f.����W�7*�ZCq��C��&L��&�Qe���n�C��4'�M�?�HÕ���4j�a�~E��xYȐ�u6�e�Ċ�0k�_haACy����GSx�D���';��@����~�d�N���PB~��L��)`�,���OR�N�CKz��q�Z�όo>���N�	�j*&�K&�S�"�f.�`�|��.�����������f&M6�s��G�:ٽ��OU�PW��^2��"��E�ߌ��$q��._���8��'Y6��Og�W�A�m��+�W� �x��-$w��k��^s�pT���b��T��K����V,4�Ѩ��Z��u��^������m����N�BNP�R��9/��|̀h���O����W�ͫi�u�r"a;C�V]��5"�I:{/7��Е��o�����0	��`��;G�p���%^���E���ʍE�g�˹�7肞�8���V�:�X��P�n3�'��Z����f��ˊ�d3��_���<x��Q?.ñ�灵?5�p�;����ܠ���Tq0^X���1H�@sя�gP��t��!*HZɬ�Vۥ����_s���,<���c2�7�G�hD2;<�tp^f�v��Z-.a�7�_����5��R�N�J�D�e2��b��V���K�(�����ؑ�|r�����r=��R�y���!�͸\ߠͶR�Z2�6�l�zL�L�qX�U�Q���u����76rk�S6�߰�x��$ϯ��HDӺ��� ���Y�zL�
3�23�Y~r������{\�.3
��g��,�����bl�i��|tK�`�������̐;�p����J4�J8ΙN�k�nO"��������"K�'V�)��<ү�`k�:�����x'�y��[:��o�(A��M�Qp�z��K��|�j������R�;2
��9����w�z��n��+6�N�m4�k�
�KN#[/7rn5���#��f��ڑ��=�~��P�i��Y�����G,+n
�^!���n?ry�&#�����&r�l�9�v����oɨ��!3}��������$�>NWv�ÚP	�$m�r �\r�p��+X�������_c6����T0G�#�I�'Ai�n���D#�rH*�x���F-HFA�fݯ��1�������ҋj@�9=E�־�oouV3��J���!ק��]��v+%c@���X|S�7͓��5u�q��>7N�u�5����tm/	p3�P�߬/��D�L��!y���Knm��g�/�gf,��ʬ?�S2��ߔ�-���@��ݳ�9�y�m��+�0�Qx����R6Ww�j�)�����u��F#_�����A����^�&H���1��ד�3��&ay?�6~s���&���������%g*UxIX�ۣ�����tp�vN�I���f�h��,�����2z���g4To�m·kd|�����,�˰|k�w J���B�˼]� ړ8�yyz/�)�GBʻuc�TDq�������� !��`�����:K��=O�X�e�E�}s���I�	��D9mwxrj=ݑ�i�~�e\"�ͤ��ws���e>�WR.����u�'=�ﲕhp]��t�i�{��5���չ.�'kA�.o��?�t�n��|�k~�:�fNC���e�n����b!�����9
�k٦��M��s�b�Q��fሗ=��qA�~l||Hȼ���6������Pi���,�F5|�[��Z��4`��Ո;���	{<�G�<��n���]��b+К��y��[�nD�K�W���J��^�n{hC����k����M2��V����/�Tg;��e�AkЖ"0���x��Ι��X@��p�B ���]bơ��˥F���=���v�^���~�z7��鉔Ĕ�oQ��xW�
Q���k;q�Y��R��0��
|��6�oc�w�wk�;�7�#]�8J�L3��V#x�l�Ö�eH�]�N��6��^[���z��5+�J��������n�s��\>_*���JY��k�v��6���P�&���j��~�c��E���X�[4*�W�>� L�����I	�/6!�
����zU�S���K )���C�d}El&^�s��l`!�.ȕv�^���T��47f%D�����j��,	�M�#��s��	pZE��ǐ8Z_H5i�8E/' �܂]��O�P�n\\e0��k%��������+1�4�ߠm+���>�hL�ӸyB�4_F���L�O�*�����]�傹��ruR�Ֆ��2����l0+f�B�L`�>b>�wK��v�w�O�#��wjh���>��Hܕ\:rɩg+��˺e߯e�ל��+�v~�|xP�|�=C�t*`H}����\n������H�g̝�馟�ٿ{��l�Գڍ���3&��ǥ���G)��A�!��	�K������-#���5���q���9/�����k����-�i8�$��[@vd��U`c�5l֓���%��DϷ[C��\��#,̤�6$d�]���()C�����Tt���s��˄[��3V�-O��+Ɏ��V�g����)Uj�Bs�[�7�J��W�l���8F�l���������pt�b�v��!�2SaRH�53��߭L�X����(�i�t6Z-�,�Xk'��*����ﯫx'�' �3�-d̜�	�I�E�,�ߎ�:k,tX��	�Ē�z�%sI:�|ꄗ�DB��gbjiv2����	 Me����W��*���O�����C�
[�Q�n��}���	9����g���ᡁ*�Uyq�d���w#�Q���(d��gy,���P�Uǌ��ՌQ� ���r��8�y�x�h��a�Te���i�SIo�m����U�H@zbt���1�q�Fc~������f"��z�<��Qk�Vm�e����gϞ�� �      �   F   x����0��T�܃��[�K�_�wAL�UeXW���6��`�X����
�6��J4zB�""?F      �      x���YrcG���O���7��r�Z�%����~�,J"ٴ���vQA$�H�
�5)�f��mjO�$W�����1]�q�bz�h$�iZ_�L���R,�X2�Om��5"1�j�0kT��yI>����d����7qo1^Rtٖ���^u��#!��R2�&o��i��Ĕǔ�R۵���������L���f�q�Rؿ
W�nw}�����[�fpF<���)���m+!��5[�(�S5B�M�ޛ�F�V�����6�̮|�k3Y��̔����y�y�lJI����s7M���LY���[�/+�c��w�|kY��	��Q��Ifu��6����[�o./��p��N_�.�R$�kv�f7�6����9'ޮ����v[c��\"Ǟ풑�٭�/r�HO]�=�K���Û��`m��5����by��⨴t-!�fE��l�/R���,�B�#Jrv�#�͑P1R�(�>c1COۍ��,'���rV��%R�N^f�d7�=8wg,�c�J1��d��w�9�|��elY���9�B���Ml2ܦCM��Kj�}�墅�$7�9��̘�Gr��%���M�k�������ӵ@��-���r��iQ+���&7�����te{S\v{���/&��{E��(�vnί���-xh�fV��h�3u�i�J2J�>�q�EDnE�S�r-�PE���opCF��|�^��4��'��YhÒܭpss� Jv�=�/λU�g����N��%,lyj��W>������"�?�-�/9�X�_��J��M��ZԘ7}�����ͥ p��H���L^�U����P� p�;k8.�ț�KH�~�W��r��	��M�[&����[��j��ΡA$�p�Kv)�h�8Y�/o�ȮA�Y��X�����-�i��d7-��`h��W߫�x��2��� .Ё����Br;��O��]vsq߲[�r�	��.އ����\�{*��ͩ�f֚v�zH���j/� ,�\9�L�Aq%�;���J��q!�^�^�P,�0D���6#jJ��O�/����]�rH��5׌
u�S"<2�pCޞ����M/ý%�g�7�0�R�s�JqS�ՕԽ����CT	_��;_N�(��Eg���Z�%�W��o�� ��Π���E���k���cD�[���� C�b����dO��ls/�{�7VFm`eɀ��j,��c�Iuñ섥)�Q
�ֳ�t��>/hX׼u?�7re�TrH�`�h�)���i�Oi��\��5��s���uJǼw��~�֮�`�,i���}�'�����:N����R�q,�I�\�TAa�O
����7!�u��n��W%������4�-pܴZ��ޫ�����G1�2��]���Au �u`���|�ѓ�(p$���@�E�7&�|g�gY��Ej5���Ow�vm5ʗb���?�[|Zy�mx3-�~�i���:²T۱�ₙ-�)�3�#륢�6��w��^���Ez*�L$v�cS�}�N��Z��'<�H_8xR���qγO�ζ�[��C�x�ņW��oٵ��4�p���s��ܢ@��ކe�K�W�`|G�������#fT;�r2�r(*M�;=	W �x	��mm֮���I���+�� -A[H�i��4Z��Dմ4In��(\��l��'�A�<O.�������n�昑�ҵ{rc�p(hH)�l����ir�g����o��%f��>	�f���@ʛg_Ы��I�j�g
QI��,ć-����!�G�4\�i�
y�z�߇��;�o6\��wo٭�"�0��U6S��f`��5�_���8~hA��V]��V�[ea0��A�}��
7�&"v��V�l=�*nd\�:��+�`G><�f�B�K���ބ���O��C�>��uڧ8�tJ�RjH��6���J�}ވ�26ߵ���;1%�*^��.�(\oRQPl��.�'�y�d��[�ȩ18��3��,Qa��\"B��ؐ�����/��R�>����5�ϐ�3�'����I�v��ړi05W�(`�w��%��|�Gk���?#�����*|c�t�\O���k�9��C��"�<+����tj���Zk�C�{H�(�6�c�z�#`��*�;0��.�v(��R���m��d�$U_���19B��F�4C��lTf�:���g�?[W	�2�/��r��?R8V�[�)�����+(䭱v��BE���,�2GB�t��E��^Զ�j�}=����Y {7��|��� SS��pj��Is�b֭�e���:a\+֎�b)��iE{���~T۾RE܍D��8݇+/ý��uC��t�td7V 5�D���ˈ#)tq� ���D!��i=N/R~ d���w�j���!a��I�);<$����iM��P�kҡ�aw�Ja���}qD������ǿ�V�hո�_�&�E�.(����G����ۄ#��j5E�-�4�,��C�w�u��0Tu���`�תc�m�{z3F8�2���$i�]<@ޥ�FՔ��Vu洿͗$�,�$\��G�Md�&�n���/�R�6@�6k_����:�K.���?W/I��R����po�w�=�˂ڨ]o�����U��+��Xs͔���gI�ި��zր1g�DU�B�[w�K����k��%D0�6:��VX%�%��\�� ��NϢ�,��y�a�j�H��\�~#���s�@'8^i���C1|�����GG�u����IL4�/�ZjxL�	C'־BҲ:CF;$͓��w���U��j_�M7��iP5���Ov�y:�)�P�����pp��a���F`a�E��0�'��!�x��*����u&G_����d7�.I��H�ֳ׋az��ޭ=��u@c�}��:
<�uo
��@g�o�/�Oj�K�����W���/�� u��@�~�<怨b&���|j���C�֖��;�w�[�uvo�
�t��#�Y�˄�� �^#-*�И��L��W�|9/�ɝ�RqSg��=�>F�V�Q�8�r+]~�u$���|�;z�VdgeŃv���i��J��b��ņ��d	� �����\Ȗ�kh�ulM]j���'G�{v�Ӄ^�n�Eר�C�c�F=+w�%�`��'�����	z���n��\Q���X33�T��US��8y�����n�俎n�UK���Y&�Vo�sЋ��dЫ(d:@�k� A��[�M�s�����h���ʇ���0�#n��c�:0X_j-�R9R�RF��z�����6m��_g�}z�Z�.ܫd��X_�!)���̊���[Іa7z�b19:�X����U�r�g�{�j�v���<�nѩ��2��v�Rq�yv�̫+��0����4��G�z��.�oP�I�/,���&g�Z�zǀ����'�2ܿ9x�A(�t�beY�9�����V=`޹i`����Ԙ�=8�sls�����{� 7_�.H��7�z��i��|U�f�FD,�w���(�p�]Vu��������]��#�(Ж��v�������D2�ZF�Ԧ�oOi�W,9�:uUh����j{o�-ѺVĞ������M�Z������^5��բ"C�qC�i	\�59B��EwF:�4���EJ��v��4ܢ7�1����T6ͦ�n��r(Il��XxAP�ޣ:Yck�G��#�j!�.���[����2��s�d���U�R\s�0r����=�m�"n�# pbA��ʹwA���U����~�]-�����H��E�a��2j�BC Yj�a���4Z��#�V�̲~Ս	�k�_�ȞdW�1�ҽ��4p�v1Ԧn��V۞$��X����Qtd)>SU�Ic��T��2�{��=�[��V|ұ�K�"��>���hc�6�CR�F�:�Z�����zNF����w�}d�ٽj��� �������w*b��zQgӏ�J�9ՁI	ʹ�@�����ٍ����g� z�=�>ja�I�U�C'dQoX�[��Y$��m�u�5zS��V�N̼�3�l�#A�e�	�~	W>;G�{ 0
  �|�3��P�~{�*-v���=J�ేް��V���6��P��RR�{�u��͖2voUD���)���n�J�,���*Ӣ�0i��5S�zXݬ�A�~ۄ��c�/���Z)>[�6�qP���trW��0=#rW���s���s��ݾ�
�eB��6����8�v�poѶ⼄6�ȸ u��� D�X�^�?�x����3J�kMd���qN��nE?���}_��ZH����r����� �"h�c9�Tu7Q��
����8Ǻ�lg9�^1��p��V��S��1ju��E�&*��aNI��;�h�ӑH!���㬸 _ÿC�����h߷��zc�%t0�pR��0xO)�Dch���oN7��19Qd�P���ם����h��{]k�@B-n�k�?�VwٹpD0XO��[��
SoQ\�f���PD�a�Y����&C��PK��"�-?�4V�	L��X���_�r�Xm�>�h0H�$�+C��1���+W��p?��,���*Q�ǧ��^��k/�-�r¿9��3q�]{\ڌ�a�[��[#�2���.�H�M�-6#�֞�]���@�[��b��.`K��D[�mҬ0^�Y�o/�E�v�~�� ����d,��E7�����4�`�G�Q5��@�A5*�X�1�:���~��B�ŋ,�p��ucH��Q�^ns�Z�]�:��B}�#�,O��!�r�\g��\��"wG๘���G�'GO�}�7}	W�m���QWYU�H΢�m�e��v���Q|��ъ��=�N��iQ:C�����n}�|���0�������\�r��j~Ȯ�75���]������DQw_lOH]O��dD��6�Z����u<�����^�T���}�>�g�%d�G�F�:��. ׁ�-,�ι��ٍ�eL��/Q�;G��ok�Iv��[?.Q&���#@%H ݮ����җ��"Sl�EK��nM��v�lDb�˺�����.��>ި}�|d�!�s)�}7jh����I��k���=쥁juQ 2��L�p=��̽�x�;}^"B"x�z�� �z�������Ծ3�q�"R!�C�P�����#h�սC���I��]��[:y��/��O=��G4!g��$@��O�-Fֻ��>�*����{�Yo�0iY�p��W�/^<Lv�E��?�5�E��u�0U=N���=�pT��>L�>ɖ[�G\�.��9t�~�%�����9|��}z���-���m�'}�OH�>-�B�vX���Î�*�Kg�|&̅:	kb����{�וOX�K��#�Bn���c����P��D[s��9�\mW~w9�V��ƌ�����u1��W����ӕ��Y,����	�[z\�Z<��^�t�4,:�D2n�{���.��}�- ��w%�䞀�ë:y,nG�y�צ��24�q�ug_����Jt���HL�_ �z,lߩ��[@A�D\<���W��4 oH�r�b餫��s���
�����3�/�P^/���U��N�;-�>��;-vMx -Ы_z�Zu#WTE"E��������e�j8������1�.��yr�G�.��t�	]9��bA�X?ux �5\��kL��Ź�	����J�w��Ǉ7X�kҧ�jp�FyO����-\�������>]����A4�¯��8��L�[�e�͚�7�����Rx��g�B���a��P��\��>��1�-9ں�ܶG�뢬>U9f�w�sς�?9��S>���J��=)��s�z�`vsX.���H?�1���m�t,T6U}�n��E���.[?;޿�Bw�$�z���X��-f���O>ÜG*1l��YP�����& )�ι�~V�
�]�(�����R��IcNP���&Ƽ�-�Wlx�G�G0��Ա'�jӇ~j��$�'�=��rT�2oT�J��U�ԍ66�b�Gp�3��C�y��{FaԒK��B|g�MZ��b�q=�����㫚]8	#F:��'�-�U8[3�{��f�'��_�sǠ����p	b-nO�����jV���``��L˒���fk���<j��[�Z" ����(��Gl�se�v���al�.��۫�#����:N��ι��\ZZ҇{J���<Jꅜ�q#��}�T�2j�?΍�O�{�7a��2�Xt}fqZ��wb�u�����[U��?ZQ��6v"���S�����t*�0����ɫ:(�>���*O��Vs����F��Rl('��ׄ��s���-?��po�`� ��I�h�ʱGXk�>�w9R�Iќ^�M[>$����k:5����c�6W�>Y�N���6�>��Ȅ�ג#Չ��*�ˎ:�mRQc��}n}�_�"Y�=F�����1d�>��ɺ.������a�X�=q&�h���	���6&�H=hu�r��Փ��(-��%%r5u����XwH�
��>�af�`s��.�]�:Y��ϟ��*(�Rm}r������Xmҧ��.:;�֢�R��f/i�Jn"A0�������3��z�uV;��$���.o��ɀÊ�R��t,3�#�O��A�>Y��>A��u�O�� &ҋ?C��{�i1����ϟ�?��      �   j  x��Z[o��~N~�@X�-@�E��h��ݠI���';�R�(V+�.I�1
��>��E��űhQ�T9�j���K���E��� ��3sn��Ι�Z�Ͳ.�C��RU�uC��e]Q괪h����j��VuCnU�"kZ�"7��!S�Q*�JJ�j�(|��£���b���G�}f��n�����2i��k��{��R�S"�����z�M��w�ePǱ�_�G��L��Vץ/]�O��G��Q���WWm���/p����ݖ���n�v��G�Z���j��T@Kp�p��&�9���N�L*�5P;���:.=�;j�m����]j���Wm1�ۧ߫����{.��B"���������I��\���w�5���l�����D��">��SX�5,��/�]�"�~���۶�Z��cP澮{K�/�����/W��|�ŉ��aH���Cj�H��?; �S�Zz"WX��h0�\o�OB9�Q/S�!W�zY֚ �f�0eլ�F�Ԡ���?�T�ٺK�CJh�$V����a��1(��o�7�����4�M���G��e�-	�[��|{S��<���O�	X��8�dI���	�D��Y�y$�BX�6ʼ"�{�3r�eKb�McN&#o8�=���#�7�Ɠ���hB�l��(�s�˄�Y��i�ı���B���ף��Y���A��9	�,�-��>*�(��d�z��6��DN��:�PJt�<�C��P������fd��gğ��a�H��	��GD~�w�Z�s�sݨ�6}L�TG���ѱe�z�>H�!�E���~||����}��ޘ3�{�1��I��I:��,
��P�U8�$^4�	�,�P?&��w��(	3>�1$t;�lU�(�P"������N�4<AW�T?"G�bPM_p��k�L 	��+�%)B�j���l������V횖��ܫ�ԶH��*�_�!��TޱN��=��AH,����x�}~��g���8��s���)�V(f#���]��D�K�BB����1A�����u��n����ϮPግ �HH  �@��~����#F���;��ƶzǂp4�^�)zI6�zE�ZԐ�0��J��h����¼�J�_�&��f��I���%\aB�&keX�V���(���t�U�ݱ�@=p	�'���,�6m#�@���H�'";�#�D~9˘�W�Z�3�n�xv��yW����1�/ 3�K��� ����➘� �q>� �0|�8����g�@)v�z�Ҁ]��p��ϕZ���e)Dހ�>yœ� %����������܏Կ]u&�#�"I���!�_�	=����I0�&��G�:�Ĭ�}�n�d�	ۋ�P�>���9��ͻ3t����mGP=b/��p��*����潡���c�,�]��K�B�^�ȱ{(�H�u���nq;�P��x�x�.�U8�,-�� �XL��V����H'灠q\	o'9��1����霍���Kd
Cc��Y^�`1� �c��*JD�"2�M^�Bx����x�e@���4�G�B'��Ebm��2��RKp��fU��m�ٔ��bȺY-5�f�k�!]
m��M��ngȵi�2��#[1`$���B@C&]�uF	�"v�c�(ZR�}�"�['0����-�H��HY0��U%�XD)b7�����g�&c���Er��Kӑw�CS!HwL��aV=���Q_� ���&e�B �������VQp�=F��;�oz2�0a�����YW��oV��#��Gэ�������j~@����샖�܋q�bi��r�n��e�(�6%6�M��&%�Yc�@����2# <�]�?��fC��	�2�}V�j�y!�@5�s�����+�Ћ���f�LѤ�m�wģ	�"�Sl36FB\d 6����&�@�nw$��wG�ݑ��<�??���Y��
����i.owd�#�Y���s'�5̻����sw��?����$��D�]"�.w�������_�/����aE�+j�R��uvU�]�+�ZK�Jf�zLJ[����f���VV�Qoʵ�f6JU�M����qu�]������Z)�}Iw�쾤�?�����E�W�������E�      �   f   x����0�s����8M=;TBn�ÁT�؞��H�XPX[���q�5,՜=d��/~�4"��yT���&��RII�M��_��v`���OZ/D�ft      �   �   x�e�;C1��0�ǘ�D��������2L,�hC(���哦�q�m��/n����*�ȣ�� �<�9jw��cI�z�\�y����uQ��`�����5�^�j��R�%;)�C�ķ��{�1�;@      �   +   x�3202�50�50Q0��22�24�31�477�60����� y�b     