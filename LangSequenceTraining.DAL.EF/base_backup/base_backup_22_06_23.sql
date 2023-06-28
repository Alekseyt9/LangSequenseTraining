PGDMP     	    !                {            LangSequenceTraining #   14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)    15.3 #    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    16384    LangSequenceTraining    DATABASE     �   CREATE DATABASE "LangSequenceTraining" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru_RU.UTF-8';
 &   DROP DATABASE "LangSequenceTraining";
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            .           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    5            �            1259    16385    SequenceGroup    TABLE     �   CREATE TABLE public."SequenceGroup" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Description" text DEFAULT ''::text NOT NULL,
    "IsHide" boolean DEFAULT false NOT NULL,
    "Order" integer DEFAULT 0 NOT NULL
);
 #   DROP TABLE public."SequenceGroup";
       public         heap    postgres    false    5            �            1259    16393 	   Sequences    TABLE     �   CREATE TABLE public."Sequences" (
    "Id" uuid NOT NULL,
    "Text" text NOT NULL,
    "Description" text NOT NULL,
    "SequenceGroupId" uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    "Order" integer DEFAULT 0 NOT NULL
);
    DROP TABLE public."Sequences";
       public         heap    postgres    false    5            �            1259    16400    UserSequenceProgress    TABLE     5  CREATE TABLE public."UserSequenceProgress" (
    "Id" uuid NOT NULL,
    "SequenceId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "StartTime" timestamp with time zone NOT NULL,
    "LastUpdateTime" timestamp with time zone,
    "Stage" integer NOT NULL,
    "LastSuccess" boolean DEFAULT false NOT NULL
);
 *   DROP TABLE public."UserSequenceProgress";
       public         heap    postgres    false    5            �            1259    16404 	   UserState    TABLE     s   CREATE TABLE public."UserState" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "State" text NOT NULL
);
    DROP TABLE public."UserState";
       public         heap    postgres    false    5            �            1259    16409    Users    TABLE     R   CREATE TABLE public."Users" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false    5            �            1259    16414    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    postgres    false    5            "          0    16385    SequenceGroup 
   TABLE DATA           Y   COPY public."SequenceGroup" ("Id", "Name", "Description", "IsHide", "Order") FROM stdin;
    public          postgres    false    209   �*       #          0    16393 	   Sequences 
   TABLE DATA           ^   COPY public."Sequences" ("Id", "Text", "Description", "SequenceGroupId", "Order") FROM stdin;
    public          postgres    false    210   ,       $          0    16400    UserSequenceProgress 
   TABLE DATA           �   COPY public."UserSequenceProgress" ("Id", "SequenceId", "UserId", "StartTime", "LastUpdateTime", "Stage", "LastSuccess") FROM stdin;
    public          postgres    false    211   ϥ       %          0    16404 	   UserState 
   TABLE DATA           >   COPY public."UserState" ("Id", "UserId", "State") FROM stdin;
    public          postgres    false    212   <�       &          0    16409    Users 
   TABLE DATA           /   COPY public."Users" ("Id", "Name") FROM stdin;
    public          postgres    false    213   ʸ       '          0    16414    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    214   @�       �           2606    16420    SequenceGroup PK_SequenceGroup 
   CONSTRAINT     b   ALTER TABLE ONLY public."SequenceGroup"
    ADD CONSTRAINT "PK_SequenceGroup" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."SequenceGroup" DROP CONSTRAINT "PK_SequenceGroup";
       public            postgres    false    209            �           2606    16422    Sequences PK_Sequences 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Sequences"
    ADD CONSTRAINT "PK_Sequences" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Sequences" DROP CONSTRAINT "PK_Sequences";
       public            postgres    false    210            �           2606    16424 ,   UserSequenceProgress PK_UserSequenceProgress 
   CONSTRAINT     p   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "PK_UserSequenceProgress" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "PK_UserSequenceProgress";
       public            postgres    false    211            �           2606    16426    UserState PK_UserState 
   CONSTRAINT     Z   ALTER TABLE ONLY public."UserState"
    ADD CONSTRAINT "PK_UserState" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."UserState" DROP CONSTRAINT "PK_UserState";
       public            postgres    false    212            �           2606    16428    Users PK_Users 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");
 <   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "PK_Users";
       public            postgres    false    213            �           2606    16430 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    214            �           1259    16431    IX_SequenceGroup_Name    INDEX     \   CREATE UNIQUE INDEX "IX_SequenceGroup_Name" ON public."SequenceGroup" USING btree ("Name");
 +   DROP INDEX public."IX_SequenceGroup_Name";
       public            postgres    false    209            �           1259    16432    IX_Sequences_SequenceGroupId    INDEX     c   CREATE INDEX "IX_Sequences_SequenceGroupId" ON public."Sequences" USING btree ("SequenceGroupId");
 2   DROP INDEX public."IX_Sequences_SequenceGroupId";
       public            postgres    false    210            �           1259    16433    IX_Sequences_Text    INDEX     T   CREATE UNIQUE INDEX "IX_Sequences_Text" ON public."Sequences" USING btree ("Text");
 '   DROP INDEX public."IX_Sequences_Text";
       public            postgres    false    210            �           1259    16434 "   IX_UserSequenceProgress_SequenceId    INDEX     o   CREATE INDEX "IX_UserSequenceProgress_SequenceId" ON public."UserSequenceProgress" USING btree ("SequenceId");
 8   DROP INDEX public."IX_UserSequenceProgress_SequenceId";
       public            postgres    false    211            �           1259    16435    IX_UserSequenceProgress_UserId    INDEX     g   CREATE INDEX "IX_UserSequenceProgress_UserId" ON public."UserSequenceProgress" USING btree ("UserId");
 4   DROP INDEX public."IX_UserSequenceProgress_UserId";
       public            postgres    false    211            �           1259    16436    IX_UserState_UserId    INDEX     X   CREATE UNIQUE INDEX "IX_UserState_UserId" ON public."UserState" USING btree ("UserId");
 )   DROP INDEX public."IX_UserState_UserId";
       public            postgres    false    212            �           1259    16437    IX_Users_Name    INDEX     L   CREATE UNIQUE INDEX "IX_Users_Name" ON public."Users" USING btree ("Name");
 #   DROP INDEX public."IX_Users_Name";
       public            postgres    false    213            �           2606    16438 4   Sequences FK_Sequences_SequenceGroup_SequenceGroupId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sequences"
    ADD CONSTRAINT "FK_Sequences_SequenceGroup_SequenceGroupId" FOREIGN KEY ("SequenceGroupId") REFERENCES public."SequenceGroup"("Id") ON DELETE CASCADE;
 b   ALTER TABLE ONLY public."Sequences" DROP CONSTRAINT "FK_Sequences_SequenceGroup_SequenceGroupId";
       public          postgres    false    209    3202    210            �           2606    16443 A   UserSequenceProgress FK_UserSequenceProgress_Sequences_SequenceId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "FK_UserSequenceProgress_Sequences_SequenceId" FOREIGN KEY ("SequenceId") REFERENCES public."Sequences"("Id") ON DELETE CASCADE;
 o   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "FK_UserSequenceProgress_Sequences_SequenceId";
       public          postgres    false    211    3206    210            �           2606    16448 9   UserSequenceProgress FK_UserSequenceProgress_Users_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "FK_UserSequenceProgress_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;
 g   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "FK_UserSequenceProgress_Users_UserId";
       public          postgres    false    3216    211    213            �           2606    16453 #   UserState FK_UserState_Users_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserState"
    ADD CONSTRAINT "FK_UserState_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."UserState" DROP CONSTRAINT "FK_UserState_Users_UserId";
       public          postgres    false    213    212    3216            "   A  x���;�]!�������m��K��:�TS���H)g���x�8�!��-�`�k��j���ytP�l(��m��O�m�����o��~�/믟_���������~�L��~^�㿆��[-�,�� T
