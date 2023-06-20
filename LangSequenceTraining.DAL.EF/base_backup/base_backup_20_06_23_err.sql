PGDMP                         {            LangSequenceTraining #   14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)    15.3 #    N           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            O           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            P           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Q           1262    16384    LangSequenceTraining    DATABASE     �   CREATE DATABASE "LangSequenceTraining" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru_RU.UTF-8';
 &   DROP DATABASE "LangSequenceTraining";
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            R           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    16385    SequenceGroup    TABLE     �   CREATE TABLE public."SequenceGroup" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Description" text DEFAULT ''::text NOT NULL,
    "IsHide" boolean DEFAULT false NOT NULL,
    "Order" integer DEFAULT 0 NOT NULL
);
 #   DROP TABLE public."SequenceGroup";
       public         heap    postgres    false    4            �            1259    16393 	   Sequences    TABLE     �   CREATE TABLE public."Sequences" (
    "Id" uuid NOT NULL,
    "Text" text NOT NULL,
    "Description" text NOT NULL,
    "SequenceGroupId" uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    "Order" integer DEFAULT 0 NOT NULL
);
    DROP TABLE public."Sequences";
       public         heap    postgres    false    4            �            1259    16400    UserSequenceProgress    TABLE     5  CREATE TABLE public."UserSequenceProgress" (
    "Id" uuid NOT NULL,
    "SequenceId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "StartTime" timestamp with time zone NOT NULL,
    "LastUpdateTime" timestamp with time zone,
    "Stage" integer NOT NULL,
    "LastSuccess" boolean DEFAULT false NOT NULL
);
 *   DROP TABLE public."UserSequenceProgress";
       public         heap    postgres    false    4            �            1259    16404 	   UserState    TABLE     s   CREATE TABLE public."UserState" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "State" text NOT NULL
);
    DROP TABLE public."UserState";
       public         heap    postgres    false    4            �            1259    16409    Users    TABLE     R   CREATE TABLE public."Users" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false    4            �            1259    16414    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    postgres    false    4            F          0    16385    SequenceGroup 
   TABLE DATA           Y   COPY public."SequenceGroup" ("Id", "Name", "Description", "IsHide", "Order") FROM stdin;
    public          postgres    false    209   �*       G          0    16393 	   Sequences 
   TABLE DATA           ^   COPY public."Sequences" ("Id", "Text", "Description", "SequenceGroupId", "Order") FROM stdin;
    public          postgres    false    210   �+       H          0    16400    UserSequenceProgress 
   TABLE DATA           �   COPY public."UserSequenceProgress" ("Id", "SequenceId", "UserId", "StartTime", "LastUpdateTime", "Stage", "LastSuccess") FROM stdin;
    public          postgres    false    211   �p       I          0    16404 	   UserState 
   TABLE DATA           >   COPY public."UserState" ("Id", "UserId", "State") FROM stdin;
    public          postgres    false    212   �u       J          0    16409    Users 
   TABLE DATA           /   COPY public."Users" ("Id", "Name") FROM stdin;
    public          postgres    false    213   �w       K          0    16414    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    214   >x       �           2606    16419    SequenceGroup PK_SequenceGroup 
   CONSTRAINT     b   ALTER TABLE ONLY public."SequenceGroup"
    ADD CONSTRAINT "PK_SequenceGroup" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."SequenceGroup" DROP CONSTRAINT "PK_SequenceGroup";
       public            postgres    false    209            �           2606    16421    Sequences PK_Sequences 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Sequences"
    ADD CONSTRAINT "PK_Sequences" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Sequences" DROP CONSTRAINT "PK_Sequences";
       public            postgres    false    210            �           2606    16423 ,   UserSequenceProgress PK_UserSequenceProgress 
   CONSTRAINT     p   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "PK_UserSequenceProgress" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "PK_UserSequenceProgress";
       public            postgres    false    211            �           2606    16425    UserState PK_UserState 
   CONSTRAINT     Z   ALTER TABLE ONLY public."UserState"
    ADD CONSTRAINT "PK_UserState" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."UserState" DROP CONSTRAINT "PK_UserState";
       public            postgres    false    212            �           2606    16427    Users PK_Users 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");
 <   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "PK_Users";
       public            postgres    false    213            �           2606    16429 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    214            �           1259    16430    IX_SequenceGroup_Name    INDEX     \   CREATE UNIQUE INDEX "IX_SequenceGroup_Name" ON public."SequenceGroup" USING btree ("Name");
 +   DROP INDEX public."IX_SequenceGroup_Name";
       public            postgres    false    209            �           1259    16431    IX_Sequences_SequenceGroupId    INDEX     c   CREATE INDEX "IX_Sequences_SequenceGroupId" ON public."Sequences" USING btree ("SequenceGroupId");
 2   DROP INDEX public."IX_Sequences_SequenceGroupId";
       public            postgres    false    210            �           1259    16432    IX_Sequences_Text    INDEX     T   CREATE UNIQUE INDEX "IX_Sequences_Text" ON public."Sequences" USING btree ("Text");
 '   DROP INDEX public."IX_Sequences_Text";
       public            postgres    false    210            �           1259    16433 "   IX_UserSequenceProgress_SequenceId    INDEX     o   CREATE INDEX "IX_UserSequenceProgress_SequenceId" ON public."UserSequenceProgress" USING btree ("SequenceId");
 8   DROP INDEX public."IX_UserSequenceProgress_SequenceId";
       public            postgres    false    211            �           1259    16434    IX_UserSequenceProgress_UserId    INDEX     g   CREATE INDEX "IX_UserSequenceProgress_UserId" ON public."UserSequenceProgress" USING btree ("UserId");
 4   DROP INDEX public."IX_UserSequenceProgress_UserId";
       public            postgres    false    211            �           1259    16435    IX_UserState_UserId    INDEX     X   CREATE UNIQUE INDEX "IX_UserState_UserId" ON public."UserState" USING btree ("UserId");
 )   DROP INDEX public."IX_UserState_UserId";
       public            postgres    false    212            �           1259    16436    IX_Users_Name    INDEX     L   CREATE UNIQUE INDEX "IX_Users_Name" ON public."Users" USING btree ("Name");
 #   DROP INDEX public."IX_Users_Name";
       public            postgres    false    213            �           2606    16437 4   Sequences FK_Sequences_SequenceGroup_SequenceGroupId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sequences"
    ADD CONSTRAINT "FK_Sequences_SequenceGroup_SequenceGroupId" FOREIGN KEY ("SequenceGroupId") REFERENCES public."SequenceGroup"("Id") ON DELETE CASCADE;
 b   ALTER TABLE ONLY public."Sequences" DROP CONSTRAINT "FK_Sequences_SequenceGroup_SequenceGroupId";
       public          postgres    false    209    3238    210            �           2606    16442 A   UserSequenceProgress FK_UserSequenceProgress_Sequences_SequenceId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "FK_UserSequenceProgress_Sequences_SequenceId" FOREIGN KEY ("SequenceId") REFERENCES public."Sequences"("Id") ON DELETE CASCADE;
 o   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "FK_UserSequenceProgress_Sequences_SequenceId";
       public          postgres    false    211    3242    210            �           2606    16447 9   UserSequenceProgress FK_UserSequenceProgress_Users_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "FK_UserSequenceProgress_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;
 g   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "FK_UserSequenceProgress_Users_UserId";
       public          postgres    false    3252    211    213            �           2606    16452 #   UserState FK_UserState_Users_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserState"
    ADD CONSTRAINT "FK_UserState_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."UserState" DROP CONSTRAINT "FK_UserState_Users_UserId";
       public          postgres    false    213    212    3252            F   �   x��ϱm1��4�-��")J�%����p�r�>3R�YA��2�����|<P$X��B�Ɂ�Z �h��>�W��1^����׸�v���4^�ϼϵ���~��>�q��=N�Ŝ�Ś쫊ADJ
