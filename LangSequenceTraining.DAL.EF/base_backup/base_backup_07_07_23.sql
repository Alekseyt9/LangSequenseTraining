PGDMP                         {            LangSequenceTraining #   14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)    15.3 4    �           0    0    ENCODING    ENCODING     !   SET client_encoding = 'WIN1251';
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
    public          postgres    false    234         �          0    20603    UserSequenceProgress 
   TABLE DATA           �   COPY public."UserSequenceProgress" ("Id", "SequenceId", "UserId", "StartTime", "LastUpdateTime", "Stage", "LastSuccess") FROM stdin;
    public          postgres    false    229   i      �          0    20607 	   UserState 
   TABLE DATA           >   COPY public."UserState" ("Id", "UserId", "State") FROM stdin;
    public          postgres    false    230   �       �          0    20612    Users 
   TABLE DATA           /   COPY public."Users" ("Id", "Name") FROM stdin;
    public          postgres    false    231   ;)      �          0    20617    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    232   �)      �          0    20661    testtime 
   TABLE DATA           *   COPY public.testtime ("time") FROM stdin;
    public          postgres    false    233   A*      �           2606    20622    SequenceGroup PK_SequenceGroup 
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
Q�8%-�c�ptI���ِ���h*��-���;��r��UM�p������Y4�@!+$F�/B�Ji~o�5D��@���uc^��\w�҇��XO]�-M��uѧ��h�W�!sܞ�d�rUe�}�c˚�/�:k?_�Q�����[�0�c0��U�N*�{�^� ���w{�V����l%��1Js�x�XҤ(�,����c�$�Ĵ�> �P��Vo�݋��\/T9�H�M���2"��9�W���{��33����]�����C�YQ��2)��h���$NL~��6[�= N�1�"-R�S�dIg�p!�(��*��< �t�T8�3��.���)},�*q��4����ܻ5G�\g����H�KSf���_��ƥ�a�I+�fck�����H ՉL(/U,��y�ߢWq)����5����B /��tuU/��9�9�y��} ��HDxx�?��|��H`��(�6w���ǥ�����6db-qh�w�Q)���!w�ld:j�Wq�����n�T�׎�����RI����Qi_]��Z��V�gA�IuO���ci�����->�];j�
y����8 2=����As#C�a�8���V:�=C'ml�iЕ���q�"xgJC~��4%��(I�:���F�3��_ oGkp�� �45�1�X0m��,%9���nw���D:;�"Rv}������T��Y�j����;�w��m� �២��s�=���
��p0�U�D��@��6I��C6H��� ��(�
᡺x�Hߩ#e����u��M�%y ��+��n��;�l�H��֠x�D�W=_v��\	��J�5��3��B~�P���d����mT~f���r�N�-�;�5�\������i���{2ˣi���N����Ѿ��ʬŽ��g]�IY�$^Q�EFC(?�9i7��x�=��2Vv[$�RO�e!L?�uʇ����5���������Nz�yw)��<��S����Y�t�,B�4ݗztݘL���Ye8E-j}l�:��q/���i���MG2��z�9����6|^���xm�)�v(��v���ɯi�N��֚Ni�a�K�{�:P��%R��3c>͝�2Ig^L�"���Ko�Mxȧ���G� �Áa���l#_u�B�)V�u�-�\'Wj�J�R���G8E$gN�րO5Cw�뗏�����*�ו��U�.��.�w?�~��h/�Ύ��~,�fN2қl3�	{�����%R5@�N��q�Ow͢�sW�n�Ճ-�6���CsqJ�O��E|/v����Mw�0s����P�v���A�xf��H�a*���t�G�(�{ef�(���g�˜��r`��W�0o*/�l�3�h*�D|ͻ4K7�� ky{y3��^�a��Wkʚu0����:���g��3_e(��<�,���� �	 ��`�ڣ��aC���=;;�b_ƴ'l�f���2����9=�_a��eJI�Ar�4�����y�P-�M�-�|���Z��t��B6[,W�B�t�`�D��4\n���$�V�(f�(�V��:s�
�^�ZE�s�j��u�F�P�6A��=���� �4oc��8gY?I��iΌG�@�B���F��]j�`����w���5��6�����%�cF���6E��ʦ6����^�}��F�Ē<�Z��/3���[���Bq�V��{��o�������Э�61F�`��F���4���B�/�ޭY�2�E�9����{ۊk����C����+\��`��sA*l�f��E��j�{Z(�7$���#(z;�V�k]��l�.�Ұϧ��<��_|�4#���#����r����}��b�q��&��F��>^ ��&)9z��KZ�?xL���B3�����;}:X�p����hZ�+�7~�������Vh@�`���ky���A��7<=m�*IH��﹃aOG2 ��")3Z��h��5>,:�	͌�{�9���q�^��i|�Vmf�R��JL[��0ݥS�����Q@1M����`�0�}��Ap�k�S�����|a�\�re����#߄�Kݩ�
u'��ռB�\����o�f؅���W5���	�K�"%��p�o��`��c���>���X�u��ʰF�3N2�.'�t��փ\���C���H^���|��:g:��B�<�_���̄j �������o:VTO��׬z�]���t~v��P3uW�{~����+��d)nV{b $�UH��ǰ��n�=�{c'H��뻙�n����G�n�`���q=&�]0��J�'�
���E��z'&g>�����F���B����n��ߜ�����Z�����9ȿ���O+`5�*�3qF�K3x0�Z���z�D�g6��׻V��~�ڃ�����^5O�\��6��S�XݯP�[��K9��K�
��(�E�d��O_�j�~�MZqO� �O�#��    �f��ލ���Y�i��p���A<��Y-k��\�J���zB^�)�hx�>ھ�T=�,�E��Tz���Yg��p��L!����)X��8���-�oٷ�,A}���苄�0�3�5�8AGw�!��2�7�G�o	G��ŀs�3���e	J��1��S:�'k�$O����Ă鱣�x%��߮�2���}�ݒ��.0�� �t�c����*į�N�ښ�%���אbT�\e��5&�o�%���9���)Q���%�M+�E���<��'�kT>�+�P�P�����E)�gz�
�s���D8�W#�XlP�(֨u��ďT�}1��:�gd��6��(szZ�����ݾ/�m�[�93�S%� �1w�҃B��z�Xa�L�d��勣,��ՊWt�n�lL�\vj�
E��z�^!KӨW�Jǅ
�xN�sKN1�g�Yv*��G^F�Xn�G�O��w;�Bt`|���>�k�����M�G�T�:��T��~�٬5�ҙ5:�)�7K�6�\���2[�_�6�eY��V��;VWc-E���1��xE~0����R4*�����I��Oq�������%������Ow8��ڀ5��_xWkæ(�ߨ�q�gT�ˌ=(�+ݷ��O�hm�3��D���2�{���+�6M�_�8K�y�!a7�S$�do����i"��1x�/|�&Kj0I���й��'�rLG��>>N5�.TҺ~G5��|�:?�-�PB���I���oz"7���]%��/��@�и^�������iy�zW[�H{#B��RC�>r��Cf�;O�}gN�%T�JX�;��$s��ȇ�����RLD�����4��H��{Ⱞ�}.�*,���(=y���7 �u��9u�hb�7����nO��t�/=�n�iqS�T2�
�,�Ψ5�&�+�Z�l-Ň��Ѫ��&��-,��A9��q�BC�� ���c��9�R��Բ�B��-d��ʑ�)�aӶ>{>��!���t��d�R�B�*�IOȂ8�a*�d�J��O��ز��D6�D���Y�\����H�:����O���p�.~��W)ݳ&n�P�h��ä�+l����m\�! �wz���mt.�\L-x��y#m��NS%��s��8�8��U_qTNߞo���9ȄϬ�����y���c��������ވ�����jԿ��æ�
&�����^�ob���ǩ�ӗ�q��A�f�Y�բ3O���Ɖ~����\=}+� �YZ+"�^�5{ٳ��
k6h6��"��a��=�ᶲa������[jv�����Ex��>,���p�>(�����,`7����|�^��U�B+Y6>u�VmxN����r�Y.��#@ �̜j��W;�\!~p�;��4��ܔ���';��4gՈ8A�ڏ�G���x� )m��ʚ�D�.�=dI�1)r(V�d�K��xY���%!B���bNW��,�-�͕M�=����P�k]�ǟ��o�V���ㆩ$(.���O��Ms��?0��tk=���e������Շ~��s)�V) z:hGA�M�H�1��j7L�Z�3ѩ�s��ZrM�������'\�D&x�۬��������ttY+O,06.[��!��^0{��^��~k �n������a�@���{���o��,��3��3q����̘����������/��W����-�ԭ����h��Ro�jl+�*�w��7�XE^y)�Q�J��SW}�.4�4;;(�⺊f�9���æ��)Fj�ǟ({De��ҹI���zz�|կ7Y�+�k�z%���/V�n�X�g�5�������ss�A<d�/FL"%�2��񳜃/��^�`�����j����։�h�)��Òb8,uvQ����;���N:%��.�Mڟ�'�΂����)ɏD��Ђ��,o�N��{QHj�#��Hf;T��t_B$EOf�Y#����{��@6������)!s��A����#u�n����w�5g/��OҖ}�]Tup�"���̭�p�r��=��o:|5���k$O,a�hJ�:ظ8����Ér�7�l������a;��;��䮟P؞��ي0���~���8oԌ�����4��<�]���bԓ)��@�9߬��|����P��@����,{�����-�l�T��ϟƄYd�	4W�[o���/�.��WnTrr�j�,�?��T�:9~�V����\>�d��܉d�/�5�oš#��������w1lւ_����-&�G�(9r�wHK�s�^�T)o4�r�Q#�v�w�jF+C�φf���G�Bv��js&N���%�D|�n�E����������!���)��f���w{�Jq۵�dh��q�>�W\�Q�X�Uն�E�<��n-�X�?Av#�y����.3S���$S��؞��@��4��
&E�<rb�Ȭ�����!wh&�/|ŕM�=��\!x`�ͷy��2��`61S73ԗ@��f퇙����k_da������}i��Gm�f��^�����&������.��[>����j���2Z)����2_/�i0_����O�Ehh���\��2��Xٗ7*2�n�Y[O,V�p�+Bi���ES��-��Z�}���2�D�9v u�w{��C��+��h4�����ڱ�3��3x���4bi'�=iz���O�w�_�~�x����p>	, 0*��dHWi�H]z�]���x��e�H|�i��a0V��q�oc�SzN�v�X��Ύ��'s`�_;nx�R�r�b�L_k��j�FG��W˖�o�R��c���l����Fr�WAʻc��"�>�p FJ�(J*��|t��Tsi��J��=y�n�,�+P�3��(��j�	>q^�gU����R݃�җ����ΰ�绣k5�*��[�IIw;����o����R�ܣ���D�j�X��gɀ���a��dHbm�^mVڶ�0l����Q�{�\���(,����j��wлS���sQ���q8}HR�;ާ�;�i�R#E��v��`���	f����B����䁔�{z��R�,�\�o�R��L�����w�3����ݯN��@���K��ms
����9kyg8��ׂ��a���ɞGW������C��<эY�v^�>�	�Zs��������� eؚ�����X�r>r��r�.��:=aZ�x��S8̷p6�q���I0g	��߯����~x�^iḚ/4J�|����Sl�kN��R��f�|����٣>�K�/���n���A�܍�HH�Tb��{Ӱ�^, ��
�����=}�����[a9���=�3��+2��d���=�.Ze� �/f�Yye?��J�v8oK��2,N�\h�����~.ncj��7�6�3��= ����F��K�aKb7QOI�Qi�{�ً��蟾��y�/`r����m;������wN�t��}_��M��Ylw�Ey$�
N./�����D�a��x�f�rխ�X\>��|��w��L�5��ƨ4�s֢���5ߟ���pT�?��N�nX.#�E�랅V���_��=���,�����=�KL��y��HRN�f��\��+y�Qqɏ�gˎ[r�N�^��=�����0�*'�|�y%X��N��](�|����b}{�Q��i81�!��%;:�V� W���s�<'}Q�n�{p�*0ڏ"�v����$�Zk����k��4��M0,>�4�ȫL��W*K�t���w�18�a��Ţ}�v�P0�[*��r*��R�h����!cO\�Lq~�f��.���98���u�A��l���5SAa���r�R�U�HVmN����2���E��FDǼ*���Ě7�8�4w\�'�����U�v�66��ހ�HŜ����S7"�����	����p��h���=�b�eR�x��`7�C|�v8T۳Z�y�f���9�Z�Vv�M/����R���
�Z�i�����g�%��/]	f�*~�fK�Wq?y�'�a�?��~<:��/�a��;^�^�0�J�DL04�!�(�¡�	�	lk�A�2��z6C��    n�3,'���������BFڦU�/1
���U[�*~��5���?F�+��)	ЄI ������xƀD��c�D )څ�e�����G��l�=`Ğ����Ňe�F�����h�Y-*�/mܐ~l[>��7A�UhY�.XM���c�G�M�z�[-W���Z���o4*�u%�^jVJ��W.��#["hط�����j�M���Qa�AWV��n�6\R���>y���!.���;Ʊ ��1jt�J��ڵ:��0�cY��1G�8�
��v$����ԇ�ZǋۓVl��r�_v=����E��x8;/3�
�&�`L9��O	�>j;=�	�S[�)���+�}Q���&N@S���1a$r���j!T+z��R���EP'���7�m|���\\V�����nq ���
r��T�^��l��&�zw�>g�q 6�W����n�ܚ:1-~�u��� 	KQA����'d��}7��Sy�M��9�A�J�N���������w�f�)��ֆ�>Y�^�[D^��>�@�4B^w=���~�%�(��1���Ѥ��1ö��g�O�͇� ��_�V����(fsN�Ҭ8n���ШTJ�B�PmH�9,�̤�������$�j�A��tŃhs�fMw^���#�Sax�;��?��~�
a�9�%�/>�R�؞Ψ��Ͳ��`��K
�H�D����o��
�)����M%�K����%��ك�G�a� �ԕ��&tڷ�a[��)DB�Nʾiu�xT�YFD��Nmn�<h��	�8��u�n����-h@f�CF!1e�/�����9!�K�Me�fKwƥ������dA�o��T^�Fwrq�����Gv��z���3�?c���5}6�}�~����^(^�h�7�nv�d�q��YU��"�6�����C�G��c�n�*1�8t�j9�n���y ċN1�C�q��4��z�B�|��=Ұ�$I�|�|�]���vtw�Y��KB;W�k��$@{��X'*p0�ќ��*�Y��s���C��\��{�d2�(ս�hs�:~�rߝ�1�AӘ�9��5G*�a�|lhH_e���[Nu!�����n��Y@�><�}˷1�?0Pg%HG���r��MtkĨ'^��eC�|߾j���l��p���L^s��}~�@�B�Vƌ�a.ɐ�m!���\N�[oU�G��;.�:�pz��)2�M_8�],�p���!s~�/S��r�b'g{8�X_��X|���}4� 6L���P�t���תe�Z/לb�Yph�坒���A��y�R|������Rk�Q�n��w���C)�>X��`7�(`:��Sn G��`���;���Ao��g
RC�����:����`S��B,���Ay�˭�%w>��L����@i.��P�s@a���Ix�h�D�\���[!K�������p������ҙx�Mw�n��xn���u8|�����2�p�c�{���laL���I�ԭt�EKqB�%.��MI��[c}+<�/��o�9��0���De�]Cy����n�[I�*��d���<�ƾe~,�w��	٩,ZACp�@�~lT�<�&O�`A���SKZ2�]���fW�����z�������E\�2z����n �W-���S�WN��zN��5�|�Jgn��7�u��1v���ҕ�
E�tw�D�a�c���(��	��7Ѵ����ۢk����@~$���RF�N4	�bN.��Ɋ�
��׀G'���
�D�Հ�0� �Vd�p�dκJ�"/���z}��wи��/#,��H�l�7W'%��ü�9Z�'I����*�0ʝ�6|k��]l0���i@Ҕ
{�kc�:�Z/�5p$�s�e�ZV�jJ�{�L��#>�v�^x����x9�qŗQyIk�4)߀"�9�e1мH�E�"C���U���ŷ{`
� ���c�U!
n��'y�
~Ξ�ytE-yS7@Bc�9ђ�B�����Zc�>a���l�{���b�t�F/�������d��B4�˖�,SX��9�,�<���^�얜f��u��r�q����dxn���䎊ǅz�����duJ��z�Tu�Z���Z�Ш).���L��SN��%T6Bu�k� C�����Mӌ
)�_�NWZ:Azl'���	oW�.���j�?F����I�f3�0�������A�n?�w�$�=��nhR�n�uXqG�E)�Qy$�hUͬ�����qT�y���\{�輕&�d�~�;��?p[mr�O���d�wƵ.�]���.GA�L��"fXL�(s�K�VO6�����{Z���ږh޻J����ݏE�+TB��Zr?A�~Lh�s	�<���_\��V��,�j.\�>A=�v;�)��>�,�i�,�^����I�Y���뙰;��N�ꓚ���'O��`�	�y�m+�D��JPAu��%�y�jUG'ɺQbt:�Ovo�U|��(W�f>�(��+7�d�K����G�g�Q��P�� �ҽhuZ]� ���J�4�TfF�t���$&b#Ҙ=J�iDy�ߐ���p1A��Rl����4����P8�1*�[b���	 �'#{�lq�V�5�n��hP��9r�G����:m x,���+e��V�����x��s����Ut��
����(4�o#����PHp>�$�J?)|}��A_�� ��3����BJd^)�i�Pp��}�i���b��Ƕ�J)Y�[�u���j�j}�"�%�K����m�K1T�7�Y;�X���E��/����>�~�!���P[��^�Lkbޒ�C�1%	͡�1�7Տ���`"R���JO\��n��#i�F?��.���~�|.�J��S��Y�w�^��a��\өU+�Z�����QH!m_p��/�������'���	��\#у�;�.`�&���(_���O̭?�~�^ғ�tx�;�vۀ	U3�KN��.��a+�n!�*h��h�H�zK_�-mp��!P�%N�K�����S�y�i��G�:���)^Ac�@�bh��-��E��{�GJ�A,E�=����P�ظ����z܈�龑'a.�/���a�k]]�	c�i�ǁ򢔜�P�-�k��1�X,_|����݊�9���ր�6�;�Y�v\ʖ�u�XrJ~��+��4�u�lӫ��\����9�c&�/?����@KRF�~�`Y����?���h�9�h���,��7�tK�<��Iؗ�d�h:���J�HK�7F�&)f�c��D��z�l�dkƚ�P|	����x���~e���Jڏ����,�s�'冰���1�/3?�s��^�����Z�������_��t;����&��u ����K���v��s� ���G\Q�L�����a^7ò)��	�	�B�X*�Ƽ��3�����^�>�����I���'�%�=\GJ�K�w���F=��T�j}���*5r 9/�G6��!/[q
�R�����,9ɥ�R�Z�U�(�׳Q��k  K^�R��j��h�d��q!�v+��kpஶ��r]�ZE*[u��m�Eٷ�xJ�J�.����\����m͂=�.h�n[1�~�U	ڷ�|	'�.4�i����;����7�ř��4CSC�+�=+��R����Y�3�	�w���~!���0��R(��	���p�m�b(3:ܯ���������B�ư�{� 0P<� ����j��G�_�Rw�AY�a{�$�-��缗u���O8�vF�tpf?-�Ÿ筶KC�w��}>��'�ʩ��_-�٧�F�Z�G�Z����4��ʈ=
;\����y}�V�b���y]n����M��AΏ������K�jCvI�m�Zs��IAE.���vG�ٚ{YDwm>Mj�eg���~��[=��sC��z�_+�*N�����w�b1�*պ_����[9BC�ܾ�A�O���9���OLW������#'9>b���(��a��='�~���N�mH�"�҉�� A���-B�w$�8P��^��]Q��M��Q5���d_n�(���F��G(H��ak@�b2}�Y�r;]�+���W�ȋ]��<��    ��~*ߦ��|�����0�sݝ)J��b[�+b��D�J�S�i�5�E	�R!T/.J�x��h4en��w��g���{��9�x��v�BmM�25%��V����5�VjZ�%�e�z�L�#(R��7�[Lݺ7�Z�9(:k��M��5G��ugy�>����F��~>۝�����q2^�� 1̐�t�A�ᴴ[Ls�9�����s݊tY�H�@��:4�o�;��<�i��)x�=(���u��>����;���^?MK]�A���s������$o����{�<9����8��)1�k`殃�z	Zs�g���n��>���b��C�=�_��Fg�+1���-���h���2P�b�>���h��^��U� �/�����:U�Vsʥz����~9�հ����!j�7�e�M�������sD1��.�Ĩ*e%sqd��\3g\`_O8�֪h�$��=�4z-�w��E1b��������X(Oj�G��5�`�������-�o�|�oH�b5�
�mȤfH��_�i��w��{ n1�p���j`�s�����Pp>��X:�$a"�,�a��Yi��*�����R�� �����=� ��Y�b�Dz2�;��N�nѕ��QK���ALH<P5��p��m��MKRr��;���F�HK!i�%oE����a�J>0י?�z�R��{N�Y��{ܥȱTt�Mک�R�N�ʑ�����W���
�Φ�z=��
�c/��o]�:�/�f07;�/)c��Ӫ�I[k�/P�9G5=�>b_#֤n�z,��Tq�)'�o:�h�A���Бf0�΀5�8�������P:�����T��s�w�?�L���#�e
��iW��.�pl�L���m8�t��-��:�w��ְ�wų����I۹�z*<f)	0������ų)�w_僭'X�m�Ci/���H
τ@;��wȥiķ�ZaD���"Y45Sd�{�����h��Q��.G�,��{
&�3�P��nyow�x��c3�xî�e���k�����2b�O�&��Mn��S����۾��N-��oX��?��=�&V��lū6*��E�	��N-[�;~ͫV+n�~[�и��b�}g>�yd�]�@I����h����KD�^�[	��hv`����s%E,�TR��X���`�(A\��1�N
<l"[�A��z��A�����ZȮPэ r"�C�X>����P�#��a��Q�n6���>��4���mK��
�E!���"
3� ��$uh����ޝ%���[^
�������`�0S��6o�+���}]5�-�Z�7ly_I��w��K�k`���N/a�8sD~�l&�i�6C�,�ǘrn&w��q�&����憐Q��#z5B�&��hN9ZdU��%A�\�*�"��%\y|6IjE�B�l�2��aР�f&��rO�m�Gݳ��V��3��a�v\,6�5�Xw��F���*}�k4���n�Y���p��.^G���GϷs	�U��v�d�S)�$3��W��7��J�g��'���H����ә�|}}NVI�[s#�!���=��J��v�$`%���2�z���;�p%�$n�i�&�ٛ7D���������
�袓h��P�۸ ��5?"��5ZH���s���2����Q/��"X
�m���)�A}B���u&���	b"Ş��7a��U�tDQ�{���է٣=m�����P�CKePA[N4=U�:`M
>����F��w
��%(��=�T+7��F���+G�|HA�3�����F�:���6��0~�������)���J�&9;bKD�	��3Jѯ�L\a?��_��g~�p���r������b�(�9�<���J��cu���Vk ���U��8�ٗ�wֽ0�z����_��!HA�z� 3���h�~�)�k�M�6����z)�7��)
!�޼7��Ѳ_k�����н�[��C�ao�nz�V|Y���A/K��OJ��E��6=Q�{�����m�.��)vPRD���4᫤.��N�~%�1l1Zx��`�MX���ė�m{����0���I>����bb�K���B��˖���S�<�^��l����F�T��G�W)���p���:��X`"Z�(�Y���` 
���t����r-�;�&,P��녪^�����>a1g��j3!�q<�a���
J�?U݅�4�MUX1��+-�V�$�!i�t���4{�T����J�AΏ�J���C�7��ݟH�Rqnn���y.�L��;�����;(g���G�	˖&�����E*��x�Ԉ�{�L��̾~���q���Vܡ�O��k�=���74e*�.)�(�e�iހ��ZPz��
f���li�30�3?g��s���i����[��N~��3�.���kz�#
.��d�6g}�Z!��ڶlk>5{^P�H�E��M]w�׽����΋���sh�lg�7�F"��B	�r �5mI��wS1�7G��j�ܝL��MX�Ĥ��ay��w�Ր+�^r�g6	�?����^��-���-��b��9��
�l6[%��m��ˎ`���_���:!:�:���,�������Y�a �؟o�gѓ��]#�E<�8�$�LA���p�s�:���n�S_g�	]w�o�t��I�����҇������Fr˄�5)pYk��\&y\��"����B�B0(8���y�p����ć�7�k}�79��ں<�,yl�B�X�[��sFD�؇`%�z������c�o2b�s0���$����(f@�< _@�v��B����Cd��=��{O�d���^{�0�8�CU�e�
9�kmq�a����T��?_v�b��p�Z�)7j�z���~)�ҧ���[Y����(&�q�YHF�̒�M�e�M7�д�g�f���*�e�L�\CI�1tvg.f�+�08�zr�?Ҿ�E��G��̫�D)!N&-̚�H)���C�P�q)�L�J��q�����$�3�1/�J�y҅�,���i�1�O7QgZt�M�þ�s�~��t�}��hE�Ȼ�,����D��D��w�a6��:�7m�q��Q%��򰀙&��{[���q|�d-[9}Ā�a{"���_4�a:�5����t���(�OW����6S�*gYV�%��]
C"kI�^4u]��>?<3�|��mw�z���b��ud �p�^@�U5�}nO	���b��^q�1a}�3�kz��>��i��ˇv�|�[S� �q�`�,�%(���I.��N��ɫ]K���Z�g.���[^?C���K>�"���qa�]�Wg��>��)�����nym_3U��L
>�R�1�v������!���Au�ThЇ��V�V�V�/?��dk��r$l����D#��&�<?�(�+���k'O�S^�:d�,<��.���K��[�8D���x�/��?��#��w˵f�ifKԋy��+��$(�|�+y^9�|���M�)�����S/���G�'�)�,��G��娈A�s5��)=���n��z���,������r�X"��yAa�FE�
���y����X-�߄SU�XϣQ�Xn�A<V��!��H
�G*{c2�QP��J-�B��AB�)9@P�+��nsU4+��k���t�W"�^��H�N��Xx&�.�e6�2&q�`�_���	��-�5�����j��º���yp����-o1=	ƃ$�髬 쇘��H����U���f �HBR��=Br�j�s��z2��A��;ÿ@#�}�s	�'�tA�6�32A�=6ܚ'��A��4c�"�{��!h�q-9��h��D"�vf�K8�B2��e���Ur�=�t�~}��0\CD�T����f�#�SI��Z
�L�<��Vgc~�B��-^��gNMN΍b��J[*R��?��I�bb7{�z�_SDʞ���j���j��o�G;�������4!��B@�)Sf�3�r����0˪pБ���A2��SO>.�6�o�f��x�Ì�����bP�r��]��g��]�E�4�    ��aH���1��i4f��i3�xƣP�rm�$X�����i�������Q���V6���+�p�?��>��2wܨ����s�J�)� d�x�S�@����n�H2{n�O���g���3��a�p�)��L��U����y���q��,d	+if7��V����1�����)ܿ��z��c�%����o�h45&p�qp�m�P0S𱆐^"܂�eo�V��7l�-�m������Q��0��~�R�ۊ���B[u�V�ffp� *�9�D���]������}L��BU7��y>~�1�����.'X_KM:M>pKۖ�v�	R�j|�>��/�b�N����Fst�h�E��im�6�O�I�ʓ�^����kK�����&RxȌJ�`�G|�0�2'�zoH��K�1�_?���<�Ms�6ӓ�G�����E�Rʻͪ[vr�,���F�qK��S-�n�Q��9i��C�$Ռ�>y��иޝ��yx˹i��~�dB��؊�9���U�fg����35��	&T�9w�x�3'���g�X��zȪ�F͚�SѶ��G�|Bd�g��%���Ɨ� JQ^\^��SL��r��+8;.�wc!3�(-�ϟH7��?S���tØ���i+c=��G�l���_�w<c�@(�N��3�X�A�����$���J0dJ:J�]��Ʀ��6�/�k��]k����n���9����U�&%8\ZUO���f��̇h��i0	6��9s&�'̠�j��{ہvo�g��G���rwDki�f�V�ۃ�M�RkT�FéT�M���sN�V�:^�k��^��s07,��27ꓧ͍�IK�ޛ@�_ө��a�*yZZ�m�7�/����d[�>T���q����I���`�ul�*��O���c[ض�>$����KbM��_/O��=�$������(I����\�q�o��g��9L��O��i��d�G�g���a�h����JMK4�O�٣�ɨ��VC��P�mIz��"���R	@�b^�Dg=�2���� �L�1N����aj^ڮ��_��ܰoQg�Py�\��s��
�5i=T��<�k*�ߋ{A�tt���>���$�����6�w9���������G�L���Y���V�!"̻i���]�8g��k#e����� ���>.��8W�n�)�4�L�oU���ޖ����If6E?����u�e��,���@;�?��۬e�O}�-�[T /�T��n>�7*�"u�j4�~"����pB�N���J�kƚ�o��>E�!|��Ɉsy���?I����a>��G�Ov��,C�Kraxi����!�� ���k�wkʤi��¹�xf]'#G_���ʭ�Π/��������zP�b`?*��P��a-����b���m3˒��[�&�ݝ(]`_�o@K���*��z�ٜ2��s���^�;�I�L�c��O��*t�#׎���C5O|�����E<ḁ��M
z�����52���B� ����G(����z�~���Aq�s��SD���rpe���Q�M���`��8GP׳Gۥ���'7qV+�[��
��e�����w�����(<�*��sM߭U�U��-֝���:nխ9n�Xɕ�R����������>;�8��8����u��]ϙB�f��A�9�UΥ?��&&I��)�*�'sqE7��v3�W>��L�`db5��je!��Ik���0%x��<�ҍ�|�?���2,��톼D�S��q�A�ᢄn��_�O�{TwE���1��1�n�5�
���� M�-����R��E�G/�����Y���4|t<�702� 0AH�(��<�����}�4�8櫐�1^/E�D��kI�P�w�������&" ���j�B��5I%n�K~Y�������-�xs`�P�c�Vs{�*��]��\ �����1�@�Z=��e���6Tҏ���s ��h0��%J�c��'�#�]	�+����K�g	���x��F��?g�<�+��ī�"����&j_A�E�1��uh[�K~�-ל=���k�m�\��h�z�Po��,��&��n�0��5�d��(R��g���IӞ�:�	�	v��|�t��Ĝq��n]�ϙ,�u�=��iY\�*ƣe��B9�`�dhS�����&� �����Ѳ_IS�p�X�C���mp�$���}�Fg��G��:_��5uZmt�����ʰ��YA�l��JP�;F�u�@l��}�Ҏ���n�o�4��:'C���B��MM�����S�������?���4
�&h�@/9 ;�֙7 )u_f3j�|n��������k�#���Kv=A���5�p�AKty.�E�sdmҏ0
Q�&�8�7�2���|$1�w��C��4t
@�[w��Q��r�fΩ�
H�gkN=�ϑ	�K٬��d+G����&�Lz0�cʥJ�ߔ{i10j*=T-�>�l��	�bۉf��
B�h�Tihk��͆��nGɏm�2��Z�⼌'�az�=����|?�<t�����T�_���-��Ӟ�;���Hm�ݣ���d@X�٘Ń�💫2�z~�^��_J���_l^ִ.lǊ�g%�i0�]�W�m�DH�y�ZDnu�3S1�pQ�?��43���:S�ԉ{�7ĠVuԞ.1?�'#n��6l�Ւ~�2�=�E���BN��ͬZ�m���7Sd�����=�hܻ��r�Thfs��Wh��ْS���Shx�J�Rq������;���>���!��)�@��R�i>J��otJ����T=�Xr����'��ɳ'U.!��ʖ(�B�O�1Xpz-���c2]��p�Ki+dC��ś�����̳2{���б�6ۇ"�*�>�v<!��N8%�Y�R��G�x��L:'`!�@`���ˏĢç]$[�C���T&�kg�'�����k��;�H�D��yd�e?(k�I6�ZI_@(�3����Ņ7�Nޥ��bV��`�ab����5�aO���]�����Dz����F"���Յ�j�Q�ֲU�Zh�����N���?��Œ[�B��ڍ]m}t@��1�Uo���$?��8��|�{�a���3s��吒`�^�NYŝl<Z�N���{�x\����ʍa�%��h��_���͟�H.�\���N�~���M�����#��w!��;��$�;5c
f������V^cY�p(�ƿ�й�
�t���F��m�z,��V�g~�o�������Xao2

ߣ&�,'#)�h��i������5X��^(�	{V���.��>�vK�i�?�hw�����M�^]��'ɰ�R�v�XI����}��`th4YoN�s����t�c�2j�tAe}�j������3��W+['�Y�b0J�/�@5͝,�0#*D�ڳ ��t���T8��&D��}Hs���ͧך�J�J���)O��G�	$}s3'�VXb6���fֶ0Y��v��ދ��z���w��R�)f��^�w*�j��7��l�p���P�=za���]9��P�d�|�(��r�d���5���i����.���L���u�����&	j��}D�iH�Ռx�I����I�NpR�X���«�u�p��`�te!�#�j�!��у�՗�]!�m[d���ˏ��K��#��q3�Y�dyd�L��f$�{%���䩰%��e$G4�1E䞏�#7�2�\4�����J�D.��_3)�m>�.M6��@Yxyn�9�TT���Ӱ�4�@.
m�U�$��%�l��>�G���6�y(��PB��I����{'~��k3������XÊ2T��S5]���t�"q"�M7iU�_�4�V�����}ؽ+ls�(N��L���� duT���^�W4<�e�!� ��_~2L^f~0u�G'훳�q�oH���D24j�|�qndMO�)��0�{H�v����#����p ������Ou�\(:�z�s��bɩ�^�q��J6_ʕ�՚�H�R�d�6>�R.���W@m`�-�����`1�I�y���˥{��iӚ< i�1بɟ����=Ҩ�l<uF������Vծ�Vb�`�:,>�S*Ԟ�u����O�    �,3��GU�!���]~$��xϢi�0��H�d�Ԍf.#�F�*���ìG(Ґ���Hej��9�-ըg!Q�x �Gr-��M��0_�3\43�8���ccR��>YP/k:{�vq9�C�$�z�w�w�E���V���0��]R�R�R��(����L���L���(�&V�L�Q<�s)4Q�۵�raSU)UQ9��S���E<p�0ҜT��X4:�φAD1!�rw5����;}� �yi�Bh�R���`c�@2���n4-�������{�'��9�z5���Sk�N�Q�z�z���5g��v�i�4��9liRUm �>:�*Ms����3�4\I�Z�KӠ6��W�ϊ��i Xg�[FO�ȉ�&��D`0�wJ��~4�'N�ix�S_���^��wN���
y
u ��ȴ.��2���$���=䱤�{�������i������br�b��0�(Bm�2��W��������D��g�?�P<53i��/��y�d��?U	f@]u�;x��d�|$
�R|3z���q��|ɢ~S��v��d�H~ >�_}�������_���~��D�5�A{���Q�Z�6���S��.�f��Z��p�F��fkͺ��i7{功/4�N�Y��;�
9A�J�+�\#_�5�+J>y�~�^�C6����Yʉ��E[1t�6ֈ�g��ڠ�CW翁k6��$j�u������:�x�A9�6*7���.羻ޠz�����ȵr`��qH����j~p�q<���@_�6;__V<n ��������C�N���p�U�8�������E��x���M\t�����b^��@���~d=��u��ˇ�PA�Jf��D��.Me�����p�g�1|X����>"G#������{�2�����jq	C�y��<�w0wܤK:+��y�l֋5�Z1W,�.�����[heG���K�߫�t��J��Y�C6�q��A�m=���d�mP����T��!��
0�rsM���)��o)l����lο`'�I�_#m���u�+�� ���Y�zL�
3�*3�Y~r������{\�>3
��g��,�����bl�i��|tG�`�������̐;�p���J4�J8ΙN�k�nO"��������"K�'V�)��<����hu:ha���Nn󒁷th��!Q������`��=���%���d-O�7��wd��s_���%���n��+6�N�m4�k�
�KN#[/7rn5���#��f�/�ڑ��=�W~��P�i��Y�����G,+n
�^!����>ry�&#�����&r�l��?t�����ɨ^ �!3}��������$�>NWv~�5��I��?s �Br�p��X�������_c6����T0G�#�I�'Ai�n���D#�rH*�x����F-HFA�f=���1�������ҋj@�9=C�־���tV3��Z���!ק��}��v+%c@���X|S�7͓��5u�q��>7N�u�5����tm/	p3�P�߮/��D�L��!y���+nm��g�/�gf,��Ȭ?�S2��ߔ�-���@���ݳΟ8�y��m��+�0�Q8vk�j)��;�r5�K�ZY�:�B���z~��֎ p��V�L�����r��IۙM��|�D�9��{DA�?ySˇt�n�ɒ3�*�$�F��Q	��T�R�L:�B;'��@��f�h��,�����2z���g4To�m�wkd|�����,�ϰ|k�w J���F�˼]� ړ8�yyz/�)�GBʻuc�TDq�������� !��`��[���:O��=O�X�e�E�}s���K�	��D9mwxzf=ݑ�i�~�e\"�ͤ��ws���g>�WR.����u��=�ﲕhp]��t�j�{��5���չ.�'kA�.o��?�t�n��|�k~�:�fNC���e�n����q����H{��ʵl�qK�&�͹J1ߨz^�p�K��gx�� m?6>>$d^DX��ݍG`��T�*b8ˡQ_�N��~;X�s5�N f�|�O��&O���%�g���
���}^������J����@	vݫ�mmȶ�"C�x�#����I�3�*c�T��� ��|���0h�R�����9s��Hr.<@���@�K�8�n��(����Y\��NCѫq�OQ�f~��z"%1��['�&ޕ�B�"���N\xV9���)����M�����������H�6��#�������[���}�e��&�M2�7V�����^9v�f�Q)Ԝ�_�������-x}���K�R#�=R)xM�nv�&ײ���;^�����pR����V��&BE��܇�)rp�=+���&D�Yе��P�j{*^�x	 %��|������KzcNT�,����������� ��Ƭ������X-4�%���8b�p�{n[?�@���G���&�����[��1^�)�ݍ���F�y��@�����r{�>v%&��K�me�7�g��w7O���h������iWeSC��_��\0�4Z�N*��ڒ6_Ɨт��fŌYȜ	������=��C�]���w�������qާ���K�}�R.9�l�urY����l����� �pe�Ώ�J���g�N���W��M�V���sጹ74��/q���$[=��v#<���:�q)��QA
C'�G�jH�|rD�.���������l����7AC�����K]�5I�`g˟}Z�5�,��Y�@�
ll�ƀ�z:����d���nkt!�K_�`����؆�̻�7%e�su1��� ���qx�}n���a�pk=~�*��)�z%�1���۪v�p~�^�R�(d1縅zө��|��
H�c��V�o�[�?8`;	G�(�p�f/#-3&��X3c����dANt���_�ҝ�Ig������v2Y��М?_�+����w�Qz29�B�̉.���dpZ�΂��݈��F�@����PAL,��7�P2�����ǡNxH$��z&��f� c�y|� �TL�|�a;a�"]P���t�/)<d��%�����7���+�^z�+yq���Z�GKxx~7"��H�B�zz�����	�h �Qp�8q��(Q��	nPM,'I�����ǈ��o�HU�])�&;5���������'P!��'F�l>���]4�� �`)�`�a&B��G̓lq���a��\��ޠX����K����pkY�+V]���Z�Z92���]h�ۿ9�0)@�q�:WU��|��\M��A$yP�O��O�cD*J;�0��	RY���I�j���*\�͐�0W
����ߟo�P��n��nA�嵠p)�n5@Iա��'�e�d$w(��<�F"�V�4���G������B��n��|'{Z�|c���6��^�a@���Vq4v�~��E'/dߜ
�W��s͚�Z4=_���c��t���ζ�2c䑺mH�5��Z��9�g�Hｫ��x�_rC�qyI��<rF����J�xǋ� ���Nܶ��.]\�b����[]�5�՗�=H����2LP{��t"���i�.���H;��@gZI$�_3����z�OF�HXzS�Wrj,	�����������R�8Y�Ղ�y��8v�����L+I�N(��`֘��^Qcd��׫�
.��z�)6����N�Y)6��b%_���t�']����Ғ+�����Z���b3���'��M��J!-�*�#&-��h=�S¶V��!8/V�u��n�k]XU�@�Z����J�~}���t�
)�ϻ��Z�L��ֺ+׺rUU�궱��^:+.g�^? ���]H5�0���
�\p K��7�8*��+� f �-p��`�Zg;���2�����.�*�����J�'�+��Q����r�&���t|��+3�>MIG9Ld4O��I]WI�sߋ�Jw��ްfA?�K���^���V�'k�s��R��s9ǫV+N�k�j![u�Br$9��7�0���&D��[1��X�Q�CH:�g�zbQN�!�%�V(*�T �  ���'�\ٔW20��G�y~��@<)��V�5x�?qE��Mn�v/(�Y����W_��	&-�����	�L�+�.��Pѿ2cm�� Ƒcz����A�l�c�["O�z�0��/V�@Gh�Z��)I"�N�JG�ŀ�!Xؤ��FΩ��X2����x[kA��!w�_)r�.J}DS����vS�&�7��}j��� ���/@�$����Zh��|j����_��,�m�j!G'�WT�O���䳕|.�o���Q��w��tl`-���F�G�i�N�ݔ�#�_(��6�=7����7A���ɱ�㟙��U��W���F8,+��{jH��2�ޯP�	W�����x~��.���Λ@��]f+��^C�A�7��fZ��qkc@�@5<�4F����i�m�|R�s�p�ѫ�`�K����3#�T�e��{��tS�pLt�2d��K.)��]Lz8�f�u [�p!p����7��1�V��k���Iޥ�IVu�id&��I�,R<��6XD��[�)��	�y�E��e찂%�A�O(:�s85��	 �CS�_1,��#4]�'�b9T3ӽ��k '��M���-R=�Y׬�)�Ai�j�o�:������Z���5н�<:[=�q�b�i�^>K�m������ u����G#�����q��>��<�߈]S)�}j:�fWjQ��K�;a��{)_�É*�U������jt�=/3?��� ��d�!�s�2�_9�N�9���<U�!�sY�i;o��>=������H�'��:�I���Y�B�[9�KZ3-��!G�Z]]Jd��Qpe_S:?4&ngR3��&*�����b!�q,��q�Ԡ�/�<�4��&M�m�հ�ohJ����b�v�(%���J&�k��O��� �8����?�nk��\��SS��f�T��d�l�G�>��f:��y����Z���5	��J�R�e��(�jp|�^(�����-��#�Ų�U���Q��ۭb��D��Z`�R�)�2���!��C�8 M�n���L����Z�r�~Wz@t�i��SR���ńGw�e	�rlǎx����)V4,��Y;����!���r���W�����<�%�d�m|Mg���".�^��Yz�)|��[{$��9ky�����P!�1t���Chx1��1���u�PHX��o��%!b%�wG�G���r����B�d��-5E�k `[Eٿ�/1��t*����R[��B+��S����_ #one���JV�9���~w"{��R"��p%�;הt4��=�:*�h�MEYJu��#�O���f�E� POD��v}�̨}�BDj�tG,�1����CmM�ث��|��u
n  ?븅2�|�\�f�Z�*���w1��[�Ŷ<li���C8��If�����9v�z	�U�ge)!�É��j}9�C��@B���~�{5�3�{NJ�'�RG4�(:F3ι�)bf^�K��vnJ��� �xG�����M��r�Y{�Q�B�po
��cy#�<|��������j^�o7���#g	��5֓L�/u�F6��8�1�����8��w�&u:�Q
�!T�/�	W���Q�*u��z���LY�Gk�ozdɹ��G���u�-�P���]�b`���p��\(�!pi��w*եX��85�k��. �<p��������4K��Mh��Png��h��z��v���t�Cqs$����1-)-�]��ϱ<�:�|��WV�N봓^G?�o�݁?wS��E�s}� �E.�^@�#���E	�T��,����@�T>��K��W�;%�NP�Vu�͂縍�W��)2�T�<w��qܨ�R����z���&�Dͦ���o9EaF�;H���{�\>%t�[N%�hfz�z�r�<�T�U-���ߐL���OC�E���z���_��_� �I�2�k���c���]0]�I�����"��7�2��}�+�k'2%��;5!t�/3�����˃b�$I��n�R�6����?E��	�3Ns�)��o��!�M o����F�@� @	�JXs��Np�+h��et{���;��I�Z	����S���3�x�f�|ٍ�'��rq'
U�|qN!N�U��Rǧ[![�l�+�1C�KE���bpE��PD�<����lUF퀧����1{��펗Gu׭�z�)5�*D�q�R�ɒa(��z�m6����yy||�? ����      �   F   x����0��T�܃��[�K�_�wAL�UeXW���6��`�X����
�6��J4zB�""?F      �      x���IrdG�D׿NQ��H�1�,���}뇤��D�'eRI�$�H���������Z��lF\ܦ�4Mr��ܝ�!��w(�G�FB���U̴}� +��%s�Ԇ�qY#����Fu�9����[�M��߮��{��˶����;�/	�핒�5y#%Lӭ%�<���ڮ�����F7=���d�$\7S�k����Q�R��q�W���S�=yk�Έ�|6%w;�m%�z�fK� {�FH���{���j��Y���/�+��L�d;3e�9;kzk�s��R9�-���M�F$u5SV�&E�V��J��k�,�ZV�t?i�nr�Y]��M{P|������n6�����R��z�n����F���8�����9�:�nk�=ݑK��s�.ޑ���"����%�s��ۥ7�\�kS�?��0�-�7_.��+T�p��vD��HB
��G����G�#1R@��X���v��0������jvc�D������즾�x�X)���L]��=������-��53GP����&�m�0�t:����7[.
l�"���Ʌd�>�;g/�hL��l��X[� v�g�Wi��@��-���r����H���)}$w�6]��W���('2�^��4����O����h�|D�����&Z�Lc���R�~e�[��T@����7u�o��~�G�5 [/P�Hx.��2,�݀���}@P��!}qޭ?+o�w�O�(ayh˃Y`�^�H~�6���$+�~��d?h�ߢ�A��M���ZԘ7u�����ͥ@p��J��[&/ɪP��{�3���·K4�������W��r��IK���e�L��U�5��zt�+V8�F#i�#h^�K�G��I,���*ȮA޻���X�����-�i��d7-�-�P𵯾W/��{e�L7�^�9�@r;��OB�!��������������\�������J�Gs*Ǻ�����=��W���$3WDN-iF\	x��^����{^Ȫ��2�0���l�͈���|�������x����s�5�R]n��H��C��oOb�	���po���ƍ.L�T✦n�[]I�[�^��;D��EM����D��K�[tf�����P��
��҂6�%�3h�tQ{���tT�1��-Ӏ��C�b����dO��ls_f�&o��:�Ȗ�%�FuUc�t�L��e']0�R���U�;�yAú�����k�J%��v���B�{o=-�)̥5_ӠsΞ>�s�R�1�]�t? �ؕLC�%���O���!��Yǉ_�5U�#�%>ɛ+�*(��ق)�$���M�s]�a�\ϫ�g|�!�Cy7��ţ�*-��AC���̸�@p�6� �nAu󯜏8z�� G2�*
dX�c�w�}�K�ߤVSh/����Ԯ�|C��������ʳoÛ),�էy�g��Rml��k8��������z�裍 �3�/���"5�L$v`��)��`'���2c�$��K���Ӳ}���ӹ��v��~(���v�-���%.��s��+� (?�۰lw����J���v���v�`���N���\��&ם^�+Y��f���6kW����$WMŕM��	��h[L�i��4J��jZ�$�ZG��x����$p^'�zj}Ѓ��n�昑�ҵ{rc�p(iH)�l���A�ir�g������%f����b���`ʛg_�Wu�*�gJQI��,ć-����B|��i�BѶ���	~7?V<��l�T��޲[�EPa�i�We�L�Ӛ���T~qG�r��ij���U�2�*�9�7*�.��U��6����*��Ъ��q5��9G�Xq�88��!4c�]?���&lptx�~�Ǟ��4b���Oqީ�@[H�!fn���+����F�����e�V܉��(��⥬���E�&������JFJ�����#�=Sjm�%*]`�A/!jwl������/��p\����{�����p�I��{(�dL͵K8�;��ڒFA���5d�ğ�WM\��p�1b:F�'�c��u�~�4��p��<+����tj���Zk�C�{H�(�6�c�z�#`��*�;0�t] �v�(��R!��~7�{1p������19B��F�4C���@f�:���g�?[W	�2�/�`9i桇o)�ǭ�蔾����+,䭱v��"J�yG@�W�#�p:Rݢ�M/j�Q5�>��F���Y"{7��|��� SS��p�j��Is�b֭��e���:a\+֎�bl����`�ն�Tw#Q�g'N��ʗ�޺�uC��T�td7V(5�D���ˈ#)tq��q�݉BY�z�^�|�����}�j��4a��لSvxH������AD4A�C�]�%����P
[%�� �4��4܈�|��3�e�7�U�B~��TzYO��4f@,JH�9��B�n���b��iȷD�ig��#��eץ:�ҡ�dW�V�m�ӛ1�y�	b⒤�%�z�y���)gí��)�/I�Y�E�x9r�v�6���|�a�bf��<� m��x�Q|A[�:LqЗ�]t�!$��^��T-�/ý�!�P{�%�Ek��`�Y�>aW�ٱ�)1�ӟ%!z�-��c6Κ��}n�%J,1>�����������[�*�������0��Utz=`�����5��"﹖=�F❕�4��xm��l��p���ŏ���|Q���,l�y_�Z0<����k_iҲ:CF�;$͓��O���U�Tj��nz�3����t��&h={�i������S���
���q�1I�OS@�J�<v���b׆`���L����g�A��$�UF/p�Qf���y�A�C٘Ԃ�ݩ�%�Z[6鬀|Į�]�B.��D
����O�o�P�^#-ڡ1Sl���|9/�ɝ�R�'g��#�=G��ǁ$w�)~�u���|�!> F��D������k@�ΫD�A{Q�߶ ��ㇴ�x�u�c���r}A�����x}r��سK�����.BA���3�Y��؃_T��~6��z_
ݑ�W���Mv��}��`^��Do�̌:f��}�vq"�cc�?���?}�-ܢ�_��}Z�D���Mrz3��z����b�q�#^i&(R���	����=bK�����e��a&p��Z\�[���X/	&i�)�#5� et����pM/R�B�6;��u�"�iB���½��yG�
���d:F2+JZ�nAl�,����t�:�>8z���8�,�f��}�>��-�y�ݢc��2f�v3��.[ӹ�^_g`ٰfٹv��5���P��*v'n�B"fu>S�		yު�Z�W#l��J�:ePNF��r��x魺��TּM�zD=��7��2��ԯ�A���`j�ӌ��9�9β��e�c��6_�.H�6���N���<����х���u��QH���HV��c��hq�Y4⼾�p��G�7��7�Ao�� �M��ͪN_r4�u���t11p����D\Ğ�ǋ����>µ.�awUT�4����|�t޴�\ikq��	Ww0 ���dЪ�(����!�o.!�$�����!������N���)4��Cwck��Ҡ�BF���X�<BW�@�hSQv����R}n����B���� j�"��=��==���u�	��Iqv�I��i�֕����+�'c�"�
������ZE�K��2j�BC�X��0]wm��a������T�5�GN/������to�&�\��m+�ۓd��b�Ax�8���#��3U�s�C�7Ġ���>J��po�m���c:;�Nf1}BY��g:����:�Z�w��ArNF�����=� ���^%C�N��^t�?1�D�\/jl��VI�v!�:�(��6�ȼ#Zۺ?�A�x��
����CK�CM���:q�zc��D�µ�:(qnc����ћ7�jub�==��&��cl����?�p��Q�&_�Ū2ԫ��*���8z�R<x�7�z���{zɂ�G9K��p��KI韝�� :
  ýn����x� ꜉.�F����v�t�B鯬*-���oX3ũ��M�o@�n�����o������-�F�8 C.�n*�H!��g4�
�{n�~n���Z��Bvc��y����U��h[q^BfdL��Lu��`�8�^�?@}����3?ukMd`�S�[��g���Η�}_�S,��:q@`9�l�]LO4�"l�_9����(z����F��܂ި��=�Q1��p��K��S��1ju��E��&�K�EOI>6�;�h��ӉH!����㬘 _�?c��-��h߷p�oc�n0t�4L�a�R�����(	֜j�i^r��,��j�������+4��ɽB����$X�4p�)]Y=��{��u��&��C���J2�ԲZ�z?�i/����B-����(����<5�(���B�
`���5B�:��ǥ�Fa�L���8��J���2��w��MwY���4�"+��P���Ñh?��H	�>�������Ð��C����"��jÖ�M���(+u6�\Ae�PcE��$��Gި[�|�<�}%]=�k�#��g��я.�Fc?�f�t��j��D
jfj��D^��fu1��u�4+��,����O���ݵ�n%@+��:ȋ�P����9s��,�#���X�Z� *XP���UqHc�sK����/��E	*{���Ɛ.q�$���u<�Z�]�:��X}�#�\/O�q�!�r�\g��\��"wG๘�j��>O��E�O�?z���0E�WY���sp/�?����	vÌ�[]�v� �E]��h۞�-��&��=
�in~����YbF"��լ�]�oj�*T����U���/�'�9��u���6��춍�u�����W��T���}�>�5��G]�t�UA躂n�������t�b�-�spҚN����Ė�u�`��j�����-�:tq.Ž/;�ɚ�5��!V�W�U�#�*6�ZD���c{�jO?��h%��Ny7��0������#*�df��P�sz�೑�v�����F�[q+�fz�+"lO�=��7j��O�һh?�� Ԩ+�pq�*F�9�1GΈ�c�����
�J�Ĵ
"�ռ.����9��~^����Y�H�,�PRY�wqȼFS�*�ŃR�uH7>Ae�s'D�&�#���v�Pny]a*�&���^�\܎���Uo�Rх
�,��ξ4YGɕ�0��S�� ��=D%R��`�T��&}QgO���m�~� �:����!��3d���z��z���a����A�4�|vI�q/�<��z/��I�ç���r��V�>�9�D@����#.��ku�-�:'�,b������>��7>D���9�(Yi���ҷ~�a�����5�C5����4��S��Rm^���f��ɕܩ���}q�s�{�녃�G�(���Q"2��eQ���!�8r�j�,[l�lԻuGoOA�En_�\<�+�٪CѨCp��������h�:r���ˆ�P]���kk�{����{���
�/�\j���g+��6���\^�-��,~�=��,Q���X&���ؠ�4n߇IE��.��5=�����W���Ds[�H)��|�9�Tb����t^���m�=L���s����=���?/`7ݯ���s�UY\�������X�+6���g�cl�E�)��C?5_x�	�ӫ�������m� y+t�F�����"��ЍHp�v.��=,��l�I�+��Xjy�<��٥'!fIgv�T��m���5�^s�Y��W�.o��)���.!;����S+�ýa�R��٠Y�jDaIYQj��aa5q�-u�ĬkPt} #:�+��! ��(G���ѱ߿>�;�Lx`�Y�vE�6��В> Q��KW�P���lȦ��t2�Q;��ܘ�t�7y���N���羦��<�Qr�~%m�ح*c�%�(���p��;��{~>ܬO�!3��/^ե ��'K�>� 2��d1�	�Io`7�bC1��$;�z��9��c�r�7�{"ܛIC�n�3e蛄�ƪ{�k���.GJ�vR4�WǾ�������zM�ƺ���ks���v�z�WL����!b_K�T'
s�������IE�-t��=�s+�Q��A���s��/ڛCf��#�H����@�Q}�6��c9�ę��6Y�mL���o�:R9����ho--��%%r5usօ��XwH��k}�X_��4�)F��tWb��hߪ3�Q@9�j��ӫ���I��h�,�H[�z3�z���5+�]�Y�τ���� ��:���Y��Ћ�>�����
����>G*A�M�Nj#�D���'k�קPv������Dj�{,���י����ikX��y&*��h�B�v 2�֎�j������`'��;0C����?]�}����M=N�
W���'6��h�,��h��v�A�ݾ��x]��B\�P��;ݔ��I_�̫*w�>����-���x}'�>�n� ����
��Y�fZr:���1}�E��٧P��y�}���\GF�NVT>�z�6u?$��C@A��z�o�e��P�z5�����b���>;3\/�g���n����������
�K      �   s  x��Z[o��~N~�@X�-@�E��h���`�v�OI�K�#[�,z)ʍQ����o-���(�E�☤b˩T���Xr��-R�
bj83��������Q/�Y2tY+�5Y7��\��JˊV���f�jY7�F�*���JrM�25j�b��T�Vy���g���=�=�ۻ;�.m���7���n��e�V�wj�8�C�O�����r���6m;�ږA;�������|k�����}D����K~y�F�OA�����|�n�����m�zl��*բZ�TR-���]�����̕nw[�c)��@1�Y6f���}кբ�Ӵڝ�W�M�����)t��{������ݕ���v����6}Ҭ����;���R�l��˗�D��">w�SX�1,��7�6�[�r_����u��X��cP殮{K�/<��3P�/_/m�_��C��Ő>�O�q�9t�<!���|��6��{��[��b�G��e�bx��l�p7�j��5��V��V��k�)�fU7�54������QB�&�0��v� �o����x�:~� 9��l0firM���D�E<y4q��Y�|�(�}N�Xp�%^�F0Q"#��.	� ���S7O��򔜹i��F������L=��$r	��&����|2�	�s9z�x�,�I�Q�z(q$�%������0���h��,��E��%F,�.��*�({��b�z��qlJ�Yݟ�Z�C)�I�D��n���~�'T���q\L�7%c/����$��S���ψ����%��'��Q�M����$���C�����m�� �q,R�􃃣���I$qG��=���Lz�tF����a�M��o��8v�N𦱋�1��ݫ�FI��>�y� ��qd���@�{�%�NWo��@�Ct�C�}�.�W��\_�dHH� �s�,Ix�U#7����@�7jW��W�W��m�F�-T��f��Smx�:\��0
�鳘�J�&���:z�
�O��[ qx����Q�-%PĆ<�1�;O�|��`�����#����ZN�� ��V��#03����)B���@
@���6R��zC�&G�z�s7���mu�hZ�PQ�l����5�!WaG5�JUѪ%��¬�J���&��fK�������0�E���,L�uYUU�i��(WnXX����Cp�F^�����/`�q����!d"?��L�+B-�t�|4=Pd��s��}��=������$DHH�G��rqO�v �(��)U��|���|��k��E=Xi�N�I0��9�gJ-rzŲ��C���
����H��	LE��	e`QW�F�_/;ȑ��$m��ϳ��B��}W���؟�`��	�#���1k3����)�d���:��6�t;{���3t���ֶC��G��n�*����������#�{̿^��3�@�^�ȱ�(f_�ug�jop;qQ��ox�*�M0&,.�� �XL�ߖ����H�'��q\	o������Ɍ����%2��T�4+n�� h�T�`�%"L��6+s���ٕD�h�R UOT�#H���{C�X����6��4�^��`[��庪�n�uE��
�aH�B���A��:�re�m��2�b+����@P h���K��#��0f�Y�.v�EJøOX�=6d����^��)d�	�b�mU2�E�"v#�x7{�l2檍�`^$�_�$�'��4�tGďf��Y	��cދ0aR�-0zF�!0z4�o���͝��F�� ��!��N����U�9�j)�o8�~^�\?߬���4��O?h9�=���$�(g��J]4��`SbS�D��S�5��n/S�s����k�4x�.c�7g5����1T�T0'l�/����Ih�ɸ�{a���@��A<�p,�a0�1e#$�y`�>	�|Ė�G��|{$�����屸_��$W�w'�Osy�%�-Yo�zK����?�0oo0�7��������ӓ��q{���D�^"�c���p~�˾�c��%����RQ.WU�U��2t1T.*U+�%8�=0)m4��*�U
ǿJQ��F�.WʚY+�TU7�{�)���=j���z��E]EU�TX���.>�~Q�#������y����E��Ç��H�      �   f   x����0�s����8M=;TBn�ÁT�؞��H�XPX[���q�5,՜=d��/~�4"��yT���&��RII�M��_��v`���OZ/D�ft      �   �   x�e�;C1��0�ǘ�D��������2L,�hC(���哦�q�m��/n����*�ȣ�� �<�9jw��cI�z�\�y����uQ��`�����5�^�j��R�%;)�C�ķ��{�1�;@      �   +   x�3202�50�50Q0��22�24�31�477�60����� y�b     