��1I#���3E�)r��aRcq�z<@t(�H���&�*z��:�Nq(6k��!�b �5h)pO��iN�gJ�S�%U$T�RH2����,6rg�_n��Sɩ4��n�bY��1�L!`�m�^�)�N�S�L�J.A�r@���F��hg*_��S9�24����KI���Ae�ìR��L�uʜ���!�����      #      x�̽Y�[ٕ&��+���� O���z\����mF�r&F�b�a
G=I�̔�3S�rW����+�������D�$�~���^��9�!%�mt��N������r%�f�a���v����W�f��t�Z��ݛ�G��p�u����?��,g˷˙��z偷\��.�/�7�o�oW�������ꕷ��s��?�f9_މw�?�^ވ?\�]-g�Ż��ȳ��ßX^�W����e��r_7_�÷],�y��{�|-����X��V��C_��=��*^��?���R��<Z/}�[���?{'VD�[=O2�����s�^��ի�~����g�o�óߊ��~\��Q<�\���xB����3�Ǥ�y�;�l�-��V�&<���N����=]}!>�du�_*~[��v
��v�H�q.�Jlڵx;��q+�o�\�x#���zu~��y��w�����y?�w?��)"�#�(�<�>]�N|n�����[|z�Em����<?%:��M�c|�Aj%����'�3�ם�Db���ܡ���O�/�qu9K��SKQ��XL�78�5Mz���z�I2�N{�#�Ł(�@DQ��`�X�pѷ ��*\�3� \�,�&Ț'�	�ֻBc~�9J�
_N���3��Oq2O�A,�w��7�ǻ�6�3�QĿ����[���gYd��X��w�䈛����h\[X*\�7�szYoioa_/��^����pq�s�3�p�
���\����ď�'�������o��#E��[�E�e�%����2���=�텿����&�{M?=��z#T�sZ��^�ޮ��Aŏ �׻I�ş�j\�ʭv��nD{��JPnw���Pa���ݚ�ժ�H�0:�r+������{��#�F����~�&:�Mv�=Z�)3JӃ�@��S|�6����#6U�?��@��P^�ט�K�/bWy����/���~Jx������l�iZ}i=��+���Ý�E��$��;q�?q#�ة/hk@�f�7x�4w�A�Ȩ<X��[})��|u�����ߊ=�X�L�f-/\ء9�������yrd��������������W�~��</V_��wN�����	���t1̯�í���ޑn��v� cq�p�H�m4��8�Y":&��O�i�w�����/^�ւP��y}�ϒ�y�V���w��^pr2�&�ɀM�xM�I�X/,V�Ok�L-��2ap�C�@S�����K^�L_�.���h�_�@q�}9����T���y��&�_������3X�?�Oݡ��CC��{R��z��Q�.�o�%�Vlak�wJbଞ�����Be;� fx�@ԯ�5=�)���ti�����xϭ��i��I>��-���߂��D�>I�VR��-��q%3��-����
.�����ǕVGX��6��m�F��j�r�D�z�l��{�G���g�&�e*R�nޒ�/�o�U�!p�Jd�/�-�c��Pz�dM���`Qd_�T\�0�߁S�J��Z��S�_�J��V :�p-�f��{G=�_c��aA���o�3�������s��;�^��k O�=�Lt!���?a8a�e��d���j���g��|�{4?xA�� ����]���\��F����@���@(���C�#�� -�c-ps/�^�v�u�?*IB��>�%A%>(���L�$�5�Sy��� d>�ipZ��#��Ar�����48L����v� T�(Х��%_o�7���~c�
��w�?������oQ?��M�A�l����������(8�{q2���j_[����'A¯�ʸD��9Kl�.Is/P������̯�"���?�+�B4�ϔ���+Ln�M�Z�����{�����l��C��Z��^ )M���<ɂ� c�\T�r_��
�7�ΰ� �7�����2�*.Җ�2I�AR�{V&o�9�R�eE��"H�p�HZ��q�J�/�2C�q�n�ح��� ���~E�ZR���j���� ��N�����[�$�r�<�d{îe,�W
J�ZTШ��=[��چ��.s,�s|�{y%0'A�V���bt���"�3����l�'�n����f���ކ�8���##�~i�y��UD��͠|"p��'�����+/?y�I�[r�0C�ukK�#�����(I&%��|��{�D8�^؟&��p:�,ԯ������F>߰J:�t�TJ��a_�����ˀ<�{�h�f�82�Gx�%���P�����p43<9�dh R����Y���?�N�I���7���k�a���A_
͉ޕ�T�n�� �W;BJ�|q7�~^ҞI�|={#����Q�;M��x��g���N��3����w������)���q�@���D�U���)�"�ރ�m�~H�鸏���������w�=�R�7�a��p�.��,��(��+�o�Q9�w'�7b�������%>���3~8C灃{���,�L;j��+<�o����[^��i����<~�2�Z��?ÀCf#��F��K�Qb.Q+R,ΖY�}d��Y��~W�P)��f�.¼��ZI3���r�ީ�n����)��qb׮�W>8���ex�z떬T���K?�^+|���3ө����eA�����7��k+騖e���vqM��ۂ�O���ܱ��cπ9�7\V[�V�
E�胪<5��NXJ�R�OJ�
��^H���v1�?6�G��b;�/E�Q �+���(���_aJ]�3W�b���������g�:��B��\���$��������E�uv�E��^��G�z"͍��ư�ka����0Wy.�E�1��^�>F���N�څ�����`L���'���\یC��2׆V��ș�Q��T������p���t&���u[�*��8�[,kܷT��Ub�Ҙ(�q�N�\R�!�\�<��J;��D&+u��U�9�jf���=#�}N�zA��؏��W�~\����ۡ4�_iĝF�Q�D�x�hx*<	�D����ܛ@7��K�;
Z��s��ނOx�U��t1Ǎ�2��5�_�@���r0�Lh�3��ꕉ����Zo�/\� X9�MY��*9n�e�SIH+���;���绢�T;Ub�Z�o�}}�������a2��o7� �yH��{Dh1j0W�M3�<>��L,���I�J�oW~A�Q�?�̻O�����{��C��bS3��`��8����Hb����&@H��G+�%�#�E������B��x�v��.0ܣkn�\��+Fw�+����u}���@�Ə��b�$:
�(gk�f��!��yQ0:�b���f�b � H_�����g�FS�(O���APMBAE��
f�������j?H��ӝ�'Av�3�(�h�^��W�����s�~����r-a�.�C��Jk_��+#���b����	������ff�%H���� S���;�P������[Z0Pl��j����N��Z䷒Nۯw���jӯE�v�Zkt��`�R�O�v�^��v�0�Z�Q��׫�Z�^�j����Jvb�}7�$<�+B���=ֹ���n�FJ~�[�-S�Jt�(���yo��{/�,i�.�n�9ح���蝄�No|Ā��qr:=�Z�pr��`���3�q/N����1���3ͭ�[���W3�X2�[���.����GǛ2���I�V���v)�)+f
y���I���>6ktq_N1J��$�O��0��UD��i"4J0����(�����`�?�-�o�a/2\.�E���\��ێ��`�l�3�� ��N�Q)���bȞ.����� S��7�Nn�PT��Qd���?7���]7O���?�qqRQ0g0쒴w��ã�#i#DH2FKo��УϤKB��o�(�η��T~}B�\\ԏ.��X�J��	]t��3�q�_�
@�ǽ���AQ5�����KJ��e�쩥Q)4O��B����XVg%Z6�g��O��ܭ�J�!��Q��/�GX����o���˫    ������VԬ~�nw�z؂�J��V��r+��re��L>{�C��PP�����z(��̥�_y�չ��������{�X��(.����Ќ�V�̃�S���w���M�s�p�g){�՗(�ʼ�������5��y����v,&�ɤ���绚�
A�E����`��v7���?ђÕ�ǽ
u���o�L���Q�;��u�l ����QpX����-��szy������r��I�;�C���s��$=�9.
Ցٕ�9@lvY�E�1�y��]���Oʿ����$����]6�E ؟�����~/J�^&�I��ORB �����؄�1L��wnN���C��T7l��a<�C���-�ŐXh����H����GsA�b�x���+�A��櫯<Ӧ̉��V#zJZAS�J �9�۔�ub�����ߩԓ��.��jT���N�+��o6k�z�ՂVw����(p������@���@e���w��e]v���ʲ��ےS1+�3�Uz�0���9�5�U�_�ʁ�]7z�2Ƿ�'ܭ��3}��8�����`,��9�ތ�U�X}���B��F���L��@K�bp��.gUp8�1���X�,�)��0)����˨�
,C�셊o����`s�Q��'�[`W�ߥ~?�'租2��Ex�sΟ�����ٚn.�S|
 �J�^1Ș-l&a�*�W�@\�70�\<
�q����Owf�6t	��`Y��_k�[q9��BsFB��[Bgv~-��I��l4*�^0��d<�OR?�͚�hW��ex�~>�;�,\�sj��~ Y*���s�^?u+w�f�@�R�,�쾲<�<�����\	���C.�6U��T6&�!yN�tk/�G�a1&*x|捂ހ0R�p%#�q�!U%�~2
��[�*����D�Im�&�O���j��T4Oɗl���\	��^��tn���櫅�փ2E7����C���س�'Zy'��PMFy�O��� T��N��[̌����g�� (�C|IN�WRy�]��\����Z1$�c08�N��I?�LB�D�c�F( �7��Y��r�Bw�(F��q/�]������ 4�L�I4��g�ryKՈ�B�;b&�#7w���S;�-2}�����
���z*��Ut��7>ن�OJ��=�����}�Zc�)_�7��%,��P�{a+i�[��_/c!%h��Z��Wä[mV�Iv���N؉�v��[�Dحr�w�q�0��4��f3�3o,$���A8���\���e7�c��fq�E��TRb���fV��Ι�N$��{�XR$y��;�|�����
�Rs@��&Y�υ��y���$������Js!�����w	�,p��:~ʤ'�<IF�DX?�G�
 <|�u{I���Bu��O��$�j��޸�&�(%}�;%{��hn$v1���\�ӝ.�M3_W�h.���8B�梨m��爍D[p"� ����S�ГѤ7�����(9��i�~�cY��-a�'T�B9O,�2I
����u��a�`�/bH�Ĩb��(�w�u�b�3d� ٫�a8(�1�1�	���qtY��K����'�Q�C���"8�?�b@����7��{ܛL<'t0���xS�[��S0�IҐ��N�l5%�4�T
t�{��~�:��Q���.o����!�S�l�?�7e�,��$�����J�n�sNl��I1	U.i}kŊ!�?�%���\>3я�hZ�d�L��(1�-��uF��, �䨏�������əp�Rq����g�|�PW���e�ӷ�]��,�����j%�:u?l�_!eY-G~7+a�ފj�do�t�W��|�dC"/��yM�!˻�x�4��PsT�u���4������&�nvC<l���h"Ӿ���x�����Ch@m�O|*ҊoT_�k��eQ���[n��f��{bp�-YQ
&nt�'{u�Q�j&�	,w�ur(:�H���HCp�+�	r0d�<��'��"}�W_�<�χa�'ю��N�~g���H��%��o��,Ѱ�r�� ��&�T�ܪ�Pc)"�Y�cBt���߽�/��Ev��5=�z�Mݺ9�,͠�ԯP-���&�͹�����Э��b�C�8�����C��2#�Q�J���8n׫͆x�P�n�o�+U?��F�	�����^ĖN7_(�~ȇ�<E�;ӻT�{q��ձ� ����|�ݝ{
�Y���[n[I�mjo�A �a<��'����i�u����p�@�8+�
�?ka����*]�_�)��iZ�̌Y��=�AV�Y,�u�@����Q��,�����OF��D͕?��N�t�nL�	P�2���KG!y���
^W�n�wpny��AS�3��|�]#iQH�b�9�z���&(52brf��E�̣kc��=�1T�H<��F�j���#E�r��7��'�%ϕ����'��HF.1�a��ɱp�G#$`9J��i0�(��"�;����ɀ������M�-���Buh4�-n��߮
���O�xW^�!>�G4֒y�r���.����T����"��f�+$��&	
��Я�a�!r)C��2��'�� \���pH��E���B2E`����v��F"����,�e�𔚚MG���%���?�n�1#t-��ۜ���\���6����y��IA�,����6x�W��*)Kkj����p�r�m6�4�7�5R�}��~6��j5��n�>I��n�巫I�H�q3j��>��!(I�x;̗��{�-Z���:R	ml�m%�DmjG�9����G�>�MtwX.1�i7�J}~��7�l�����8��4�y��m=Zr��Գ���u��-����%:�����ЄƎ@H��/�0R�p���"��mx��m�%*�
b��Χ�D�l؇&^?�$��2>"�JlO���/ha�x�{.^)�^SO��A8�E( ����j�/�:�RFN�ɪ����'cao' ]`J�lQ�����%��S�Ҏ o�a=��|���V���\�݀BrU��RA�~���`���%�.<��#M���5V��ΖqA���o4�z7�~=N�~=�T�0
�~�u��Y	���I`���6d�|e�z��$��+N�_kb���/$�>n��J8d���7�_����;k�Od�y심toV����q� v;�3����dCz��X���f9��n9L#m���5[��xoe�h�u2���ع�=1��$��Oju�
�AD��)�Yy#�j*^w���;u7(*|���tL2J��S��5��\���d��v�������ӟ�1�Y��EVE�I���A5>DLv�ק��wۆ��0\F��t�`w����k��%�M�r�<q�*/����s%�����~+�V:E����ub!��Ӆe�����h����w\�>ɽ���h��$�<�$���|Jh�(r�9K@g �
\mN�-�=i�4������[��Ȼ�kg+oJ��H�#;f:�e6��s[���[��j�3xs��ѳQ�NZٯv�V=jG~Ҫ���M�v�j��JF����0��y���Nk�V�e�I����K]���k<��ޔ�{�Wv��-�u1h&!B�rn�$�b���#a���gC �Lt��d l�.�CV�t�d$�)I'�b� _P$�J<�. ��t�H5]�:��:e���v��g�E8,��P�J�}��5�EL�=�{Ivg���-�ے�9'����A(��������_z�/ǃ��k�4 �j��#y$B�bi$������s��U���e�8�h�@���b�@���;:��������$��w��&SK&`�>b�C�~b7#�~28L�%�:@��q �.�H�����@2��\1�Z��37�.�=f�1�{�����`��"��6�`�����f_B�N�����X�P(_8��*g�_W��zo��G��k�XLF �Af�t)�k4��S4��zK�m��0΀hX�?�ڡ�
��hF4-;�lfu�ެV*A%�v lfP�ۍFӏ��N�Uk�r��������n_    �
h^� �Fl����Z>��8^�F;�R�
A��L��a+���F�gl�w���ZH�9:�|�j�-8�o�˃��%�#�
glc��?��F�<�U�Lal%D�2H��������
�$��!sr����Ss��.�i"j��Q �mmx��@`;�Y~�~�Gxq(���H����y��;�(�m�+�V=g�����qx5M�4�I>SI�c�` �4�����](��D���LC�?Oql_��@�g�" 3���<�r8G�3�ORT�d�r&@�S�f�i�Kfii.uR�i�s��?�k�h��R�$B�����<~�d<�D�)T����8%�����`-�#O��;�́��v03yC��kX��D��5�zd���	�mMx� jY2ifg�eM�Cs�.�5�qd����}��~j��t�g%p�amKcJjl��Y���!W��u!���%/hk��v#n6Zm�Y�4�zT��a�	�r��l��fX��)��&�I%�?�Ѥ���������;,����S���pEA�P�M�������d�(��v5=ET ��2W�_XsŁ0w��p���6��+{�w����(j2��<g&��^j�/ȹ0�ڼʙ0�@���[�<��峃앩ӿ%��h�ꨋ��5$Vtu�T��<E��.e�f
x�0d�=�ڱ;� q��0
�s���X݀�K����x�-��j�$>n3]jT{��v�d��c��?$#	��=V+�#V�%��;e�"�A�KG��~a�VH�K�.WI�76���ag�V7�[�^h��	d�3��i�%��ކ��)]���v��	���T/NQ�[�M��"X+dŚ�ͤS�Tj�_�įWڱ��*q܍�N���!sn)���|a[�qN��M�*���D gA��l��\��ڑ���V&]�I��cH����ǽN��P�u��[����԰E+0���gOd|&��o��,���j�#�:G��֨���h�]m�n�,4��;>�ƽ�L���C��LdМ�C�cw���eu,u ��^ㄈk�T�N�.���Z6Z%T<��5B�޲�I�ԁ��k=46Z���1���#�]ש4��
�vu�-�+�<��{4/T���3�ȕ�W����OZ�����V��[{'��8�h�3�%��AlB��1v����[*�Q��q˕� ��b�j� Ꞽ��]2�rKY��.����0�SYP����d��EsDe�lYt�d8T�5#�J�WF˵��%ں~w�,�d����̨���"�J�Vf$�d+Ђ���~���t�v��H��͝V���Q\�w��8�r��88&�FրC��.�G)���@c����^�T&�p���LK�#�+V;[�^rz��d~(I���3H��L��l����Jz<��Y�3�O��{�d�����4���{��Ğ+	B��e-HU�$6Q���-�X��5k����&4U���"��夏s~ ]�5ԙ�%����ԟ�MFD��$������A�;��'�h�Jg�h>�=U�M��Z��3�������X#�>��J7�Iqo�&YC�<����9�Έ�TZ�Y55���Yf����Z���4�مjcJ��Q��x%8x5�$9�:0�E�C��!^"�8�%m>͛, �ݒH�^)j �lN��q��\��;,reVˋRs�2���d�d���jW�	��-�҈�OF�hR���$}1���o���q��{�gӂ�s�;2�������K�k3�˰iuo7��ҵXC��Ŵ�t�ni��s�o��56d�,@��� ��CIP�TiE	Z�A��,
%_9i�,ٕ��8�%c�3%uħf�� {���ݓ�~TnG�n+�"��I���t:~�ֻ�J��4�{r2Q�'�C�AI��@*l�#E�C\aٜ�0�X�_7��HB|�@N��A?rnMy�5��zȎ��Wi�A��М"lY�uZO����ɤ�{�\�V{���v鯅��-A�'&�����={o2���
�P�j՜k2}���߯n��Z�_��Wr n�Z܃m��2O���z���:0+|�4Y�m����3P����{)��;L��TU�S������Q�d��,�#����h�6�6̏f�	���+.�fr)�E��SC�`N�&ɸ����]�d%���k���ԍ5���B��fSP�V�k�N�܌�~Ь�~�U��0���r5��I�l�+ɞ�V@�Q���՘�|�8���U�@N����z�5�A���zo��\3��%]��I��{t�h��d�Ђ`5�P^�ʒ��Y��è�1Zf�Y�G����G�e�/�f}�"���ёPt<Dt4�� ��ALE�d�ps%_��;��&\1�v�l��0Z ���z0v���"����O����[}�8�_�{���b�N�'0=Jr�&�����<��.rǘ��-;��i�_:�x�o0��$�Ʃ/WT'���Z����g��%�v�؄>� ������cҰ�)q�a����=Rb�ü��ٶ�#��б�Q���b:�.oG��u7 g��2q��n7�{?���ΐ�Q��Mb�U�`�h,�ESI����`!���h{�Npd���<k	�7��ϗ�N52~!e,��Zl�\�K��:9�!��+up��3����Z����h|%-#�pi��us2P9 ���� �@�ߏ�M�4���]ҡ��>t=�c��̩�D��sp/졗����]*�T�J�כI�+ղ�lF��٨E�zsO�}�J5h��Yn��z؉��5�V���G��h��d�ρ/�_w�rȯ[��IR�N�@��a1H͍�!4;�
��-�l\���n�;M]+���x�{R�����V��A�J�A�����x8qC��k��T�wʛ���m��BA-���˃��cr�UAV�*Wf�+���_�y�ǉ�z&�ެ(�az=d�!��;�q/����~0Q"��p�YH�qk�E�'C�\��`˚�V�5Eᤰ���!��h��P��5隸���'���PY=ʚ���<�:c���H�!?n{�.������$}DW�F0̐�S}8k:n�Wr� Kh�#Rxy�b�F����ǿ*���z��^bޭ�cI�i��6���`ZZ(�OHQ��<�X��,5�ઝ�T�Q��V��f�u����%�֮���Z~#�G�n�4k�&� �(���� ��
eZ3A�6�����ʝ:�N7��X��uf���.��SC�$Ǽ��0�_˹�n@F^����Rl;��8�dBGDvԳ��B6R俧,�*(<Ѿ��F]�Sw�K)Ej'��\V	}&��zg�i���S���$Vt7!�;=<���fVY[�t�Q?�n��#g6�3W��>m���J9����o�5�wZV)�?�I,���I0��|(��`<)en�x: f"f����gp���wx����4[�٭}d���6�,O�������I�t{أ����QD�O�>��C�o/�͟�>-�)�=�ɞ��G��K�����b
&^v�J#�����4�����MUS�V�E��.BC��I��O��\���ݔ��Q�I�T�U��L�s����_���Vк���z����6��[���JN��cw�[TG�c� �J��'�b/h�k��r�6��_��~���v�h�Q5�t�F"L~��y'�D�|˺�/H�;����������'FO���v��5 ��*��r��r� !�2�]o�Q��F�-��($�<��v��=����qП��T��L�r��<��k*2��nG:���7U|�f�0_��Pe�C���!"�"��g'B_�@N6�E�Ż��d~y�z�"�sL��9�-'G_X�@eB�<'���6e� �e�R��rY("��h��K���fx��z�iF⇰O�LF,�&}p0�b��nV�\���	�����e.�H�A�&I����ܓao�$"�1���3��f���հe�V�Q"I�;Q�����v��I[n�2,��lF�a��0X����Պ l�A��r��.�U�x����r��	��N�ުW�N�(�a�[oݪ    �s�'��½IM�u^�94w-�=�.�J�1=j	[d���� �ئ��=w`H���:Ҍ/�'�s8��������0����3T��O���:!���rܕ� L	8��ڍ��K@S9_��E���Ğ����1PD�X���78��,Q}$I9īo4�m��joU��'��La�U�l�H��\�C&�
��fz{�K�B���z�t���@Sw���mN��4s!K��љ�(��<��u���U!�	���:v"���	�"*��uJmUހ�K�!��+���]������Y�l�!��'H2�N�?��?j���$���H�9�3���e2Á��J�W6�5�q�5����� wu�f|��2;?GaX��G��*o#�!%oQt7��K�9����]qҰ8����UA�B��G��Z���j�o�����T�v#���Fv;�f���8��.n����S��:���C��s�ԛ�_*�ٺOos�Vv����w�Z6���lD��mI:�/�� [�>4��`l>Oo|�Ӵ[���摫���Uj,iƃɀ���=U��)M��������1�G�o���f�G�ى3W����Â���䚡�!��/'��K�
���Q�H`u�rH�<L2�+g��3���=�^ds���T������J�sDw9I��dKb�9���Ny�5�tY�b����\+��L����o�=2m�:G�Z�Ѫ,�D���9��C��"^GN8���+�Q�)q����'}�)�%�� ��%@̮��De�sjě��m՟2f�elR��"�
�5W�3�#�h�BeR!����&�jQT�������F���aP�Q��- �G�z�\	��r��d� M�%_YgUd�ׁ�\���P���SNd����N�0�5���U~c�c�drx%;H]�Ubٶfq`:��d���Cf�����N�'@�r5;��u�l]U����L���g��#ma�2��ꩶ#2�)^�o�0x�])��g����9�#�,(�˃zǪ������샙 �������E�֡��+K? ã�h�3�t>��H�Y�P�2L 
�.U�����������%4Om�HN�n"�G�֍L< �K�b,��|[ ��=(�v6չ��Q��_c�цcv?��"��.��Կ/5ӷՁ��
�������jưwM�*����+��s0�ktw�53f��ac i����\k�
Ic��+��[F]��a�\n���Vk	��~ӈ�Z�Y����V7�2=N�c�ig\���nx�5��AS�r��	,�TJf�l�_�$��s�<���� P�Z��I�9���[N��<�D[�Cd7jD�r��XU�N��>7�+C9������M�*�b����Xc�2B�F8��E՘!(F\
}#�ҡ<+���*/���uj�E66�?y-n�"d�v
L�j��1`;F�8������HD�ꜷ�xod�h�٪�|b�L�i?��t|
��	�Wb�n�<[�9����%o<tvh��%�=0�N��ހ���N�o=��[��'��c6�,�����\�
�@��S5�'.�ܹ�a��!�>ê``����H���ER��O1T�I=�!�)݋�A�$G���l�]w�㘕�6���[�]����k�e��+��5v1~�-M����Y�9f��%�ի���n��B?�`�_#l��2������vRM`J�,�'�Aϙ�c����գ�sk^ ��<Wd�f���L��Y�k��#�����^l�������ìV6_����MF��-vM������V~'oʄ9�7x��!8�d��b�G�ct���$��%~��)O����-�a�j�
�rH0�9��;
��w�;�#p_~�'�o��CљI��P��,�9f�)E@�����9%�g��ގ^�8��mo�%<"��^����Y����m�����t���a���_E��yS��N)�u���4�=��cs��޼����8�~�'��G��,��L���ba�ʭ��K�+�1s�}q w���Ȗ����V��#Zg��R��\C������x�Q���0�)�I�sv�R�+b������Z��?���C�?�:�ntk��J:m��	C?��M�5��j���ւ��~T��U�r���u��V[>��-7�+�F���>h��-����6��A.����d|�0�=;���uf�Ր�ye�Л<~���N�R���=��l�P��2K*{g�Rk����ڎ)+I����c�ݖ����v�N:?�170^5�O	���01����������4�F9=j�*Ȅ�5��Ї�Nj��Q���Kɠ�.bKv������wKc CF�����IP�7f&�`�"����'���{�����?�WW��0�(fD��-���F~���j��=�$�����rr��"����օu
�bP4�q���|w\g㌘�X�%�ˍ��$��2j�26��U��˵�_i��^m����M�\�֓ ��S��3nw8:E��]L����z��������"Wiw��TÕy�� I�氷�:�Nl�R縷���_����/��?����[)�r�>�g�����0��7�܅H}Į�"�_�^#�N��ʮ_�[ŚM��4��'p��GoZ�}�?q.@A2�9��Ş�_T�٥��s�m=�z�`�S����5����ݱǭP7�Jwl�bW �+d��*�P�~�(����G�u����τ&~�g`$}(j��&�v�gT܇��St"^�4��
ܱ��jf�	˾����"�q6�o��]��)�7�'��] {����,��g35ᇀP �����"��W�:��3����ToEf��P<E��=�Q��Lg�q�B���ߪ6;�.�^K��k��߮�_� �����a{�<��e�o�������/�e-'�Df�_�CR=F��m�>���XM�Q2���5au�2��s�jT~�[Ӏ���4tH��l)����$��{ ?�'�0Mi��]/N��j'ű��i�3�ĥZ�
@�a�)�|o>�i0� ��0�π����p{n�ڲ{��Q�k�����'�`@�S/@3w8
�6�yc�t����M��}j���� ���O��5�g��do����t��j[ma�����֧���hV�f��p�����s���&	&���Y8�t�-�|��Gݸ[����
�e�&U�Ӫ$~-l�[�0,W:���l
�,��Z�tY�b��tAg��OC�[�5�NJ[8N�0
��C���5��Qb�>M%���3`���*�χ9=�x�����ixr�ܖ��N�̖Z�J�e�4:��;�9��O��Ǥ�e�-���9_�o
��~�<uc,�b?����:5��	�-!�Q�G�%�Y�ם������hz�h:�����;Ύp��-'$�w;EfU���G�#����Lе��w��ar��2�3�/�S���f��o��v�0��m�d>К���
c��FkQD�P ���0�эJ}�\+���J�w��_oV�~���J�]���ZBj@j$<��jȿ���DI�Ҙhmw�:ܱү|�*n9��hV��SmX$M05"��$��"�����
�ӫ��f���)ww�^C�[���p{�O�~/ ��xLG�G��_IۼR㊨ʅ}��wԫƵ�gtW�xœ��t������׭@�<����ҝ���6�K��I�F�ք�3oҋ%=�tx2�ݗk�����|%I���
�Y�#�	��^�bM/4C��)�����{JF�Ck=�O��x�$�?u����;��(��C��rM<v&$I�D�RN�RD�t� �Q��#�vC��`���t�s�&q�W�I�y�6�S,;>���q�,���ٶf��,W�M�R�P�Ѯ�a�S��n��NZQ�Z���&q�j�I�Q�뵤|�e?�W��r�٩�e��<;L5���M��U�"�0B���u�P���Z9�ԗ�(ost�|t��K��Q�YWe����%l&+���W�V��v	>�5eƧ�    OǽH�ހ
~H,3��Eb9����D$�	�9��/�xҹő��TU�W�pRPK�w���g�w����NFI7��xי'���P{��xNS�\Uq\��i�0��UZs!�츣��o��Lz�*���@D]&U�q/n8k�. (U$���r��@I'�̦O�S�ԕ��H }�]E�5n}���R���Xe��U��)kc�����l ɰ+c�����^�U�1F%>��Č1pu��ƃd��V�#���(�28��Z�mTZ���5E��a�h�Q�܉*Q�Z��{8mo�N����uJh;bj`��iR^��zi/@�3�c��u�Y:��n\(D���A]^��7��Ğg	w ����&��(4����%��.��\��)Ј_����.ʫ��X��آ��Y��PM��w�^�ʐ���g�H���툙P:`w�����R�z���R�T��:'�q2	z}a��Bdΐo���a�'�ZMbsl�cHƍ�{S.Ȓ��|>8�Z��}������wB8_���@|JR�R�M]���]�RZm��Z��h>��#(:|��v�Y�x� F�7��V"�H�.�&D���L(��Gp\��E��V��U�z�E�7j�̒�c�	�T������y��hz�7Tv���e�^HH�ϑꨆ���4��~��_��yZe��1�Uۏ+�V���J����s6º�)W�Z�պQ���6R�s������i` 3f0�Y�����t�y�w�/�j%�ol��K�dR�ù��j$���ʹ�n*5���^;㽾��q���a��>-�r���\h��>��XY���OL}�E~`*��[9Zb�c�0���2�FQ�K�m�}�ia- �=����9 u�\�)x�_$�lhn�O�C輻)rx<��M���j�������s�\R�D���TiL��#���WՔ��o>��B�
�!1wI�3�� Eg�	8~eaT.Q��m��EK��9�Q��U!&�m6o�p{�.t�۽|��̅�����xo���?��ve�q@a�ˤ�dt2S��9G�gf��Y7��N}ȅlM}��ԓf%i��f[G�$�;u䏮v��z=
���{�Écl�|4���#H���l�-����r4+�^Zc���6Ca�<"j���'�h���Vhe�7�	��ٛ5�(������8SYQ ?)��]�ԑe���PY��0<`,祌�6��9�,k�ݖDl̎dM�KM��(��,K�����I���{s���Ñ|To�ӽ{sK-~�%&>ɢv�E��5�oq�YI�g;�@��w��aA̖,�`� <�0ë+�k��4��Cr�h�~z��8��8Gر8
���Ξ��{|&�D�H�)N�U�؏>����$,5�Q���ܮd�Ě�ȕ�ɓ`49��Hu��9y�r�����_J�2�C�i���,F��5X�$�~���PO�d6�Q7�!��l�ЗY`�|b�-0{)^��\Ѻ���v"��4� _zV�.L��um�ףjܭ�j~�Z~�U���F+���V)��FG�=�!�/;���q�#Nl��359��c�қ�M|u��IM���V��!Ma���6�d}z�,{��lf��ތ���!T	]q|����F�فl-��?\���f��v[�&\�mch��ǚI[�v� ܭ�scؑJ٤WFl�a?������H��xu����F��pAfB��hLS��s�-d�ڲ���������h5�mΚ��˵԰��i����iU���=�"H�+��T�{.��|�I��:���� �5�XЛ�A���J�4Ǧ�p�d��x`c�K��0o+i̫�ݛ���sHqY�	$��g�7�_=��zTة��}��x�C0�F�&*.u�\m0��-�}����Ȭ���HGܠK����8h-!�����s�����jnV��,�o�h����O>CC��:�<�����.f����O�I�&��N���Jik��j��n
#\k$Q���r ��?h���)W�ՠ�i4�l��Bkea��6	�<�<���5����<*���2�'VL�K�1�%:�1_}U,,W��hF�s��p�E^��,ܦ1ˠHݡB�6��м>@�YoO����q�p�m>"����dt�}�o���ll�C���g�vS�;`�J40\�f�_WB ġ �V�ǈ�b=h����x��خ-]c�[����`)g�� n��@��D��\t�n8�Rx���;���n��o7�w�GLѥ�s ,`�1��<�1瑤9&�<��,���_���3����ᠭ��!}y/�X�4�F`�~b��vO�_%���5-��[1�����HBtT�\�#a�G[/FSp+Ɔ%4�%O٤hY��S/�\3U�Y�e#5u%��#�xٜ{�C/u��)]�=�U�wR^�ۇBv���o�m��,�a�&m��R�&O��ky1(,[�g
���~�Un���/��q��nf��A;�+���S;��5��Ǚ�k�;�0�۳#K�߂-T+��F�w�o�cP&�"o�^:ɢ.I�TA#�N�\1�պ-q�p�8J�x����-`�ح�Nr��e���w�'�]��T�,�$�l�J�x�Ɂ�����R� ��hx_��ȫ�$+z?ޥ�7�Ф�!zv�1EB��9ܡ�ʷX��Ќ�����9����s:&�B�%l������.���y��k �U��be������J��[ړ�p"�2�Z��j��8b@ѓ$xC�I����ya��p�.�/��3�j���-�^"����|�d�4G��OB�0KD��9��kt��������vWӵ����8%N�s��zq�ǊH x���h��s	%�L��Ԟ��I�?�  �hL��,LfJq����!:Z���b�ؚ�-���a<jjj5}�k:���[�X)�+�o��|�n�R�Z U����j6D١���4�����6>ȇ��9�)��=K(h7?��f�����Y�;}��tbO�-I^�k]�x�G��IY�k9�2�;�wT�ż��~�R���F���J"��j��rկu;�r�Ҋ�a�'c�x�1А^�	��R:�,u%�8P1[�;�S�o1��͝�댓I�.��,>K�3��KW�n�wR��H(O�L����+-�� ����z���l��k?M��.̹��C�=�L�{n���(Hƽx��D'H?��=�`���l�<u��}Q�p�,mA6�܃��f5[��!��*�t�%#/�}nӛ}0dH3ļ� �r�#�t|�+y��ݸ��,̋!E��w�&�!:����(wq���!��`�Du|����-��u�8��AfP8p�4XM~z�|2"�r��;�[�%f��S��N�o5#�����Sgn���!�Y��6���`j���[�)M��籐�!s>�3��l+BE��F����xjb��<y��}9�E��g�Go��S�R�-M�\�{k�$�����f��ZFiu���(�U�ĥ,�M٠��&����C�ٯv�z�\� <����I��V�W�F#��Q�U�0��^`�������xí���1��
���s��c~ʵʋus߄H��b9O㡕��?� g�PC*�М�"$�E*�dE���6'�<��t�����#U*�(��VT+���UTe_��m���w ��zk��r�Z&�4��'�#W����M���P��b���F�jXSr�{K�u�U�B�E͘���b$X�HP�<]���H��V��Ơ=:�O�b.�/� s�x?J�z���`e�ĥz�@�G��� �94�7���4�"N`hr�L8/-6��[�q��dݐ�9<�뱐��يx_O���'�%�R53�,r^�E��<Ԧ^�۶�M޼P�Y���]��NR	mJ�h�J�P,�M`�t2��-���C�^��\3LT�>��ܶ�gpo	�6���HlŅl���(�g%���IW_�#|0�j8厄xN I���#����T �%{�C�M��C��hp����m&�&I�����;ϒC�-b��^�5    <�+�\ ��N���0[YS^�g����<���	���@�R4d{Ac
صh�띨]���f���q��t�U�֎�n+
��Ny��߭5��Z��'ո�כպ��$m�Z�Ԃn'H����3+����wl�	�_~P���c�{@!�Ef*�m�@��*{�;��S:w�1��P�D�ݢ�9*!��8�z����Te�L�-�C��\�s.O�nܫ?*z[���[ɠ�K�b2��H��߮x$<��M�"�%o�w�RK�yG������	j.��Й�����0�S�ibZ��-y`�"Z�$G�f���sΒ/D��Y�-L�62eg�%��ܦ�<���0<�ʾ9G(��j6�;�����fF�wz{�\��ߥ�����|��[2ߘ�%�Ґ�u[`4:ps��*P;s���?�Hƚ�g؋Ex	g�O��7=!���p:F��x��̓'4�����A�[�O�r�S��9�{�#�+�	��m�;c\#���jȺD��[N�=М!pT?��@�aȍ)��(�8�G�Cf�8�^I�5Z��Gxz��-��C�^s����W/ၖ���2�E�G:�Y�R�R�h�t�T��e���P��mg� W��tf��Vii�b���e��'�H��\�Q���I��qݯ�ڕj�]����^�GI��,g��~a'��bc�W�m������Jo�2�K9�k�19ǝ��5g�ء�y\f��͋ͭ���қN�6�U>�E�&�mo��`L�p��R�6:)�r��<8�+�9�2��.�2k�,��7ˆ�}�d[<�Y4a�����?Q�I2<j��9��b�gXE��q0I��(RA���0 �?��Du�ぺ���!'9�%�T�T���5�����5��->�P�\<�ݯ�n�Z�2t����Τ���m8�9K�-M�BĝNW4�ckĳ��O�[M�)��I�P��'�pTyK�ƺ�vѶ�jZ(5M�&�a���YQU����ɻ���wBxB��#�\
>Ʃ��V��{�Y����"��Qe��K�Y2R��#Y��"�
����e9^q{�6�b2�A�d=��1!c	[�le�����PQ�ŷ�2Zxs�2���k���fe�ږ�u�f��SNA�Y���|�:Th �,6���_mG�j����.x"a%���Jŏ�A���n��@1�r��P"�O#_,��f�MS5F�Q&6�Ff���w��I"U1�����z��e��, ����E�̀�8H:�]���Y[�ǾR,�Kc��B�)VM;`tl��o�>�Lq�Pc(Q �"ދ~�2--���~��2(� ��L$�E��\�l���#�'X�Q�������[;�����\��t�Br�I��n���;�0�TD�[>*�	nBM'3�d���n�b�a��(���Whׂ)=�o�w2:3�iq��MF�*'�`�k��ݧ)b��0��W�H��m�Y	��s�i��GY��� � ������%�u4	N:�@���{Z���̚[�S�3�е�).�M�oз_ɔ�'�^8FT{�DP��5���HC{�ioIm���Tt�"Ei�sXH.�na�<ݩ+�o�mz'��)B�[22oR�2��A�<�Ҭ����܆�Qxm�Z�a%�v���zT�ѫ�I=��Z���6%GL�u��O�!���ϳ����J�:����-lK���S=}R���X���b>=�	��~�hv3�@�_tr��IC���R�iu��V�����ʌm/Q�޺���bP�	��af��"Kb�bk"����$�����*����#+�-=p 6WN���nc�כ|b�����T~`��l\�t`�Hh���{�{t%|6P��4n��hD,�	���񁗽Z� <N��?%'�P�Bg���`JHsW��r�md�Y<�a��0m��+5-��R�O���g?u�3�%������-j�9C9��>
�5`~M�������K���!���G�H�
�� �\F�"��.Pnud���^y����!cZ&��2κ.d\���?�%�*R��͘A+h�o�_}��Qu ��V4X��f-�Wq���x[�	���,�AX�Ւ0��vc/<������/=H��n�rȗ�5���ʥ>�����Q4%��я����q0�96�9�)� �+�)�����{�ř�F�F��}�9�x]F����悥��."wئ��hF�ě��2����Lğ��-�B�<0f�y���12��J<�{4(⦦iʸp��rw��'�^��DJ����p�&%�!��/~�)�_�3炲d��F6�`���!N�����jr��MM�S�D|��Akp�(հL$E��L�;�Bںqo?A�t��'ĶS�Nt.�u�q��!$����i�E�#K�+�<�N��&d�� k£�wƐ��N�q���i&4T�,�Qpr�����{I� ����?�� ���h`��/ٷ}�jEM]k;_��,J���,�A��F#
�vՏ� �M��ߩ���_�t˭n�ӎ��	����)�_*HZ�ɺ�%�U����W3�1�}u�YM�6T�U���5�����5�J�˵�Kh����e�H7�){g�pq�R�םg��tė�K�{b����3xp��y"���Xd�<0������j�9`$70�
��-O,�tb��3���4� ��j��J�.�O�oebOL�Q�!��AD�D��u�*�S颌�x{B	;}!]�7��Q���c�o�B9�ц�������#,��Q����)E
�ʥ|:r�q��U� V���zl2����; G;/�2��9 H��G@��M�Ñ�b���ZIe�������x(_w��q��4����j�Q� �^RsrJ��U����%���i��~4���]�kaK��6�����r��Zq���뎆�
;C�EGa��QLo/ӌ��Ӥs)$�� �(W�3K��)�a�$�/��5 %x�1�F˂����vVh���1T�Z�!W����C�>�K��tP���r��d7�o���=E>M��rYR־㔧�G [��]{ ��d\N͓���AK�j#��k�hw��6O3�x�o�<�#c[�'�A��
�7�D���d!z:��� ���k��UIq��TdaK���klW�&��J��!�E��g9�P�G҆��d�1�ȀR���ꆘ��q��r�Mʝ�<db�Ӽ�}�I�������=���vC�-�7�v��:��%I��\M��,�YS{��"�2��-�*2�J3�����UO�Qïwò�N:�q9i'a�ŕ��7������W>��7��P܎Q�D�d�LQ\�z!�K�4���U���,ͥj�Q_�����
� y���gv�.��΃;�
н.��L)CpĢ^�8�}T��{�V9��)�T�`D.&iV�nm2���r�LsG���]���N�\j_���Ǳ�J��!|����#9��F�Ѥ���s��O�c�G�ä����؋~����߂9���DFK�4�
���9~����˿�D4"8����Xʅ�f*z� ��p"-%YSL[O��]ڑ���X&��UXf��oM�M�H�^��Ȧ�g>�]���a /''�L���g�DG�~�wL��g8�`L!��HR3��-_�9�R��2����'�z(iy�oS�*:���g�1$�
�J�8����)x'�.7��D9V�/�h�iRp�����Ꮥ�V%%��\�T�ơ�@�?Z� }�`D���I4!#��_S���)"]�Ǝ͌�h���=�!��=,��-m�7��Z�ݮ�ݠ*�Vi5��UI�V���ըӪ��+Ity)s�_�h����|v9��GcM�33�ZJ�A�t�V�O�L�6����r�Rm�����΢a�{�2j�0���?�Ӣ$��&�ͅG��*e��ʐt���"���C�P2��$��`GB��\(.��a����J�S%���W���ފ"�Ꮢ�	w��\�$����2�4hL�>��G6Y1�����[��>z+�<���b�)�4㰉�\�PXzH���q�;�L�c`n�uAֲ0<j����>�щ_}ie.�<GOf�]���D    ݵ�=tܚ�Fug�%3�ع�bJ�,wVx�bf{�m���&�������ª�[I��ͺ�k�Z��,7�ڞ�"�?3HRTc�%�^�1{����+�D�k&�d�a\�㹑)�S!����%��D�{�ɭ�R�HZZ��&�;�H�J��;S#�u���gp�,������Ē�5��r�4F?��琯�6�e�A��2(���!���UR����G3��f�*�M'��!�3k
��"�~�J���9�����S�LMa􃰎XL@F��Ka&JV�i}����Ը�&`��ƌ*�/�@� D�k�*X�y������-�n�o{�!�2�I0�%�as&��$`�{Ѵ?��x"}D�i~�^�6l�K�wVȐ)#�`�U�@v��9��cQN�/1=F��"�q�$�_��ԔF�����8/	<�gϙ���qx�`R=���=U=�8I~�K�f¡�о2�0�Ԇ�T�=��]M�x�`S�b��S�~��%%�m�jٰIv,Ɉ�o�<Ѕ��`�����"N���|䊄6�,�3{r�=�hl%����XJ�� ����cF?	ĥ5��i����tУ�9o�������^�"�th|n(Mޫy|�$F�u��a,�OLt�3���̺c̶W�'�:��)y���pH'��~�{�慎����]a]��y��L�/Вާz4sX����[�EJ�?#;�7�����G8�
���p#mI,�L2@��f"�ImnL:�i��W��=�Z����I����fO"b�R��6�.�r_���v�Y�T�Z�Y�d��p9�VX��ʭZ��Wُj���.�~�^>f����JS��Iܨ֠.h��i��Ggh��{1���:���q���Qq�DUw�˜؛啑�����\`v���Do��ē'�����H�!�Nlm�~:U�����J�GP^ֿ�s�^`Z��F���¨Q��~1\��
�������E�h��!5Kxj���D#FW.ߌfDc���ꪰ!Ω�����	{��S�142��Ũ�2'Q�(ͧ\�ʒ�{��>s~9��a2���5?��C6g���>�]��T��}����-EY'�T���O��
� ����L`\��x݃�2d	}�զvM3����WX��2��́�=��)W���^%E�i���@�7���b���_��ܵ��yL�d�2bu;%�>�9;}�;l� \FA�S�oW�V�])��(���J��wZhٮ��A�R�=to{]����6���$U�𑯍`Ȇ����Y���l��2Y�h�D�Y�wl �x3�&3��v������P-��x""���6f�P�l'5��8{5e�e9��C��	�x����υ���<.:��+�2�6�AD��8��a �������TF�d���6@�z7`0�������{s�CgLX��q�)4�ze����-�,��� 9c��$�eFf��Cwp���
���a_q�R�* ���f�{�y���Y�/%Tb.ZR݉�%q�Xj4�(�z'�� � b�3<��<�QO�5	�[�0I@��ո���]��U١����p�z^7�&��5~�{N�IL��@���dJ�Q���r���cڌ�u�2���'G�PJ��\�1t>B��4�c4��Y��_(4�ċ%�>��·���Sn	oК@P[��¶��ٜ`nj��s��[s���m���ՠ��~�[Q]-n�A����� ���0�- X�i�	���T�������4���b�N9�2�E�fI�n��֕�0�V�}�V�����R��� �9{f�)D>�E�e�הvnY��ꍳ�?$Fe2�Pݣ �PR��4F�=��PS(.��`��h8<Fw��!Pq���[��Nޣ/N�!.E�cߟ�v�Aބ[/d_�[�[_�Ã?�Moz�� wT�eP������IJ�JV�)j�
�g�F;`u����kS:x��%w�fs�X��0T?	����3r�x8�S]c���3��p%�O	�CJl?�{�p�6	����7��љ�8p�����~�%��gs:_�J������%�%s���L6ߠ���4G��^??�hc���?�V�U�i�F1���,�dE��Bg�+h����v�ҪT+~T�
��iT� n����i�;Q�֨@�c2�����F�e���ӯS��0�I��$jƝ#*�7PGk#��Ke8��]Ws��R�s�HR�ʊ�T᪌�3F�*�Nz	�sf������Srm�:�w4}{����0���x��p
�SYG��?�9B�3�'V�	S�)��ωj���J_�S�	���%sa����R-��x�0�,;6E�'�`�0��L2���:����Od!%�Lh���-��ܗ�DJN������89��G�χ!3��N$hM��2����~�˕�q�>��LkE9PM��|f�l�?7�#�=n��9u�k�犹�kD��/����$Y<��ep��M�T��Ld�? ^���$WF�%!/�@�?/͌P9��r)k�Q�լ����L��u��&zK]���"+��7p���J$g^ηDw���.r�1�,ۮ��S��8�-h��a;��������
#��f�wD�u;�rخ��e�
W�R�/������<320�dtn8��W��J�k;�&�&�Iy#�;�N^YĚy��61m�Y�ć��#���kβZg����s�ڑ3��������fU�M�{!6�����C��Ԣ�AR �D@�����L#iJ�&K�>��@�wŵ%1�x�D���"Fv1Ic���3g�	 k�a4�,䕚e�R�T0����g���6��',g�m^#��b�������F�#�xq��Nr7��i)�2�����(	�}Be��:+
aP�(�N������C���{''��,wQj-���D]	���cH�-��D�V`��kvR�|��;+����Q�Hу>�i�Z�t��+k��r.�<��i{AϦ��?} 6��g%���MEk��L]=��o-K8���F�Z�H��ӹ)nI1��ܯ5��N9��Q�����z��t�myQ�zR��-�X��=e�����촄ɯ�`�����h��K���z�y�XVצ�[�tż�]=����ۓy��Ӽp�J�Hx�ֆȑ�EjAwv}~�=!qI��Lΰ@9|L������2��`�d�~EɄ�@횼�7R˒gh�I}�
r��ޠ��[�5���a8�Ѹáw4�p������Û�hS���x�!!ٙ�XH��J��	a}c����5�6�h葈{'
��GUx���
�!N1Bx�O���'Dl>7�hI�9�R z�l=����gk��Q��l�?p����c0���WEGiM��]�e�D��A��	�xt��p˙��:ʕf�t��x27���o)moҽ�J��,=�����DaO�C�HZ�#, t�V�C��D�R�*_�[�0�0m%Cȥ��bF����LO��.Q����������TGo�6I���>���e���|��D����ʜs��zm��t�Oįä�]�^oNF�ڲ���ѵ;	_�[h����Jٯ� �ۈE����F�ӌZ��^E�QLh�Xk�����S=Gk�)�O��&Ǌ[�Z��Q̓��B^R��K�'� O�~��Z�כ�В�.j�Zπ`�������g)�l��u�y�K���`J4��K�Ƒ�%O�_�'Z�1N�x8OQ;�niN%Rt��2��gB�"��[���e5M�.i���Kr�O�� �:&$f�?�0c=Lx�F��S��Ɩ��FK�����:�h����L��JzN�>��SY26�'��ܟ�5��q�Ef8��v�7����4L���Q4��if����*�B�{��ό�׈ǜ�E9@��_��"�ݜ�����S��%�1p�����+"p��@Q{҃��dqz��1�z��Dl��IG:�A��3K��I}���{䵐3�3V�.jf�{��x��z��IFcD�����`gͽ�(�������l�j�=�(�f}d鐌���g��[�+ �	  ��IJ�����6ê}S7��W_�M2R٦�0�'����������o�iY�Zܑ)#@쑅<��~��Fv����C��a��o�t�n՚IyO(/�~�/}$oB=O���J���j�5/����iu�sϮ�P�T��B��S� g!����7t��0{����4ru�q�kW����p���ݷ���F�գޤ��s��KT!D"����p4�,9���)��I08o�N'S<4�R!� U.$�
�oO(7�c��]r�%.w�N�c���	�Kr$ʔ�>���_����|؝���v�1�ZM���y��gY�!gK�Ж5f,� S!���17B-, s�$�t���G��pweE�x�hĹ[��5Lԫ�ϕ�^fM]�M��vrˣQ� <�k�ڸ�2`�Q�(Ub�a�;kơ�|#|�S�"�+:V�o��%~��&-��EשHQ����j���Bsx�[�M�x5ġA��xl�[���L������\��I@��I �t$-@z}d�$��!���ڧ���tz����W޵��QE�u�+\6�'J{b�X$$�lƞ1v{,�Cʎ&�T� R� *�I�I�&�_��G��y�!`Ů��f�c�9�;���+�� rIL����$%U���o9Xx�#S}�r�����_�?��Թ ��?n F��d#1�9K=��Ι:���:[N�����d�OP�-Y��h��I@iύ�א�W+�XR� �8�RG�c�">Pw�Wf:����aKܲ�J�?���uLhU���p�Z���t$���Q����_�@h�î� �b�~���4����앁s�������>R����6O�)á��'[Ǖ�JX�WP�?�u9�ՓZ�x��Vk�B���n-<: 뙞7�n\x��fǋz-?j������L��8�:��pN>�|��p�i�"d��L���oq����J��r�� ������\�Q�ϒ�qzߝ|�TP���B�p��#���(�����$�[+��)@F"�|R��(v9�ͱ��f+Θ&�઼$szn��[?~	��+{�Y4����ܹ�(c
T��#2KW� �W�.pN���p����J�xr]�
dM����^�!����r#F�g�t��_�5� �ڸ�;)A�/�K�8S,�)�W�x� ��R1t���a0��Vp�O�b�K^�m_��R�(��.{U�ءq� 1Tj�T��4 ����2��#�*/�&�a ��[p�1��GY�3�A_��	�yPrM�x��ܐt#�f��jKl��3� � �3˼�q�cv'k6^�T׋֓ 7�4��0���F~;�^�����{]�3/8lE�N���;�Z�� �<�z�#�ڠ�u�ݖ��������GQ�3�#�b'���-����l�#��	N�13%n�K���+�saO�{�$8Ph-֫+ٔ���>)���]) -����}&&�@�T�Up{���8��ݙQ.�3��f��U�&��d�0��[%4Ï�ۢ�����7��#CG�-M(0c�9�+�k?S�s}}�G�M��%���ѫ�׌�׈X?=	��O%��s�ml��l��D��a��2���d�d���LG���pz��lF���,���j1�͟Lֵ��n��#�F�Wh���ǌ<�P��=����:G��'�܃`�����K�q,��ȴ��6/���>*��S7^��ʞ�-��X%9�M}>�g�W$$t\�, ���Z��H�"�����ޥ�{�4����4<������q���!rb�.t���d�'MeW��eG�{��-3c7�j����[��h9� ��`�"�lҀר�ҏ�W��g���i��_��� B/�U�L�'%!~�����Z��������<��{�f���j�=����0<h��8f�N,v>�Gqإ����t?
"f�e��(J!�T ęS���1� -���ٶ9�"oH�9�Z�rK�����r�Ȗp[�Ɖ��_�iT�VV����xz�}P>��*��!�$��T�3�����@�NI�0�t!>���@&�VZG؀ɾ��S~�����̚%X�:B�_�:��k4^9�I<��©fs�!��;	r%f�ub�-,kk|�G>{����z�4��<�� �4
�����ߟ�T�4�ᳺVU7f�һhR�w�nm,����V X�4KC/�4�C�q��^z�W�{�w�����t��!��~�C�7�Y<��]53s��=�c���u���I�#�b���.U�E(�e��R�J"��
ZA9g���m�~R\f��G�z�?��o0�׿SÊf���1���Z�U�=��h_g]?�gF�O\�2"�8Q�Ap�!����߉+������;捂������4�-$d�� g՚�1����yS��K��RAL�GL YmK2��*'�r�q���^�V��b�      $   ]	  x��Y[�;��NV��5��[R�e~�\������q�R���t�<<�Ei:T�&Q�d]"վsb�b�J��R�L1#���,�H��&�>d�p�u͵�>/�e�y�R��6+�H�t		~,�w�;ѝ�M����H�B����w��K!�?V��~S.[�q�:>b;�Q9�,yM��j����l+�aOu�ή)����d��%�9�p��z�L"vV�������֠$ZR��S�m.oZ"ۥ���xh�d�2�nOڧ�RÝ��p9�@���DQ�3�/p�+�អ4��A��i��ij�qI�u�2�p�z�e��u���#�|	��O����g�܊oX_��&ϊ_[ e_k��Kj
)x�7P����J���������-e�����հ����K�S��y�T�7@E��|q�RG	�$j2ߊNI�F��*��
��]n��~����6O��¥�����_�m作z4�
�`��'S���U����
/����揸��(.����!�N�-K32���6�_����	�Ē�* ��A�내5��<Z@�#TT���U�{�y��ܝ�)+'��y�U
T�t��pv��=���|N 7M�=��h�l�/���4���0����a�.�ċ{^��L��{_Vw�$X� ����^�$u�T�Zo���N������8s�)��zC;핤cYZ�� Le�I��dA���9�Į�ə���Q*l����U.���d�L�"&Ι}՝)�vʝQ��g��@o�8h�/�"B�+Ձ���2dgY~�ލ�� i-o�_�k3U�+"�#pEQ8"?���-ڮ�����V�ʹ�V�?��:�_��&���5���ivjE����~����ժ�����ن�<��`\k  ��Jav*�lL�fH ^��~~���I�}���B�߅�w�=�;j�!�|$��%�oLY�v&&	�`�jż�|	� �kƠ�1�ꦉm|�}�!sCWiϔ�B�2�`Hu��Hv����"2��`szWF�M̽'��O�8m�[�	�|��~��N��F��}$
����guu������7�c�,[3���Z��-Uv�q�����T��Vg���j����
Cٗ�Y�H�jAu�9��6u�����W\�n�ܼ��63M��X��\<��k_���%{eM~vbp>б��ZXO�yE>��>�s���Z~����lL�E���BQ�߶(�'_�����hC@�^�(+oJ_��;M��2��D������g�	C����u�R	�r�5�րMC+��9*�#%�mG��9/�?�k/p{F��y�����"����r#��H�{�C�Xb�:�4%b1a�i�2��+��u!C@�08Q91�����B�r�3|���ac#�58��='o��Z�+1��Z�y�q�P=� C������ ��7���]����J�f�x��RNCV�^lb>)? 1�En�0����k�S�p�[�C]?�:F���/�>Jë"�=a��G�}R�Y{77W"x5Bfn9��1���������`6����qo"�N<��686�??���O��c����xP=Oz������n���"��T{���vS=L�y?}�w��Õ�Gdx�z��Ƚe�]`���ێ���+F�]�:m"[����F;����ԊQ�"�d����aZD�H�yh		��S7h.�-,l�����p�q���%�&��cׯ������>�w#x�4����pc9�1�m��Wk<z6L�^�(�8�2;V��_���ܘ`�? ���'gF�4-�~�;N0�L]E�2�u'��V��w��L[��	<_��A��[=�H��ٌ�sΙ��P��������2����+�s3�=�]_�Ǟ���s�[@p��*՗꒍:Ll9��6`n~8/]<f��v-����Q~�!��	���#/nB�W:etW�E�/��_V��|�"@Bx
�2$���
��܋TX�`nLg�'kK��b���������ˢ=j;Ǩ��&1��j��!O@�� �;���LV� Co ���C�������Cl/�,hi.���1�c��^:anz,�k�	���q�.�?�v�l�N\�.��O@���Շ�";��D[�݂t�T�Ӵ��:r�����1a��] )0�	�3��}x�%�z���V�A-cc��"�I>턚�`6 d�ҮcX�V>Z�i���HJ���Hϭ��#��]o.���}�z�68�L����X-���`�������K�v·h�3����ƹ�aPI�_U�7@����wc|N���x�\�("�"���*������~p~�'�Q�`F.n>���~�5�����*=��n߾}��<>      %   ~	  x��[[o��~��!@[�T)���%h�4Yt7	��m 9��J�KR��_��N��@��֢�kY�ֲ,i���zΙ!Eْ��l^6�83�s��93Q�(r��7U�`���+�iie5ojZ�5�R�qö��i���T�(ԊV�TnUr�\N+q���o�O��m�Y�<5[���/m޲�s׬����3���=�����Qa�f���ڮ�[�7�cq�sܯ�&n܄8�|�§}2+�]��Nv�&�ZH��37q�_o��V�Ar[f��O��J�T��R9�dP�,�!�#�n��=%H�^R��]��M����_wZ^���n��~V����V_[�W}�wSa����[��.Z�n(k�kg��ߚ�ml,"2�}�6�3�%��,4��z��)��_u}Y�|��}�,����ʷ�����}�"��{����F����>���AȀ�/r����.��Y���\&z�Ac���������e��\��E��W�*8~�b٪n�M���p[C�C��j�g�g�e3�ßq�r��h�~��Npt����Zxf� <���&<�£���9z0�����q�	_}���!��a�3z���b?���c�&�aj �=�#�Һ��Ma�h�� ^���0?��,����w� ����X�;&��(ixt᳏�Ǹ'q
ϰ,<
����>b$��"Y��c$�9"Ս��n,�H����b�;�Q�&r/fA�#`� �]_o���I%(�~xr��ٍ4�"փ�~��}�|�s_a�N���8g&�BP�-��q��/�J���>j	�_!�.��]`�c�8} @6�F ��ԇ|!2�D�o���ՙ]$�m�*���x>�7��7[�"��=�;�
��ۻs$����NpU��,�G��u�SX�nLl��V���w�t	.�l�Y�rxo��")���j�g��0�'���KZӝqE�5��Bm4!�n)쯜����h��;hf��M��V�A��:`e���`6d�i^R`+�-���)sD���d	g�w���U���0�wV��H\��=��vw����<�����%��%���
Ik��x���
8��!d8�'� 1�H�nxJ�ϑ	ρ�1B��GJ��4��
�h���1������ $2Ǖ@���0<����{@���fc������+B`0�KB{"v��&��%��P����Hn�J63M�_�N{��a�s%�̩V�,�F�[j� ��V*kF�`�~Q�qJ�k��.�&{{�Ǖ�k������P��ɞ���i�Q1L�V,M�=�>�=�;������ڥ�=��ǲ�����1�	�G"韠EIZ�	�:T��D�٥;�?x��~�C�B?BǗ�����J�@�y�Yc*��%[s��X�\�D4��H�C�p��sJL�2�!D�D��{1�bp�,W�����L�}	�t4"-w1�>�8��E�����K�3Sf���eҍ ��&�߻&����q�!��JpB� �Pha�.2��,^��?%\M��t�#µcYW�������������pҗF�����<m?��S/�ǅ�*�����2\�rK�B��Qq���s���@������Cܹmd�i���崖2l�K� ꡃ���2He�y$�K�Z���2�� .�D��,K�%hHث7->$%��Q�,��!��G����!FT]��M���b$�[�0*e�ۧ�H7��g� �*,�w��T6F�@�A��)�s��e��N�4)7�L�T���M2���'��zM�q�b�բiB�]��U]�T�.檚Q��%>��>���	�x�i��♵��b%��C�,$���o��]�=-������ qO��#�+��_�_XMt��L;d�t�I规5�a�$v���OV2(e쎉�ɏ鯟'���b/�����ʉ7�T�O���Jb-�$�C ���r+��68��
T�$���(U��iv!�>�f��mp�噽���v�_�$���b��1��@�]�m�۪)2�/�'��.�P�]������3y�;�?fb!Ac.�QK'2.g.7m������  �:��*�w:�:���Җ���@s9�T�rΤ9Q��Y�)�L�.����k�I��Aɥ�'ϗ�g�ԛ�!�,r'E{t"5���*7DK�u$��,��vV�v�=r�4����9tz��C����9tz���~c����h��_>G���&Hk��&Hk��&Hk��&��5�C�z;�����pz;���������O��mzA�^Ц��mzA�>icoO��T�밽����B^-�u�U��*�T\-�J5��م�i=�9����e�W�R^S�V�����]�tݴ���o�J�����o�QN�ۼ��o��ޓH�'�p=�����g�W�      &   f   x����0�s����8M=;TBn�ÁT�؞��H�XPX[���q�5,՜=d��/~�4"��yT���&��RII�M��_��v`���OZ/D�ft      '   w   x�eϻ1�:���w	�	�{Jq���Q E&rZ�l'�I����l���M��}C%'�9�0=i�Q�|�/�K�Fw�$�O�u�vw,t�.���U����\��w�w�1��;     