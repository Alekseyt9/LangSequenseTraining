PGDMP     )                    {            LangSequenceTraining #   14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)    15.3 #    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    210   4,       $          0    16400    UserSequenceProgress 
   TABLE DATA           �   COPY public."UserSequenceProgress" ("Id", "SequenceId", "UserId", "StartTime", "LastUpdateTime", "Stage", "LastSuccess") FROM stdin;
    public          postgres    false    211   ��       %          0    16404 	   UserState 
   TABLE DATA           >   COPY public."UserState" ("Id", "UserId", "State") FROM stdin;
    public          postgres    false    212   ��       &          0    16409    Users 
   TABLE DATA           /   COPY public."Users" ("Id", "Name") FROM stdin;
    public          postgres    false    213   �       '          0    16414    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    214   ��       �           2606    16420    SequenceGroup PK_SequenceGroup 
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
       public          postgres    false    213    212    3216            "   d  x���ˍ1 ��4@�1��K.~Q�jSB�"嘤�����X�,Y��R!�PL2�+��60l���q��߯�~~i���v������s��~�k�YsÞa�^�}O�-��Y�|R�(�sAB��݀��b��n�P�'U�r�&i�65��d �r0g��sx�]��I�Q��%�z�^&�m
lc�X$PfU�R�KR|�9dN� ��Rx�Z����2ח��Q��-�����D`�VD��v��{Rt�)dJö��9�ج�1��V�4��dz�5dMK�g�Li�����2ːZ��K��Q.!����8��gޝbR��WL�Ϲ�K?㹡�1}��R����      #      x�̽Y�[ٕ&��+���� O���z\����mF�r&F�b�a
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
�!N1Bx�O���'Dl>7�hI�9�R z�l=����gk��Q��l�?p����c0���WEGiM��]�e�D��A��	�xt��p˙��:ʕf�t��x27���o)moҽ�J��,=�����DaO�C�HZ�#, t�V�C��D�R�*_�[�0�0m%Cȥ��bF����LO��.Q����������TGo�6I���>���e���|��D����ʜs��zm��t�Oįä�]�^oNF�ڲ���ѵ;	_�[h����Jٯ� �ۈE����F�ӌZ��^E�QLh�Xk�����S=Gk�)�O��&Ǌ[�Z��Q̓��B^R��K�'� O�~��Z�כ�В�.j�Zπ`�������g)�l��u�y�K���`J4��K�Ƒ�%O�_�'Z�1N�x8OQ;�niN%Rt��2��gB�"��[���e5M�.i���Kr�O�� �:&$f�?�0c=Lx�F��S��Ɩ��FK�����:�h����L��JzN�>��SY26�'��ܟ�5��q�Ef8��v�7����4L���Q4��if����*�B�{��ό�׈ǜ�E9@��_��"�ݜ�����S��%�1p�����+"p��@Q{҃��dqz��1�z��Dl��IG:�A��3K��I}���{䵐3�3V�.jf�{��x��z��IFcD�����`gͽ�(�������l�j�=�(�f}d鐌���g��[�+    ��IJ�����6ê}S7��W_�M2R٦�0�'����������o�iY�Zܑ)#@쑅<��~��Fv����C��a��o�t�n՚IyO(/�~�/}$oB=O���J���j�5/����iu�sϮ�P�T��B��S� g!����7t��0{����4ru�q�kW����p���ݷ���F�գޤ��s��KT!D"����p4�,9���)��I08o�N'S<4�R!� U.$�
�oO(7�c��]r�%.w�N�c���	�Kr$ʔ�>���_����|؝���v�1�ZM���y��gY�!gK�Ж5f,� S!���17B-, s�$�t���G��pweE�x�hĹ[��5Lԫ�ϕ�^fM]�M��vrˣQ� <�k�ڸ�2`�Q�(Ub�a�;kơ�|#|�S�"�+:V�o��%~��&-��EשHQ����j���Bsx�[�M�x5ġA��xl�[���L������\��I@��I �t$-@z}d�$��!���ڧ���tz�����޷���ei��_��Ɠ�h���M�P�=�Mw*�B�	�&�|����Uʮ�r�Yit�7TWNu/z5HY�lY��Gs���s#�d�ie%0tҢ7�q����� �!=D����X��C�WOR`�;[[O����������	��p5�R6]������)C���ؖ�t8<�Ga�� ,�z8���I4��F�s�5��Պ6�X�v�RG�؄��L.��g�ٔ�˖xe�*��<�&���͔�"Q���ӜtD����2�V]��z�U�-��8�A�Ά�V��&2�u��ڕsN���'�~��uͼ��x(`���,��u`)\������9��D�z`ZO����_�j��~�]�^yo\��)w�N9�5ZQ���z���4	��h.�Oy�|l�M��7֩�LW�o�[s'V ��I�Tr�Q#_3��=��):o�݋�r	U7�|n@]Xe����>yR*.��a~V��4�Q��O2��)��=V<n�q��0Qo��K��O][���ρ8����(V �ts�!u�8�&�s��L��J�����s��5x�IT�V�b�\/l�&M��;��& �~9�'F�CPz���E�a tm<��>��g_���S�8ǡ�o9���`���KD�#W����OF�-?ɖC�yo��e��HiUu�Ы������ҠG`��@T���(c[zDZ���p����-x�@^"��;A���c*�A�5v�3��PC�� �N=�����g�N�HΔx����N�l|i���A�4�ϸ��^7j5�A��h�Z0�*w���A�֎:���{��~�1�V-�m��A���v�V/���n�Վ����1B]l9]���Oosl�J��&x��픨�^S�~7�97����"�h�=]������I�՘�+�Bˋ���}&$�}��>�p{����8o����Qn�s�/���r���MFsI�a:%�J�h���-��l�98�w�p�@���SLi���3u�0ַY<�nJ�Zbhay.|u���+ֿY��姖Rv���F��l>��N,`�~���G�)�Y�B�t���������E�fC򐋾iˤ҂��u�R���������}fāw�v_��'���p�ѣ`�$�,��������#�u,��x���V�,�׸T��2��?�;�:h�f&�ɿh���l��*(I WG&
�nb`�>2.��-����{�6���F��<��sW��R�utQ�߷�[���:QKOR{2Tv���g�}�*Y��P7C�on`���{�lDEq%	�-n�� �A�U�)�8�{u*��4��L�`?����� �[��#�I��_�A1\�o6:�J�Y+��a�ܨE�;��ܪ��F�߯��=O�����'?���2�_��G���bY�E�e��(sZוA�°XI���o�BN1�d)ﱻ�L��\�+�!=������vC�V�ڡrF�������.9w�B��N�3^+��	In�k�J�^K�j�ɹ��a�q2�fb�]���j9���BTܮ)���#��E�B�M�1�4�x]����G�ۼ'�#V["�޹���u���R���� i 1X�� �a<�����b�0��J�U݉%��5N;ژ��{��`��\z���^�[?������=�;�p���p��({�����p>�F�]�3����qn�o��E5�����	���R_�b���^+��Cة�- ��\q����&{��1K�z?��o0_��Ǌ�pP�q6G�5�B�p��Wbu�m����_qʑ̊�D2r,�S�l�/���
y�#v�)3�T5WJf�������.s@
p���� �h�y�����bALҐ��̶�-����*��pf�د���iuʝ
���J9 ���hW[�Z��{��<FJs�<G�?�E\�Z�:u�=C�&����#W,m��g����j �2�$�ۛ���W������<����U�F�Ȧfm)K!Ml�>�S�)PuN��p*����Iz����=GaLu� �olW�˘J���h�h����킥�#�a�.`��Cܒ���x���_/�W
���!�����K�LU��n���y4��.c��|�ެ���<��sβE��z[���Ԝ�5�< �[3��?���ƿ�`�3�s�I:�p�2WK�|���wò��h�Mx �,f�f�F&;]Y\#CXho���<���� �+H�j�e�e���PƩ��3k�'��%�l�_
eQk]��C79�3��9�S���-�~�g��񨊇��K�`�a�V^&"�q&Ǐ�ʚ)��$�+O:�(	Uc�fw�(F۵�+��?y�w��?���V�J���=�6z5$֕/K_��W�F����8�~�܍:�r+l�ڭ�6��=�KS�ۛ�ɱ�XN^��?a���gaN��D�K<��	�����J"�w_��F�/�b$�K{?����:\PK��[�A��kҦ U�;���S��wl�*?D�+&$[ƑB;];���������%_���NI�����"���㏇3q�\p_Bz�� ����є�Py�B��#4!�����T�&L�3�
���p?�LS\X
��H�w
���\N�B�� ��i!�.F�ዋCe�Bb�r���Kk�ɾ&B6rQ��� ��82GS"zŵCs!W��F�<=U�R��ms����~�{�޾]AEY�nϏ`�>�3n��Np���H)�ɛ��}.�B�1Z�%6��^�ۯ��m(>7��|[�/�ZAu�հ���h}�D��}r��`7�j�񞘯C�zߖ����5����d��xA.��{L��h�`�~G<YNnF�+_�����)��t��7���g�
���ЇC+T�R���N|�s3�_hi����D�➧���uą�3�]�G�����{T��AlUF����h炔X1T&�5P���!b# l���I4��(AQ�8�qVn�Ij���2
&%�l�����f`�N�3�6�FNd� �QJ��	bk����S1�5�]��9��`4z��A�ܸ��ԸJ`�{@��(��!+ճMt��w\�d��V�^��&�F�Z��}�9��魚�����gk�w�z�j�Q�@ut�2�-l6ʵA����(�{�G ��φ�o��g^l�=&SY�o�Ɇ����_s���`#��arV?].DB�iϱ=�d�T�z3=b;���i��pj���q��@<�~���$�{H����� ��X���O��E����Ҡ��y�8�Ni �KF� ��q�fuXy\V���l$��&3R*��
��)����y��rb�~���K¬�$v�JF���3�m�V�����R���F)��9�1�gq�f>3l�z˅����8x]ՠ/C�\�m�W�{*q�,Ͻ�Зh����w���^4T��;:0R!0�'��� +�pC w\��A����5���!��    ��l<
�v^d��m�ك|[���%��2�8����
��h��~�.���;�-f�o�z�����O�~����ڠa,o�]n��f��j�� j�۽f���tk�z}�4�Gc����~�>�O'�Sv�������+���+�߀WO��\XY�@KOd[D�We��,���RN]n|!��I>!�Dg��o��v��V��rb����0�񟠻����p6G<�=8?�0����K�m9�_�+�R2ܤ��YT����k��1%BU��2�Z��3Ĺ$���)�*�c}�֔�ۖ#P�GF�{���mV����߀S�XV���;��d2�RU �$�l@�Վ��g4���Hr�x9�y��O�b��@����V���@Mˠ>r���X+z�Uȸ�h<i6`�^�=����E&�w�u�(�O{��q���#M�>����D�3%ז�h[_��i�m7����̂n1�������^Ν��l�7X+���a�
:��~Ti��~�RnF��J�[i��Q7�t�A���\8�EF8
�W9�޲f�:�����+�/�T������l�<p�ͅ�C���|�Y�$��a�����Bd�2���Ե�5`ɉ�82��F|���'�0U~�/6��=z�"�c��z4]�g�eȼW�u`s��M���5�&�[�B��FC;�w �k�`���i���E��Ƭ%�Q�2�f�O�ɐ��u�na<	Q���>˦R;�.��x�$�#睑:z���J��E���r��R��G�̹/,���I�+�r�hm�C.��ſ+<�,�_=����"��L@q�Зs�dT�~AcytM��@[�Ӡ�Jr��'��ãR�b�S������g��d�D$.�-�1�̗����v�G�wް�8g�`NqO�[$�s�*0.�_�ċ���v�L_%)Ny'>.2�{�����7G:�ctn�s��}��f�Q�7���Wk�;A�.¨��J����0�Lf���'1��S�}�/�}A8E�KP�m�ϕ3/�9��	�M,fX&�?�S�v�9�p,�9��Ҽ�*I�i��,ӳ��rA��ڭm{�ɲw'�4nt������r��!���q�8��{2l��h�Ԟ��s��l��IyrILc��&H���`�gD�@�&���K��s�	�/Ek�j��Bb}��#����R�z�/}�����|נ�lb���?��Ձ�$T����_��e�y�"A�t�Y(Q���H�|�%*�q�#���'Ԍ?ql�W�Nu��L�������n��m���I%�}gDq�I�������)>j��u��moJ�8=cyo�;h4a�k\�����r�i��~5�*�f��l�U�[Ad\b�^n�+�r#��ۚ�rԯ�~�V�*�^"�i������j�y���i�|ܦd��ر#�<�۴��!�x��b�\;���L�J���A����T�d
����`�d�,��gŨXf,�5ˠ*�/�x:kMӲ�.�hq^�4�#֣�$ƹ*��:�];��D�Cb���A�*	��{�#4��bl늉0��[ �2�{�d2��������axL�� �1��UD�〳�G@�A[/w���^�s����8P�?���F���7��뗂�·����CLXז��y��� �O��g�0۱���y����߮K|υ��@k8uE�2%�06.��4����|E�+OÁb�3�/�@im�ܴ5Q��'�����	k_�w�[j¤����3��\������1y=���B���2c��{�]V	c!v�X8pӡ+B��U��0��j���M�ݓ��W*�/:��o�?�N���%�[�3��c�T&b�3���qSY�T̑����N��nUʵ^�|o�S/w�v��W3l��a����:OJ��v��w.����^��hS{����yc�q����Xқ�M�1��Ǝ*��u}R��K�nY�x�.�B���O�1[8�����Η�;!J|�K��pJZ�'y���Z�&V�ƛ���Lx�z�+�Y��<�'�[�oFIDeSL<7f��4 �5\�.u�wd����T��t��/?ߠļ�ͅ��jv\�n�5���)T�_�19��!�q*2��r.]�qZ��U�4������0���:�M��wy����&`�h>�q2�i��� ���&c5�Rm*|uL�����B��09��_�S�f��IE�kj#,�v��D�1��`gy�w��8x$��<Z��`�!��:{K���`d8[Ƒ4,�#5*�(p�߻W�"	�wC��R"���a�a��E���m��#-��hM�27\d��� Jm�rZ�nk��>a�]�5~��װd=p}��;�^}P��X��n�3(w:�J����Vs�AĎ=R0�̧���E���{"Nf�.�����**�04�k��.�S/�Y���R���yǕ�B�'��RvC�����)]#Dp��ɮ�:�lUvZ,���3�� ¹��$�C�Q��hc%~��By�*bH*��S�q��	ٚ��a�ȃ`�޶5�_y©ǥw�
\h���k���C�E��qD� q�"5��p�8�W����fh�(�J0Q��l�;��2�͏`I�fEގ�k�y�W����-����R���n
�͍����1�-��W��$�E�CR,�|ſ)a:?�F�U<�-!m���$l0Q4Ƕ�I2A�
����"����h�i7GP���qr��h<(yt��ۥ/E�+�Ѽ��ߢb���u��d�̓<#��W	QL;�ώ=LH���^J���Zٮε���5�a`��@����5���eC}���x7��]�I��i<b��M�ֹ;��ޡ\p�@����]3��A3}d��Fa��~��-����6�U�恍=���8)������+������z6z=׊R��h�����1<2b�(���en{6�Fz�2/��or��at[.q�DJÛ���sS�F�T���S�mU�3o*,��T����Qة�`�U��~�D$���+u�=�0�����bF4 ���{��?�GW��?��aҮ���$ts*C�n59D�pi�<������p�!~QÂ\,f.�a���N��f
n9Q˦B�r�8�������2�gS!�Ae� ��Kg���x������N�_�Zb���<SR��%VS�x$��2K��s�ȟ��-u"֢IP�W�2;[#�������!��`7���KLT��m��%X�a����(lX0=Z	ψ��C��`(�v������R2��6�K��b�"u&�:|�_;^r�nK`��� ����'���)�o����yP/��K�*z���rH�ܟ���$�̀��3�b\���.Y�n�R�-�v��PTUzJ :Z�uz��B��;�Lvii�vݰ��J!��4Ӗ�9��i	�+��:�)���N[�o�9�^�R?8�(�I;|Ƴ8�֛}	D� �8pK��䚙ET�2y�5f.�2ߪ_p]�k%����߻S�e5��Q�^��r��o�ך�^�Q+��Q-���z��� )Z�T������Uo�a,�����%U|�U-r��uF�R\_�7�d~�:�E�Qf��ԩ 8��D�@`E
2�p�#Z�U�8+��IyA:�E1c9�x�\���H��N�k�SI��|6���O��C��xbH��6�	�&��wN]�[R+
�7(& MF�J-m0��܉١"(�zG����u���5#u�q�Y���]z��L�y%̚�����&#g����)݇��<
G�"�=F��"O���N��A�WTY�=�|���݌���	�,��փ�RP�7�n�f�B��#��4"��+�sgS��́��p>;���x�B)��t��Jvr=rr���e�� ���l��Q쒽�E��vP`w�Y��nv��L[���n 5�г��
�Z������Ȧ�"�thĞ�W�`��o��~���z��J�|[�Y�V̏u+�J��ޓ1{��g���J�e'��Nm�9dFtٸ��ɹ��o�Q�s�x�&+�VU�ƮPls���L�K'�]��#�%�+�UI+���h�%}\�<��� zM��-I�5=ƹ���C�
�{��� �    k�@s�Z�WH�Coz�$�WԫJq���ڲH*�F�2�m#g��mܪ�X��U�yp4ɮ�����j��#IT�(���}�dn�!G+�%ܬ��>, -�eޅ���F0/�r'hX(9����J���x��1ˏ�X�U��!mF$���J��j��f�|!�M�ژ�������d�
�nI�~>rML��A�M�$޳y�o��慼�2��1���sG5�l�Q���C}Vz�w����&y����6�����|<�_#��_̱��+au[�v��
��vL�4�r���E�nԭƱ�(�9� �ݚ��tjVFӄ�ɛ��	� #C�v�O�:�M�%8�y���r����D8�<Ǵo,K<�C�1A�D� �:��~ ���z��(Q"�\�t��{A� ��n�RSU�Fw&z��'
���S���^**�Iw�X�8��Gc���n�GG�t��6<�i�
D��Pf�>,�q*��W�0�w6����x���(N�n"�'P]_U����B�#�άL�t�)"-o�Qy%�l�����}j���'")�2�K?����@?��M@�'�~u@«�D*B@�D�|����{�$y/0��Y�*=@��� ��h�v��k��g���9��=���d51r�l�&����) H�����۞^D�/�������$��H�L��Ahc��F��ԗّi�%{c��$</���])�_��p8g�������[����&���$�.K�z��%y�G �2�@W�/�u�(��h��3��/���LЁh0�O��u���\�@���X�����O^�1}b;��B�B>�oT� +LK�jȷ��j��qa����l�j�_
����Nq�����C�P6�H��~���w��\�f�Q�okZ�v��j���G0p�ILӳf�����[�W�Z(��l�%��.�V���&0W6;5�'Z���S�-����>� �S���c�|�]���-M���W�
v����=�տ=�J!9���;g�U7��+����ߺB:T�{<��Q�$[0��$8L#}fuD����h��n����۞���h��1"�X�ϰ�yw�#e��z����8 H�^>�RM9Li���R[��N��M)�K̮
=�<A���N�Mz���3/�s�[&q��J@�����٣�����<"�%�0��
F;L���V�o@���Z6�P�$��Vd�0V���&��`pT�;�L�>��a0}�wJʆ�bף��`>���&H+��:���CM6�zan�?�_�9�_�����q�,g���ILW-���fp"�:	����l��6� $�MlMc��R,���R�,)l�;��je��Ϟ(���"Q��X���A�E. �=�9SjH���U����;�S�̈M���'�4����n�v���)"��������j��9��� 6�)2HWz�_���[�PB�IŢ���S�Fa�/u���J���r�[i���]�U*�r�^m6�V7�*{dI%��wFMK}v�c��e��R�L�y9�*�9�MI�;.���=M[j�Sb�����ij7�T鈴 .����pa�}(;�먒�7LQͨI��Λƍ~`c���W��)�&�"f̿����NE�SnF/�C�w�gpS/��#g-U�^X�4f��uD��-,����9*X.�T��-�JK)����.��
���+��l���B
L�T�iM=����-��������z�M7�Dz�oΉ��<~��G?D"D��x�i�������|�t��gM+�I���'yO+y���R�v��iΓr����GA�8Z���Q�H��O������`lIlsO��PXx����Dev�䇋����6&�����q���ևȶ5�EZ6<�'��PҹQ�
e=��u���m��?Ȭ�Ea�^i���vP�QP+���<�w[�n��Qo�����J��(��z"�6��~�]�T:�� ����� �/ުS�s8se���c"���ꓼS�Ы(U�S�m�y�)X�)d�G�R���`W��`�.�|^��&�_ۥ�aw1�`�c4�ϒ˰�~��$ek�è��t)�(�~�����N}���:�yÁ��(�0�S�|ԏ�H����	��T�*��j�TR���O&A_��dC�ʱi�������%&��ï�Ϳ��zDK�L���-�'�+W�lF��S�PTמ��\�PCA�6���b�Az%��4�FI0?*-L�{�~U*�G��q~rݮ��1�^��0ج@��Y��m�G�\�'�+�68�I�V�<%L�Wm?]�V�Q����c�rxQ�V��U�V��'/u�̔�J}v�n�n9�p����9�*d�Π9�(�uYv�JjI�F�D|�|ֳ���0h����Ww,�������SWS=d>�n2{D�}��.�N�Ā���&���vp�$O���.��z$�0CT�F�|V��?�X
�i�sc�c�XO+fq��BIYE�d�l��Ͱ^a��d��a߾ݩwGa]!�?�x~qޙ���f�ߧ���@�r@5�!���K�i�pS�wz߳*��a*.n��,6/��_x
l����q��Z ��`>��P�B�Қ��=�su\�h���^��ժwh\0}0Ƶ>����nh�
��\�*T���	��Y�0'��AW����g�a���if�4��5>�v��#p]�/���;]8���w[TmG_��Ē�:*��'�h���. ���ߪM��K>HU�$.3��VA]+�.�}������Ɍ�U����f<�>�b�5O[̧���F���t�����?=����N�n���mڡy�f��[V���xo�+ݖp�w�?�I�$l����,���j����t�n�Z�pg����f���9+����A�q�Gs�<�� �gM��C,�b}1W�a�ݬk&B�xAe9�2�(Q�+�2^��\))=]����aKG4G1С��Vj�%/D�ڤ�&���J=��?A��7O��l��`��3.���L��:$�e��mK�S7��$҉��T��J�<��9Dv�`�١xZ�Ȟ���Y0����H������]������<�=��]�yf��d�F�V�K��b�6��n9�bs���5�PGW��;�%����<�P�S�k�j���i4�ȭO.�w�)�a���G�ҡ$C���/�d޷p8���/�����SR�aF;��:1�g�Y�ʏ�X����W�*��o� �;�Z�$��L'q�9"�#F}�@�<Z���<K"���S/c���Q86�e,��(cw~�U�q��+��q8�>��F%�3�F9m�5��U��<��8�׀Z��0c�Mh�<�$���U8é:$,��,�o���#4�g�(e�/�G+�o0zy��|7^,j��(t+�rTmtʍj�(�z�\m6��g�Q�]i�ɨ�g*��jQ��`����O�oW��D6r�Z�]�D���J�-�G�4_�V6F6?���k�x<�e�#%tyBm�͈l��i��
��{���K��uί��)>#b�br�̾݃^,#@����a��C�=���_�V�8!K�L�����G�
I�'���C$�F��eJ�C)�}�P���8��xQZo�8�·Lt�� ��i�n.z��}���s5�,o���Gү�5��T��B��OO�x�(��X�`�u���%L=���2:��	����(��Ւ��1LG� �FP8��Д��l���0�(�EV��g	�!I��#<�Za��B�X�,۴��}T��qZ�6��DM�˳o��,�!�
���~T������Uk6ˍJ�(��fTnw;��6��*Ɨ�w�#{w�?�=H
]�\� /�;����7#a�/!g2��/����T��Ϧ�b,�W0.NW���ɡ����^����/�Iňo7�P��IY�g�*a���4��?̉�ˢҌ��R[���}Y�9�OW2��bh�"���ь��,j�@��$%܄�W�3�� r  �[�o�ns���裨t�/���Puw7�{cz���E4l����q��^d~1�|�}��p8�xw�Ɓ��*я�Ե�(a���K�i���↊v<�����-�86&��ҝ�=�
�
e�P>��������gO<1�s�l�7R�'����2�@ޣV��B ���g[8��U�(�N�w��wC[K2;��h ��%[��w����a�e����a�=�i�DZO�@� {	�Ъ*���G��8��
Kğ!=��s��W�����8At�5���#�$Σ��l�G�pI�٨Y��Oq7��Z�B�s�*o����(��ix�6#�b�}�]D���{��E"���yo���2L�      $      x���Yr#��E�#W��m�apL\�����޿�qf�JR,�ɬ,-�"��@\����3[kR�͈��Ԟ�I�v���3�c�\���(�H�Ӵ�����d�X��dN��0;.kDb4��a֨.8g�|x냱�x��ի�k��]��l���c���^)�X�7R�4�Zj�cJh����z_itӃ�ܔ�)�r�L1��B
�G�J�o��nW���S�=yk�Έ�|6%w;�m%�z�fK�"{�FXhӻ�&��{����r��oWW��.�V���Ш�7g�.\b��,�y;�Ѣ��zfu}���6��b�
y�Z�����z3�
|�`M���dV�o�~��z�r��,�?��|��[�M{g1��ͻ���5X��*�#�ʽ��%��nMY�O��b��t?,��-�|�;�o} �]&9��]�P]�'7vG��oXlVׁݪ��bp>���~Vn}[n��!�6���$� �������,\.���@Ĺddx�k�&����%�s��ۥ�WW/��6�Pn���5�k�R��V���v$g,����"��z�=������-��53�����&�mH#�t�\j��j�E�п�6T�����a�H<���-��6/6H�6k_JH��E-j苞k�h`"��B���՗�˗R]�XxyUi׭�B�q��2;��=��iGi��23�4�̨��^�#�=�_��{=YnQ,�x�r���1�ʵ���%Ě]����;I��g�a�n�[JVmz��.1�^s��w�Mh	#g��3�+��ܜ�C��W�<���kM}��Je'��l7i2��~*l��0>A��l@��#��C0��`��B(��E�j�j�˔C������Z�P���P�m9k�8+6�,������^#��KDH���҆�,�qI��(�V|Zy�mx����{�g볗B��c�5�]��d�A妎TZ/U���d�)�ū����Jvo�!}�;�k����ySS���Y#֬�#����bp(	�5u��wXҚ,?�Yb�ɀ���;~y�*����5m�n���M]�d�G�B�n�CU�+"f�`�7b�# �6v�HbZ'E�K��M�W)W
�3Atu�*���5Ʊ@U?B��4~U����M����"�ANc�:h���ܸ��lp�c��ta}`x?���`]B/�S8T�����?ƞ�~-c� �1�-�Y*y�n]��i5�kt4S>�m��Q��[[F[���4�cڪ������Z%�ۨs�j�C3m�?�#�b[�d��KM�}[���J�q5��&%}���Nc�UB���ѷ]�������
^h3?So��m�?~�]}��<L�V���v-�b2^K�)��������Kߡ1��/6b�CTI���/�%���
m�yWh��p-PDy�h{忋�?)7�w��F�b$��-�-� ���v�8ʢ"�"���n��(4�$k����u���l�X��\�#\��ն���EpK�;Y�9 �4�1�1.�0b3�;� V�.�Q�k��{|C����Nb�ȝļM����`\��M\b,mb�	;�	��X�7D�p2I��D��i�$r5��k(�P/<��g��rE͘M1�9,77��`�πNi&����?���c�� ��q���P�����*N���.|d��§] �R��+6M����0[3�bsa�S?ԔϩNarI�҇��:�j���'3��K5��,�B�k�.%GUhY��h:���
�8u���#�J!66 0������=W�����C0�O�~{�BQ� ���P{M�`eu�D�,���{2u�Ί6������Ob�"َt�Q��&0tK���YRZ�;��N!$u��9�����$������ٙ˻N+�C�;���L�A"-bO.8_�b_���x��`+<��J��'���M�θ��`x�n.�c�����G�E[m�(�r�r��B����P�X��GGʊ'�=4TNdz�l�_s��+g�770�1^JJ��������Ņ��L�ؚ�2�
vQ���S
�W�X���
�� �Y�a�I�ɭ�=���X]���D��-*C��M��;����Ѥ� �ќΡI���-�l��ӎ����O@�`N^�[	jN���iӗ�#Ѝ^�j]�X��F��#����hU�M��XY�rH����X�@�<od�5�a��NSF��m�w��QԢ�)��3$�Ol�����\��mwT�H��L]u�����9�1�|q���:������Q�8��陗H�P>���U������΂�-����7��!��w��G%tu���J5�[贚7R���{���!ã_X���EP:?�'zp�g�p�%�g?��v�$rP⸧�Z��U�����+O�g�Nt�Ѵ�(���~ЎpB�� ;����lr6?k��Ý�\$�x���L����mD,Bn{�I%���u�,7����lHh��=�ox�̈́��5�p���ǂ��EZ�A��Y��n6��&��j=�ݷ,�$��Ȟݧ�_��'5�qms~��<2��c7Ձقlݸ�n6*:�#I䙊��"7"��]�,�g�5����MUrYe+	����)��0�Fu�O��ؙ԰�pVb;/D�Hk۵ܹR��.Õ�;����c�rӐxu��#�rǮ�QG�5��<p��-�X��T�{��$�#,�(�:I�1q�R^�y{v��i �^���`H8�O��ŬH��y��?�Z��'A��jى���:�'��LJG�8����Of�/�����J�D.���vP-a�@l����V�#���J[��0t���a+Vȑ԰m��]���Q{qU��rv������Bwq��5J�։%Ĺ�a�Tth��z�6&�|G��V������N+VC����<J��Z.����`{!�%�E�PJg��N��� h2�8V�����*�����:D׋�;*��leb�"AM.�%:��.Pn���tDg�TR��u�����N�E2��^5&d]8�q�P�p�n3:�3@v� �#��5�Y;���&�۶����I�3vuNz�\M5~�`�$��ѽS������2����g���S�[wT�*�J�� 1Qx�����_s���f	�m�\����cy�:��Df��| �vX�B�ذ��Ӊ���+R[���{��/��_�{�>Z�۰�*��0�n��B�qo2�!��d7B:��p��jz�0����/d9��F{��%�aFVfp����W�At;��`�I�<E}�'17�a���Ϟ��/��|f�C��vwC�d��v���̸u��X��80{ ,.;���ޫ�q��w!V���Y��E���Wo�.P�>�;0ޢ�|�f����H����f�:{�4i:e�����q���7δ]�P.��u������Fv���4'�\��$�	V'u�>A�۴j���)Mʭ�Q���NȞro�E�#'<�#��Ii�߹��hAf��!�;@`y�D>�oʣ���/[c~�ܤ�S�sT{�z?ǐ;��)!�2s3MO��\�B��;����W ������9�t�ڝ=�\З��/s#�!�kJ����%��q�s #�2��G
]�#|Ѷ�G�F���C���	�|��Uق�}q����-Y�y��KG�5�Aa��\'4������`I�8@ٰ�`C���}��З�^��z��=���Vz������8�΍r�^�R��h���1�ڔ�]
>�uv�'+��}|�����܇���j�T�&�j�Վ�}v�@q&��^�s	N��nCKbğ���f�3:E������zm�{�c���,�5�8���^��>��V�J�|�J:��zl�n�7=�����o��<14��L�C��D��c��Q��h��&��c4��,F�����.^w���;|�qŁ+z���5����TX
�=��ے��/����7tLp+�����0񸺷�&�dY-2���YBZ���r������8�qч���hB��"<��y,n�O�38��ju�@\�!�|�ݜF�ʚ)S����5�iGB=RJ��a�([J���(�����e����<�{ �  ��6^C���sdh����<!�y��"��:���ȕi9�y�� ��i�w=Ԣ��Zr�3�݋��ؘ��s���M�q�d�W^2E/\�H �h�:2��f�f��-��G�_�랅�q~��������Un��Y�v&=k�(���#�ٺ��3�ѳ��~9M�3at7�Ȣc������BV�@$l����Y�9�F
v��F_�:#�Ƶ��'ϛ��T%��яmc�Gގo���aM���<��'Ǟ�q������x"P��ʑ�J=�ӟ�4�St����i�w��Ͽ}{h����e���:,ij�b��j���� �����H�9�T��.��F��٣exU�'3�O���B.0������R�2��ɭ�m��:}2YC�8�nӓ"��7�ln.�Ց��r����6��SCz�IZ���I&"4g!Y�<�n,RE�8;�Ч�R!N���"�_��]�����_�k��bԵ��t���B���_�b�h�1��ŝo����-������D� ӻb��q���4�-�j�p��h�,�c�lHv�"�e���I^�;Ln碘�iG��6���<�<�ݖ� B����Lz-����h\VV<
!�5B2iGO%p;��Qfe�6~�����z�D����ׯ��ً�      %   �	  x��[[o��~N~�@X�-@�E���h��ݠI���'���2��ʢKRn�/��[�6Ч��(���,K�,K�_ �Q�93�(G��l��XG��p��;�̬,��m�h�N�6U�P6T�֪j�Դ*/kF��<���e�V�%���Q*�5�f�ܮ���V�F��_r�{;<��{j�6W��ڼe���h5Z��g�Û����[̀ӣ��-�)�_�=���o<���z�5�q�mX��n+�/�'�� �U��6`�|�����9s7����h�]$�e�Z���ɭ�*բ^�TJ%���2�"�8��V���Wr��4짅Y���\7��n���[�k��/4`z{��kkr�j �n*L>~�5vaKx��Oֆ�v�vf9���/����" #�gi�<��Y��B��i�@ߚ���P��?p��'�̲�{
�|[X{@�ٗ/R��.>�5�m4����c	�9T��� �O| 끨�������w4���xx>A�鐻�v����Z֫Eհ�����S5�z�����̀[����:�}�k�Q`6�!:;�u�a��kᙅ��0|N���,����~tF,��|L�K���a'z��s ���7���t�-��Ë��V�a�*�0 Ї�<����K�Fb7��7�y�Sxu@T����G�,�|N�#ܩ�~c��� J����i؅�>.��)<ò�8:g��k����H���dQR`���T7&޺�D#eVK8� G�Ƚ�%���CTL~}����$�����C�g7��X��E�z��<�����4��眙̂�`[n��hំ�*�^�}���B�]����FƎp��lx� �����Bl�����L'�3�H(��S�˶�����z���e)���eHh���͑0�
:TP�p8�	T��H�B�9��`	�1��^ ZbG������f�m�ڊ��
K���G��L�d�^�hMw�������9uKa����fs�E3��f�`~��<5�\�C�L�Ά�4�K
L`�����be���.�w#���_(����������϶��8v�ݝ���9���"r��F!���ϳ�vA�R;��� �9�؍�H�9#�9P8F�B����X	3��\#R�3�;�����������m>F'@�@�r�w��l>�2��qE��&pI@hO�.R#�$��"��xx�MZ��	�+�m�P^3�j���ն̒jԹ�Va�nk��fTK��E��~�9܃�d_���}�P�@t�Q4 ��ꚦ5�����4�S��3��?�Ϭ]*�Ë�I,˜>!X �J�`~$��):P��e�Ъ#eIL��]�����)�W=�(�#t|��ߘ�D�d+���2�u1��I\�%1W �(5�5ʍLD�𸏄?G�>���T�$/cBL��l0 �r%��;Ȼ��W�LA#�rs�3J�-IYd��*P}ѿ83eևW_��/oa��g�K.��Ё���� T��F�"S?�"�j�s�ՔH;&\;�u�(?��@��m��'}id��d�(����,=��y\��(���-Å(�/d����b>Go	����[�>ĝ�F�M����R���`�#D=t����\�L�&�{�PK1�T�q"$��Hv�e��	{��Ň�$�;N�%`�$�:����װ=Ĉ*�k�)��V�Du��壬z����#Y�dY�%�NP��Ƹ��7�!(?�s�Q`�����i�&����J�d��I�X��Os�^�ܮ�U6Mh�-K�t�VM�\�4�b+|��-�6�����3k���J*.e�FYH�g)��{ Z.tsYA��4i�G4�W8)�&������n�&��4n��O	k`)��i���ɟ�dP�����_?O	��^4/ �_$�!�o2����V#D'$��Z*AI:�@�=
�K�V�!mp$��TIg�[Q�����B�9�ȫ;���3{#�S2���?HIB1��x�ǰWzJ���&���"s�r�`p�����|��- �����Q�q8)s��X:��8�� �<$G� � ��QWaP�ӱ։lG���t���y8�ʖs&͉
~ �r�MQe�v�6)HE]3M�X>wJ�D?1�x�B<�ަ���;)���Iܾ�R�!�XJ�#�Tg1M��������e�0;��Ρ�s��:;��Ρ�s�����ī>����9��\�g5AVd5AVd5AVd5���	j����0��n�����v8���o�?~:�.h���6���.h���H��
]��_��?.�UM���j��îZ�Q���j�P��F�)Y����^/j��TyQ5*EM�쪥VʆS+�t�t�O�yߙ�a^E�5�T��a�2��~���üw/I���A�������Vs      &   f   x����0�s����8M=;TBn�ÁT�؞��H�XPX[���q�5,՜=d��/~�4"��yT���&��RII�M��_��v`���OZ/D�ft      '   w   x�eϻ1�:���w	�	�{Jq���Q E&rZ�l'�I����l���M��}C%'�9�0=i�Q�|�/�K�Fw�$�O�u�vw,t�.���U����\��w�w�1��;     