�U�rm��۞��M��$�8*vѪ�-!��긨���O�M-��|�$�y#.. �k�Ӟ��LJ��**XI���!5/���d�}�SnR�<?c�'	�      G      x��}[oYv��+*~�i�e�~�Kcr�t�� ��n�S��ʓ%u�ݱ�>����$}&	p�CK�M���t���kU�%�	L["U���k���V��I3
��V�z����q��+q��H�I�Y��M���t8������?��V�����{d}��[-�g�����������b5_����o�յ������%���|u/�-~�v�A��J���j&>�_-ş���bu+>�_݊O�����7_���.W�ռ��.Wo����g��T�K�G?�_=�V��,����3X��ƣ��_{���-��{�"Z�����������������L<�|�R�{�?� /Wk��-���u��=�C�g���x��I�y�9_���ߋw��.W�b�=�_v��V�ѳ�>T�[�vA��'��`{�Ezǅx�:
 ڭ�:~�q'��~.>� ~ �ݮ/������Jw�ΗΙ�w�x�~�K�E�#�0�?�~�������-�����؊"��՗��bX�6�1�8���a���O���w��N��,1G��O�i������W��8;���	����I�H���;J��wқ��,X�,��}�c��E��ҧp5���p��8���k��\��B�1���/'0�]z�x��A��Ɠ`��n�x�G���k3:�9A�K0�x܂/�e�����o-�7m�#��
h\[X*\�w�:���D[������|G�c�!�`��7�ux��(vW�%��<^F�?.#��Zҁ������"���us�Hc`��D^��{I5��[z�\��!�����J�T�(~��D~[�ʯ�ը�j���F�Wٯ�v'j6;~�ѭ�aX���$
à�)���^�;N����=�kdi����	f��ݦܣE�� yFIzP(c�0��%��||� �8��?9;C~]nP���x_-Uy����a��߃^'X/��[�6@5���6��
�C��p��u��r+n�K��NJ}K���!	>�/Pyܓ�'�Ry�����N�����Qɣ��4�X O�f-/\��yj���e���#!���;���� �~����û��ɻ(��b�����O�H����u�G��01�[q+�'���(�8cq�p�D�m4��8nX"&��g�oZ�=�6A~�5����K�-�'߰~����@�7x���7�%Va���a4#1c��X�G<��RM�@�ʄ�A�U�s�5/�����x]@*^�ш�܃�B�|����M)�S�y��&�_������SX�����G����C{J�z��P�.V��%�ZlaK��1pVϑ�������H`3�e��ْ�^�[���l�y�N|�N^Ӆ�xl�
`uE��_�W k,����@Io+��	�\I���ė���Q��"
*��~\iu�vh�a�.�Vk�~
�&.�IT�'�F��wr؋=q���a2�X�"�i��=����[��+T"_qk��*'m�wuTD�}A\q��$��*ܕ,
�R���x�,�.� ��L��}����|��,����d8S��gd<\�?����;���>��DB�(�
�3.ý� Ӷ]*"��;3�g����GT?xA�� �ޢ�.��W.�x#�?�tY��r2�
��oP�u����5��`��P��Fq�{,}p7����Uw��I>%Ù����9��3�u����'�H|o��x�`p0g�چ����4�HQ�������?l���*��}�-�;�9ߡ|�M�A�6{���x2<F�{0
���^��{���t��x%p��W���%c�5�I�ʓ�ԃ��V/�yo�a_�Q]�+���W�D�Z�����%�~��৬��E�%Z��V 	M��$<I�� e�LT�r_��
�7�ΰ� �5�����R��/Қ�"I AR�G&�7�RΥE��<��HR��q��J��_�!��o7Y�Α]x�fm?��v-�v�f�]��a�a'����Aԭt�9��	�X2��a�R��'%Z-�iTw��֡��e��yv��]�+�1	zZ�.����6��/�3����m�'�n���df������8|�s���n�2�<���"��jP�,s�;�r0��_�r��/t��~}����yj���d�$�Dj����q"�y/�O�p8c��R�OR�z>/Y$]`8�Z
%��-��;c�y@ے/����q�~��^����GPÓC��.�؜pWNS�S��;I*EǷ�q��ײB�E���n�����+�J3�
c�C�(BB�lq	
|?/iˋ��E~�M���`rX�No:������S8�Ia���q6�0ވ����c ҁh����gګ@�Sp�A��go�c:��d4����T�7{�pڣ)�|��{��
�$tg��GI���g{�໗�A�(8�a��w����3d����I#Ȱ�^����y�V�߬yIǦ%�
Lo���a��\����F�ɌX�G$�c�P*�/ΚY�}���i��~R���f��7"p�I��qݯ�ڕj�]������^p ��!�`��`��r�z�g�J�����XP�gz�Zأ�v�'c�'�.Wf��Fg%,=vI�+\��wڼY��5��=�۷�9�ݢm��8�����7�FI0N�:O�d�R5�{�D��?�hQF�K�XH�/�Ȩ�ȌRA���^K�ř2�����j�+��9[��/T��Y�f�E*�*"w� ��G08����q?1)'���'���{G�$�C�%����G=����i�d�y����ټ���m|0�sI��;�p�Eκ��mz�|o^jq9|cb�0�Jb��$�[|ӝ$��ep�.3� �hy>�
/e|Q[�t���̸�9�'���Ws��=�+0��^����2qG�#�� Ibb��CG	D�xp��)���L�| Y��O�=#��C���=9?�+�C��f�ln9!�K[w�a�|�xw�uQ�9:7�ϘY��{�wE���;�uS��p��Ľ�dt4FVFs�5��9Ǐ#a��"����3f�9���\!V����7��\� A� ���(�4�]��p�Ί��x�*�"�%����ly��yGW
2\2�,�������*H(���-��j�e��=�N~4�P�@tK����1T���*tG�Q�3~��eH� 6#���ދ����	�~5��~��4�P�~���f�5�ͽJy�+L�JY�)q�\�뵺�f�W��j�S��fkMn���ibW�X�|r���f���;dP3���:�bXd1�p1��$�ȍD�m��c�ҟjYv����.��	J��g��0�����	s�u2��݊
|��8���Ss��N�J�V�����j^��R@Ȍ\�bT��d��&e��l"
����>^p�^���R�)���'���_P��8~f�42_�`����#��OǇ�틘�<ŋ���R���t|5c�0B��h�.Y�ˌfE��d/Xe�a2ᜍMa]G�(�Nsq3��a�`�\��[!es=Jhi�w~n�@HNO�,�����'Nt���\!�M������VR�/S��m'Kf�bA���J�[�r��̑k�	�ցeD�o�q���jۏ+5�v;�f#�+��Ө4����O��pp ts���&PJ���%�����G�&�5���P�e%nl6CoȬ�z3����!l�	�x��X�1k@�>�֛�+������i�4 �H�t����:"���绢�D;Մ� [��2�~��E�g�I��:� ����}�Ui�QrO�	���r�^����,d%�i[.�ww�ֈ��}�'C�O����S�=����q��	���H�"Q��x�ga+��-إM_�,���9{��a����sh_s����[�������p�!ڝ@��Vs�^�8�#��V�˒�AF����-z�	M��;�r��d��9�?B]2*j    ��R��M�_:a�[�s�K�݋�序dՀ��u��zNvA����a2\:m0e$sSW�θ�;8P�|a���i�ecw	�Z6�Q|�fd[.�l���N��Z䷒Nۯw���jӯE�v�Zkt�� \�$i7�n�o7:аQ� *��z�Rk��AXmW�@��S���߭Y����Im2�u�5C����6?/��v%�[�]�^��Ux��u�i�.�NGB����$d�zcg����艐�]��ţ`���S�i/N����1ʜ�=ͭ�{�r�Ws�ҹ_��\�.˸P	4�)�|�q��"��iWR��`&�gI�I�H�Of���q�(E�N0K)�$�OO)r'�`�TH�`{�7�(�!���`�?M�,�K;�Q{�}�ZF�Sdǿ$gcI���4<�����U�>��e\e��|Y<&��1y�����ӏ"����ѕAk��	�#������8�a�����ʜ��L����ľr�\�$oP1����B��g$���O��)V��qL�s��E�j;���l��42�*�H�?)M��w���&ٙ%Q�5O��B��+۱,�J�lT�j�?����%��,�M��#�/�GU�9��_G}I���W�E5^e?)ǭ�Y	�������͊��߭T��VR	���^?�|1����3~��hi+F"s�r���e��\2���\_XYa��x�=�XcFX��<S����S��y��#�;U���-4����R2�J�v���K�WJ��Ҡ� �#"{�B�ˢ�绚c�
Fe�b�ٌ�`����67���Bs��<�%P24P2�㭜Ɏ�j�d�zA��k,�i�b�s$�]a�os�RN/�?<z<�)V:����>�N=�\�'@���/��� ��n �G�d���.~e��[�d�;IЫ>e���E��������ߋA���d<I��E�	���=�����䝛S���p?ӭ�ru�O���hI��%���-A�%\gp���Gмf��G��D�������Fe�����XWc�Ԃ��ݹ ���-���nEuSu�S�'Q�]�+ը�כ��V��l��n;�������/����������W�h1��\`���&_Y�1Yr2f�����\Ȝ�:չj�@u���3�&�"�w��}��>EoPl�'c苡�u�/Û���������J��
R�,�^�d�B���B��J�>̤��F:9KuY�Y�{
���l��k��.F�Bœ䱾�~�����-���7���(�y��3� o�;��73�Rb��W�B��@��k"f[�Ɇ}��`�~���\<2�q��ȧ1"P�b���bi��~�]n����	�Zo	��m��0�'�N�Ѩ�{�����?IuXm��F���NÛ6:s��A���;��-Lؙ(S��	z�}��Uw�pWaF �
U��>p�B��=X���3Aҡ�~ȕ��
���Ƥ]�%ω�>؊��uX\�<=�FAoP�EYQ2���1�ʢ��O��T��r�=Z�($#�
�4d��S�aD�m����)��mv���a�] &#]o��|��z���=�=L=$�G��.*W��;�h2�|T@	�ś�cd���L���3ʱ5��Q�_I�Yv%����b*�0�\1�&��(�:I� �kY��0s�B�x����*^YRa�ɹ���:�U,o�ZB��W�Ch���D�p�#�G���x@�oWJ�Kn�@������֝m����p:���[�ĐǪI���F+��U�9��^�J��V���˘H	�~��l��0�V��r�ݽ�~�v����V9z���v��Mh$�n��L�{���Υ� N����z����QX�r�X��3��.�����)ʙ�$��;�C$�5�x��tb�Ĩp(5�(� ���\f�Tp��ᕘ��
s��vɉ�t'Ꮓ;��Hz��q2�%B�y�>��4�Yn/�[�/�B(�T��̺O2�f��-��nւ���H)�겢�|�]L�%��t��f1�u-��R˸-��Ѕ��%Wyc��"��0�E�7NKOF�����Qr���=���Q@����P�e<]2�� )�7���ò�������d�*�+	,j!���0<�.�̾��"���8�L�f9�ö���d�a�~��AK���P#��ǘ�cu4����{�)�>���?ʛ<���C*�^x��0�StA/�%�m�Q��R�,J�(����+&��aˆ��cz�Q6�SO�Ñ����d�V|��6s��"&���%�o#[q	w��0����`nff�#�cm�qX)�%�)���3����֔
>����;�Q~f���r�R�BU������U�~S����R���y�q;�'��j�ZI�N��A��CYVˑ��JX���Z+ٛ@:]��i���$�$��K���-G��t�*C�Q���4d�ʀ�ɷ/�b�ɼ�BDb=f�]E��M��&;����<2 Ab���H*�S9��=L��)��x��2�vu���%g�N�d�n2�C��@s]'��s�Dn��$ǹrv�SC�T��+�Ʉ��H�yll������;ц�t�u�XU�ߢ'~fq����eK<�9��n&����߂�%�[y����c�}�y�goA�qd��cbIO���ĵE�nNU���d�Wr�+�P�i�͹��m�*�����G(<`���j8ط�~��[�'��l�Ê�J���8n׫͆��P�n�o�+U?��F�	�����^ĖL7?(\���ߝ�P�ʔǆ��ѱFA�5?�`�6w���+�"���̶�����S��W�i잪pݚ�H��B��Rx��2f����0��yx�n՛f�`�T-s�f�NY�����g�P�Q ��:��QY���OFۍ옕��k89�a"G@YR<��>��PP��
]V7<�-�\0h*;g.�`0�5�� -��c��"Fx8@+P�ʈɩUGn�s���I�%�1T�H�Cj#���Xd�摂-�������Ͻ[-��k�����/���>!�a�L�DQ/��c/�q���8��/trL$l���Bu�j@j�^k��U���ƻ��v�9?��8W���{u,���HOu�x�N�jk�B��qoB�#�~�	�����J
U	HO�p(��!�3�+Z�w䒭%�*�V\(��T��`-�4�`ٷDg,f1.㥧���h:����mw��9z��U���Y���˥m1:le�l��{|&9�2?38yl[ie��g����~ &_��ͮ.�A�q�Ta�����z�Z���u�M�~��i��j5�z܌ڵ���j�����=�-��t.:�Tml�m8��2�֎�s�Eͅ�P\��k�c�Ġ�n>����oh�@�>������(��Vo��%w1!$��wݟ��:��W[�\l���V�<&��P����sY�֊�.0f��^>���U�����z>�'6�ѹ�&	"�1�
��'V{�43�z�%��U��֬mT�1�rC�W�}ib�8�&+��ew8�8};��n����9��D��jʅ��2�0��_^fWv�������R����*92�JWr����U��ģ��8ܔ/�[Cf�Vy��+kBA���o4�z7�~=N�~=�T�0
�~�u��Y	���I`���vɦ���{�+��P(�9D��Iި~)Q(�q�Հ�� ����~��ޠ1z$��̟�4���ˬpoV����u��v;�g�'A%�5���7�X����rZhݱ�FҘ��[��o�6����f�d�M�d8���wH#W(Pa)ՁV��^bፕ5�S����JމK�H����1!�(9~A����
r!|�ߒ�^٭�2s>q/t�?�;~UDfY��J��L9͋r|X1ib�e�E�nd���e���N:4b���gq�W�R���8b�����⹜��'���>�L+"]�|��:��M���2�K��qȘ���;*y_��b����=�dSB�E�k�Q��N|T�js Ũ�r���v�L�^޸� ���ylQ���Y˛�0"҃�    ��2�G l�P��@�_�i�g�P���_�&�zԎ��U�k�������8�*]�0��y��*�\�X��'��+����s<�����[��v��Ǌu2h&K�.d��ܒI��U��/GB1
S���Pp3���_&�+w���P��$#�NA:�c�%y�*ţK"\����n���]�BY��.00Pb�gh8L�⹐�J�}!�5-EL�=���3��ე��m�����V@�F���g����u��7^�Sa��XҀ��%��\�#+�/W�h�{�t��ϒ��,jLg�Mq��R�0���J=2�w4&��
WI^��I*��)L��̂}�k0S��݈pt���� �(� �+Ɓ �9V��?U����J坹Iw�И����>ҭ��'�a�`���fA1��)�+wp�}����0�_oB)Z@�|C����9�����<�{C9?
Dݢ�b"82s�K1_�Q7�Hc����f0��h��V�E3�)h�)�3���f�R	*�_���3���n4�~ܭvʭZX����ހ��9-���w�h�^f@����3����ީj�Tg$�)�:�꩔�VDy��t���m{��`L�s��D���7ѭ�)wPG�ʺ<�/�X��0�p��F���'��i���
e�$!������Q�K�`���1�����D�9�x�ȅ�f��a[��mt�8��Ѯ�^�'�5��<����v��m�s��s���9����?��ɗ*�|$
��wp 7�v!�g	�{4�R=D5<��	���U�� ̸ި�#-��ΜY��B�1��\6s�ǅ�q!եJ9�vn�����:ڰ�?	�o"\?J6��@?��}���t0�FI2p��=:Xm��nޡ�� z�c���L~���1,�i6���H=���(��ƥ	� @-K&��l3��ɬ.�e���lG:Y�����m�SŞ}<+�k��]�Qb��Z�ExA
�?�ź���T���V�7��߬T�~=�V�0�~�Si��a3����J��d���io��x����	��;,˕��3�_c̳�>P�M�����������QeZ���P�J]���fǚ3Ts�l����ykF���@H.���c�N�������.��P*|Kƅ1a�MάsUdzŸeΎ��g�L����(D��VG]�T^ClEW�PA��Pd��␷l���R@��q�$��C��#� 17��Q�q�ݚ�Aj�eG7�v��A�[/����ZV��m�K�l�Mn�Iu�
�O�"�b��c�\=B\Q���[dl�N�1w����WW�h\�\!�Y�l�g�؊�lu�������@�=��-�/�G�.K���d@8�!����;Cqi��b��fҩw*�Яa��+���rM8w�8��I�\M�97�����`~����U�3Y�Uꥧ<����ֆ��ɸ6�bL8�Cg(�϶�:e"�CJ�׉��~5��.�Sc�-ǜv�dKx|&��߱vQ���>�U�����7I����w�ur��y��ѩ7�EO`.� >
�dd� ��>��1�˗e.�c)!5�'Dܪ��t8u����hS��`�?�*I��I=6�x�Mc�E��S�*�Z��u�L a�pnGA��q���S�	��Bч��_t��M��gē�l�J���턷'�q*���I2��R��]�m�{���|���y��r�"�|�ش�J��'o�v�̸�ʭ,vߋN{�qC�� &p
�j�(����h믍�-���A�CuY�X����h�v^�ur�-�w/�ŏL9�S"+#j�U�9�Aj$�dЂ���~���t�v��H8��˝V���Q\�w��8�r��88���Q���]��R B�k��� EY[�4�H6�-�rgn�R��+^;�^qz�d"?�d��+�̀�~T���P��|H)=�,��,k�{�N>IvҴ��4���{�A2�0��	B��e.He�dm��$���k���3�&�qk�E�4���9���s�F�:�䠷�����Ɉ 3��A����}�7H�B����Ɛ�th�d���[M��ZXAg&_UA�i�Fp}n$�����/i��Ҳ��a�;lm6fʧ��UX�Y55�Q��yf����Z��%7�)ʊ0%���O<���:�!���d��w�.��~E Ko��
lN���Y^�+���y��w(k�2	!��aW�-���%M���dԋ&%/�N�sL�A�FhO闫N�s<Y���	�AB�S���j/M���ٜ�M�{��f����� �(&%數tG�cˑf�� �
��M:d�(@��� ��]	P�RaEY��� [[��r��Y�+#N��H�4�-��w'�Cɋ���뇘'���܎��V�3D|��C%�t�f#�w+�j;iV��d�nO������x���b`�)Z;�&�͹v�e�%p���B��76�G.̑�;��Q�Q�t��8��)��׸Nk��<D&�@���DG�R�io�Cإ�Rk��MOd� ��[�2���
�P�j՜k0}����W7D��V�g���E����܃u��2O&���z�*�uʬp/i�0[��-�g"�>��RЕ� E%���'l�E���1������Y8G@���(* mm��f�	偧�3.�f��
�2��Ԑ��0'S�d�Z��Ħ�̪d%�x�rM�gFՍ�?����-�]����Z�S)7�4+�_o�"?+5�\�j7�J�'�*�(Vb�՘�|?��U�@�P�h�w���A����h���2��]��I��{��h�]"xhF�J(.`EI�p�,�a��-{��S[���ܭ�2�e�>z����H��P:,�z��p8�K	@����>��,����J�&�ߍ*��\ѣv�l�Fua� ̭�x06�8�"��a��9���[��:�_��LGCA���1L���s�`Db�wҽ��")ƀ6�٘%K��ʙu�����g�:N=\A�������ϳp��L=n�O(@�79An(bĘ4�y�]h2�q���)!�a\�s�l[�m�X�(@4u1�y�G�.r���a)��v������w���hx0��]{}�b�'c�.J�w������4���&Ƒ�fң�e��S?_8�:�ȕ��c�������r}��up&��W�2��V�`�[����2�6�񕰌��-��g�͉@���� �@�ݏ�M�$���]Ү��>t-c��ȩ2D��0/���U.{q�T:���F�د7��V�e�ٌja�Q�������jЪ'~�ܨ�����5j~3�6�V����ɔ�S�Ŀ��!?o�J&I�R5p*�W����b�fg�A�p����k���8�[˃�����du<��T~�A/����ry��~���B@t8�F�П��ú9��������Y��7	!Dъ{(@ �~�[{L��(���X��l�����g�H��`�ibE��!��xAf@��{a_9^��Y%���.��w�Z�x2Tp���?~`N�A�5ᄰ��K(a�R�A��{k�5a9k�����@(Y=ʚ��W<�:�H�[$㐟��U'Uy��~�M�>VW�F0���S}8:n.�r� sh�ɽ�F�}'��2��U췪|��^bܭԶd�iz[F�XeZ�)7OHA��<�X�Yb��v�R�/FA�[ݏ��z��7L��Z�&�Vk���U�aҬu�8"��0>*i�,�аh�gƮ��ԩ�@�bE˷��:���L�N1��k�4-�ʺmx�4��0K�i�܋��	�Q�>4�ٕ"��Ҕ*��L۶��������<P�%�*����Lf�5e�i���k��F��Vt���Nq8�U�Z!t���-�|��fz�JVߧ͕�\)�6������K�e�B��`��2���χ�-ƓR&��� 1"�?����?r��/�>f%�EG6���Ɯ剴��4e�'u��a��Q$)�ף�
�8?��C�o�	͟h�[-����dO	ᅣ^ҥ����v
*^v�J%�{���4��    \BŦ�)n��"�OW��4�$�.S�5�񲩛�C�:�3#���(g�.�͓7�P��kl�j�
j��}ڬ�VV֮�|�\ WW�Ƀ��~�]r��0l�_I�|f
�����_)��a#)�e��+q�o��U�N7j$B��{���q�O�ͷ���a� ���+{� XOeK[|f��Y���#`@S�=R�$)���U:��?��f��跥��;U�0O��%��>|l�s ��v�'�'��2S$\%$��tNE��nv����S�7�Ʃ�Kv�@U��r�8k� ���x��D��#ȉ�ހ��pw��/�8�G��`��zx�����/��@�BT�y���mʂA�E;�:�<#��<���ḷ���p=�)�p��z�mF⧠O�HF���&|`0��4c�Y�sE��O&��O��=�3@M�&�쫅�'���ID2b2�W�8�<c���N�wTÖ�Z	PF�$	�D�oK���'���˰ ���M�@�2:lT+n��!MPH�����0JT!�]�o���n'H�N;I�z�^�;q���n�t���ឬ��MjJ���ή����9uY���hQ�b�E�(X;�]�����N�£뤎T�+�����Σ�>�F�v6�{յs�jR��a2��N�'r�w�-����qk����J���/��"�zF`� f�=F��V/��&=K]	RF������~[ʢڤ
�����x��Zk�=�Œo��T�!�x��w3��˥KU��z�d�q ������6��w��9���R��Tq�F��:HN�*��w�T���:v���	�7�D���"Uހ�+�!�+UcT���xB�?�`t9:����1�Lw�������fzMB]ߋ4��q9�k*�Q&3��p�d~e��^���o�)��g+�խ4�#�����aES���X�]�!y����O_�͕�N����5�C�ػJ�_*����{c��jD��Z��nïw:U���~���N���4�=����͋[��{u�%��|0�Ё�\��f��W�}ܧ��g+�YϪ�w�Z����"��$��D�-a���bl>Oo|�Ӱ[��ꑳ����XҌ�I���|�J��&�RY������Q��UVZ�t�4:q�j��n��+݅%�i�ž�`O/��ď�I��]Z�a��_9f�Q��1�3�EV2�џ>M@�aށ��� �o��9g@p����M�8gt ���a#�.�X4p4`�kA����Җ��F���Q�Q�=Z�?<=��A�S�o�ףAׄ��G�ym ʝ����\�8��L�-�9��-��OT��yN�x[��-�S�,w�����Yŕ1�L��W��2)����ߒ\� *j��~�mq����P���^���G�z�\	��r��d� �%?٤UD�7�� c�K�r<O9�?���9�̖DګV�5����� Qp�V
�y��a��i7�����>8�oVw�
������M�cg���D�w`"���?u���i�p�(;�3�G�ʔ3�ʯ0x�^)j�gQUG�u�L&���A�ce���@rX��L�����A[�"Z��m󕊅�QK4c�<�Ϻ;rV6T�����K%��dw8|2���'	��S���¿E"�|tr݈��A�Ѽ�J�jȫq�Q��-�m������[~Xm8f�C���h������R3}[��B�_�߿����A��Σ��@e�Z�A�a��|jr����f�,;#l� 閡��k�P!#h�p�'|��QW��k�,��-?��ZB�E��4���h֫�v�Ս�O���x��k|�[=���AS�r��	�ʩ���F�@�lE�z�����7�炂
ղeLJ�A���|:��8Ǒe���0v�F�(#��Au�4Y�k�2����,���A�.&�
k!��um[C����fmA5f0������t �J�繊��}��p�]�D��_<�72H;9& �`���D�B�?	NǄ�vdE�ꜷ�x?�8�H)�U%7��ИR�~�wi�P��
3��j�Ty�b�H�	jm��7:��G��L���7�R�O�ෞSzB��gdIa���+s��WϠ!�<l��L���d9�ÁVw�sXD}�EYfht�d�tx�h��#�S�vPy�.ה��� n��w䌁;�r������~��h�¿;]����k�e��+��-v1�&����Y 9f��%ի���n��B?�`�_#l
�2��?�q��T�R ��qo�s��X��~�h�������&�5���9�>�A�Yoj��/(�^m{� ; �͍N>f���2dn"�n����������N:��	s�io��1�1�qF� 9������@i}	fyG�
�S&�d�B�[��P�%3� U���� ��(���=�O�"��K"_YY��#,Á���Q��0S��J�O{�攼�Mi����q����;MxD�½gw�	����d�����t#��a ���_E��EU�U�2��?�1fI�%��9l`�t8r1T���ƉP�Qo,ӥ��j�tda��q����)ҵ���]���\X{DKY��h+����sb)�|���K@!�
f��(��]m`�)�I�sv��kB������Z.���r��d��x���A�������0�ø��kQ�]���n-ث�A%
[��/��__�;a��Ì�rS|Ro{=n��H[�|nEZ*��*Y�M��-�ܳc�NB^�`fi)��F���i��)մ5�фf�¶�QR�;�Z�dM�v�K�I�}_�w�uv[B����+v���/�����`|Bu͠+�!�v�~p�](T�t|��md2�GMXP�ń�����I�|���d^Jt]��O�J�΀Ŀ_2�h�xlL��M<D����Ir��_f����s����
���G0*�QȈ�;�[R��z~���J�l�bEp������#�8v�a�Mn��w1 m�{i,�W��8�')aCZr��,레:n���`�+�r��W�įW[-�v�/���$�8�T������N�F���?�M�X=S�۶Ķ��Qhd���;ZI��ʸ^�� ��6�ao�sR�9ub���(������_���x�t�Am�*�}���)����~F���-���}�]��g�J(r���5B�d�Vv�
[�J�l;>�q���}��M�v������υR���"��� �!��s�뢌j��tA���v(��T`�S����5hi��`w�q+�MAT�N �[Pjxo�/�BU=�A��%������?��"�\H�w|F�E�d�B��7�zF�}����V�y�8���L�K'Q3cKX��0�WƃP��u�t��<O�������������:M��e��l�&��"�`��=�H�t�镮�z왌c��e��"�y��P<Ei�=Ȩ��Lg�p�B���ߪ6;�.�^M��k��߮�_� �����a{�,�����o�2/�Ypjÿd����{�vI�9��U��U��ل!c
?P��W�rL]�J�g�7�,LC��=ϖҔXr	�66}��+}2lӔ6����$�J���8���@;�H\���(d�R˗��NN���qh
��l�}.w�ih�-��>mC9�7l������~0�����;�T+���r�[?�fSUT�[x!G��)�Љ����S�x�P5�$Ֆ�CJWA-��*-���O{k}J�=�f�m�}W��}�p���� a��V�A<��fk�Q7�֣�㷂jٯ�I��*�_��V7˕N��l*��-��|Vx.]��Xl]�`m�P�ʚT'�����?�С�����(1N��M�0���"�O�9=�x��cc�4�1�%9%��'�@)gҲu:��;w���'d_�6�k����9_���E�'o<O���O�*~�I�QՖH����?�	ג�,��NGH��ac��q4�~½����s���=�n���J����o���b����j�4��+�@��VFqF�E}j����:?a�SKH��ZӶ]]aL�ު- �  �,T��gh��J��_����n%�;�Fï7+u���~�Үw�F\��p5�5�O�q5���Te��teL��;x�XiW�;��;v�$�� 5�T+	L�H�-�ɩ��>��?*��*��i�i���Ekh|���;c��I��Pk1�ӑ0�Q��I�7j\e���hG�j�{>���k�\M��3v�g�^���l�G���}�GLN}�_�7�INO�I/z�L�d���(�.���
������{<���g�	��^�bM+4���!�4����풫I���݇'�Ǟ�x�$T`�����w��a0:
�ӯ8��9!�ؙ�$�E�9��V�����FK�Ed�F������P�;0�Z0M�Γ��b������dj�O�5��f�Zn������v�k��t[�vҊj�
���0��V�O��_�%u��-�q�R��k�N5�(����A�1?(h�n�,��!�Q����\W���T��VNu�k{��9:�)|t��+�Q��W�R�gh%˲�,�j��L�����pא��w4�"i{CU�W�r1c�뱈-g�U����5���v�e[O:79R2*U�9�,��J��g�6��]�]����(�&�Qo�:�1U2j�l�i���*^��S�CY%5��)
i�fB�cW	4���2�P���b����Gp �"���Zԑt��lzFG�*K]�����=�Y�;��g �Y��>�!V�+a�el0�m���j�����6��̮�e�XE�����g���>�Q\�J��� �2Dr�e�d
��m
)��~-�6*-��՚�炆�0n���S�D��S���=��7������&!� =bJ`��iB^��zi+@�3�c��u�Yڋ�)ܸT�r�uy��w���=����~D�.n�[�?F��,�Y�iR�
/4�Jɜ��k�"2S�Dy�	��_�S[�:K#�)��n,����q�:I╅n{�T�zǠ�ռ�:�;��`��j�z���h8����$���;�
A%s�%X�}��6�f9.�� �ޔ	��Bk>�@-e@F�}yQ��P�{����D�B|���إL��\d�䥴�Tյ�9Y���U?�-(:|��v�Z�xC�Fo	�D"A�\2�����؎�q��!��>+���������?Ft[�R�3ȇ���>�j�+U��)�e���o/(��B@2�G��r��¢���K5�����"�6��)���_?�����j+      H   �  x���Mn$���5�x{��If�}o���?eY����� -�,�W�`��3yV!���؂�{��c�£�ڮY��c��^��F�!��w�rƮ%��>��Ҋ]��0��Z���}񥬅��Կ�<���"��.���S�^ll��x���h͋�A��A�kQ��4ZJԡ�K.=*{�aS�dc`�򤾪�6K�_�Z<��r��h��w\��'�%��Ǎ��8W?}�s���W�TE*�T�1�c�԰Q��:n}�����\�~�U�_F��pm-�hϏк��pV�u�E���c��d��9{
�I�������WK�| ��W�7m��O�^fQN��$
͎�Hp��^؀[,�+n���o�B��:�n����Z�E���?�P$�nZ��f�r&�i�K5v�5]�7�YeGuG.����kǏ&��m����O)i����7ˆh��$%hXo���M��*�m�l:�p��ǩ�e;�����t�3\�︰��N5:pg��\��8�2N�4G��+H��&�2}�sj��-\m�������l�)8�ƦJ^���@9מ3�֤��[�͹�)�<�{���N�W������e�Zޥ���@��ƛ�ж�]�9rcT��DĀ{������#\{�>�C���w�]����B���>����m���G�h"i	F����c��X3��g�]=�@��WZ�(��Hk�xog������B�r�q�G��f3&�VP\��5�[Gr�"�vU�⅍}z><aF��u��e:�������q�`H�q�/[���%ۉܛx�'��[���n����έ��֛*S&�e��Js�p"]:��L��1���mH��M���qoc�9�Q��s2sɖ�vr�U.���E�gd��s�ę�K-_��ų�SJ����Q]E���GC�&褾��C�����b��`3^��yb�j-x˘��&�+1��*�n�\9qR��#��~�,���ջ0S�iu
ˀ7�ىR?<0TLh���~[�qׁ8��b���7	&%�X&�k��Bu�`�|9��f^��V{2y�?��*/"�c���4i�e�vT�!��L|]da�5�&ǌ������=�P��Q�T�h�o@�w�B���~_�qo���)�� 	ܖt����|U�]
f��p��1;��� k����/��߀^�c��63�Լ�(��S!0�R�~\P�/̛�`_�yl2#K0W�\�/T���/���ջ��|������CX�      I   �  x��TM��0=ï@���v�|pl�jW�j%�Si{B#�uU��:��@ZvQ������̼7o�W�TI����Әc�H�#IH
1�Y���f�T�@0�B��d
��hD)I�'����m��4��Z�Q����TfNu��;s�AF��� }XY���FA�6��\v��>��m�������3�3���w	���O=�\t͜��4���"I#�$)P7FB�(������ج�z������x�ٶu������ӆ����T����n�Y�g�z���p���ڷ��&U1�9e�^�g���A���\�����I��2^o���^��U����d.�n�K�i�����Q���j-�U��|���P�"T�O�!�8�}��$�7,%,�S&0'�ƒ��MJƩ�TP�aX�a�D*-ps�Q������{B�d��S'H#L�'�D�7'x1'�oN� @���_s7������      J   f   x����0�s����8M=;TBn�ÁT�؞��H�XPX[���q�5,՜=d��/~�4"��yT���&��RII�M��_��v`���OZ/D�ft      K   w   x�eϻ1�:���w	�	�{Jq���Q E&rZ�l'�I����l���M��}C%'�9�0=i�Q�|�/�K�Fw�$�O�u�vw,t�.���U����\��w�w�1��;     