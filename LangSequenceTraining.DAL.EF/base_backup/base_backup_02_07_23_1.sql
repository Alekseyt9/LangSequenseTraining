PGDMP     4    %                {            LangSequenceTraining #   14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)    15.3 #    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    210   g,       $          0    16400    UserSequenceProgress 
   TABLE DATA           �   COPY public."UserSequenceProgress" ("Id", "SequenceId", "UserId", "StartTime", "LastUpdateTime", "Stage", "LastSuccess") FROM stdin;
    public          postgres    false    211   ��       %          0    16404 	   UserState 
   TABLE DATA           >   COPY public."UserState" ("Id", "UserId", "State") FROM stdin;
    public          postgres    false    212   Z      &          0    16409    Users 
   TABLE DATA           /   COPY public."Users" ("Id", "Name") FROM stdin;
    public          postgres    false    213   �      '          0    16414    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    214   ^      �           2606    16420    SequenceGroup PK_SequenceGroup 
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
       public          postgres    false    213    212    3216            "   �  x��RKn1]�O�H!ʿ#d�%���I�((,�Æ$-F@&W�oD��H� �,����ޫ��R��,�h$�q�9	d�L�h����ߏ��ef�i��w�����w��v��W<.�e_�y���V�1���:P�F�!bjɓ�%�C}��^5P(�3F�5z�H����5�=�0�h�U��\l��	У���W�֜mΆ���cw�Ǹ����k||�^�l��E���o��ۤE"J*'�P � eAJ]�d��ו�Q�k�F�ZUA]A5⻳�Bt:@J6��&i�ӳ�o98���o{��|�{�aČ}y���1?�1.����}���N��P��,�"�TJ$[ʔ���I��������߼���yh-���h�0o��r����Ӳ��a��^^�}#���Y�
      #      x��Y��y&z]�+Bu�ݘ�B�K���2��xG|Y�b.�\X]w,Vw�mv���s��iI#�9��a(Yd�Y[�/���K��.��YE���[M2���w}��U;�j�Y�;A��WK���j��*�r�Z[���}/>�x�� �I~��V�W����Qr��o�y�bu��K�������L|���t��K^����g�{��M2Onħ_x���Ur%~��_�w�Cs��x�?*�{-~_���VO� ����3�v)~�-���)%^߸I��{K��B�zo��Л�?��p�|��x�~�χ��{��ĤWO`����	�{��sx�1˙�˹x��y*��[�գՙ��S1�����x�3񏹷��?��ڎ�~���������s�,إ�'>.W�Z�=9(��qb����z�׃��4���V�S|�����-vW�����ӿXG��v���O��;�&�A��p��'F���x����g�[{-�XCX�S�x��I|�	�zO��'C�d8����D<�;�'��w��۳�<����xJ˽L.`\x`%���;^F��� O#>Ԛ�a�;�h��!�e����p� o���08��L$/�A�j򫧸"���E1�}c����7���\��c�p"ŏ���Qb�?k㱳��h�}(���݉�&1N�wtw6n9n5,'��%��-ހ�&��siP�����.ta��%�ΙCǏṀ��wY�Yr�;GN����5��%~���ˣ;
��^���_���X�l9A�'W_���i�b�|>d��3�ߙx����N;ڥ���kQ����J��Z�/�q=��+A���ڭ��r�U��,��j��A�U��q-*�JQ��n�D�X�ܝ���#(�ۣ���)�� 6^�/�d/�2�%�C�*�C`27���Hƫje�Ϟ�/&!���	Vq�@��	��x�����?����y�l�ڗp.X�	y�z�3���߹r�5��/h�Wτ,����A?Bt�� �{�8�h��Q��!|��&y_��3�v�mNWL.	�7b�/�?���'��px4�!4��p� �:��a�z�;��y���-�������kC���O_}�+t��m�����?�-\���L3�Oh�]�(�@l{��tQu�`�
B�������D^|���x���;wO��Mŭy��D,�i}qgt���,@(��õ&!��S�^�<�ʿF����<N��j�G�vC'hS�^�;�B�\����O��p�H���\����h�ۺ�U�k��MN��������CQh�O�.����=���|w�T�6[a���Vï���0���oW��W����n؉:�0h���\����,>V��J��l9U,����l<��h�B�~o�
�PA�}��c�b�L���-z�Ӻ�%ށ9��&ɨ_��|)���P27�.�\_��.>%��s������Gh<|%��F�z���&q�{-�P��3%b/���i<�K7v����"�{�&)�K>�sg��R^jW��}��^�8f;����3�6�~�-�B��[�W�Ҭ�w3c��n�'��i�U��j-���M;�௥P��60`�톓�����"����Q��b�%��{�(FUЏ�X�����LG���w4�&clQwNǴ~�ǹ������k�(�`��������d^�MK��8��CRݿo�1����W^��y֊�+��
7f�*����׸�g�;��-�Y�_����C��N�;1\�ˏ�&�_�yC�%��؊��K�s��:$����` �� u�#���D��=�K0 Q�\(�u���ԽP�M�>uIz-ˣΖ=3��p�W�~x���j^Ҟ�$�xX�$�ā���-Uw�R�U�T�~�V���J-�v���b;+ո^k�w���'l�m!-��zw�[����%�s��#�M��\G�d��Z����q&n�S��9p�g�jhHdc^\)"�|M�T����B�����9,�[�Ow��h�B� WE:0�;�|��c`'e��2��K�ҋ�Z�yqQ��p�j�x���{�7d�vڬk�Z�[�V!e?s�7�	�#�`��x��YN��:g
�$.�+�ג��8 $�q�si��o�L^c�Q�������,��3�u��N���h�� >F��`*Ltg~����#����Ӓ�W�A)sf����R�7T��/�.��d� '��5�\by�cЏ͞x/8��<�L��Qp$��˸{�n�}m�� �N����񥜦��2͒�ԭ��R�yn�f��$��ԅr��y�Y�E/�,�	��0Y��g�n�\
#��$�2 �.(i^+�7���\��6�O��A�,e��Yꖍ
GQi1��#��eՊ�����9��4n��t$����vdn�N�(�V��w���_mT�~�T����Z�ð���NE(�R�Q�~�\
�V���R�귊��Ҩ��N�t�^�A*ht_��� �a2���6x� }<� I\�9�c��R18x�^��rt�	S�����.��oE���.؊o���a)CU��Y^��'cTlp���H>�#͇�U��R����3�:�����]�w��n	�D���Kp0�x�x�C��c��0�BZ�Op�fv��5L�.>�)H�3ºb&�B*e[C���9Jr.%z���k��<� ����{�a_J������)ǺQ����p��� <�N�z �����t0	��1��o�H���}��~_Z�g%�z���[\�5I��дu�e*ॺ���S|Ĝ�E�����Ks��z���8��^<µ�����}��Z����h�` ����yh���O9�)�v��%7.Ƌ0"#�ĳY��D�5.��`{Av��#�ϑ���F��|��0�a��.����B��;9z?�;K+7O�6�mKךּۉ�Z���j�Z��~;�*~�]�T�VXo�;��i/"����5��� ���"�2ɠL�3L,pʉ�Wc=d핧�A3Kia�I+�sx��3�D�)�Nl�����{��
=p9ΏťE׉��z���aOq&3u$%uTanOh�}�J�S\��L`�F�1�#=�//���_ff�w�L;�q<�F�8��D<I�:/h�H�c�d�σ>����̼�_J��	:��D�������S2_�/��#���x��Ҫ|�3����� Q,�=D�/�A��x�Ѱ�6�Aw0*��P���⸢�:�ssf��/!c�O�����x��>�x��(yr�^V2�	M�����P��bC �/�̀RV|0����C�D1ѥ�_��د�$�[��(���1�v���3jz�ca9	�ׅҞN��(�N� �#�Gϸ��HՓ.��S\�t{Qr�|I
q���&Mti��]����˔�7R��2v�����UC���+V�`*f�d؆�g�?[e�Z��Ph�jU87�J�Wk��o
'ǯ��V��qܪ�b�^��~�;������J�l�8*�;����GJ��u��:���\�NI�#���jQ�ž&�?n>?�oK�|J)��v]&2L�@o��{l�mE8�ׅ�:
���+�Q���Ϗ �� �$��^�ƣ�c��������23Ru�4��K#E�C
��}ǣ &�r;p�	3G9����w��*J,t �O��g���a��(�4z'8WP�7���� ����OhSR�������fy����̔��d���p�J�1���5��jG/��W��ȀIRb܏{=��P]������h�L���A�B��#pP��&�?�407�-�_���������� �Fa11٧脋q��`@�N���8�����c0_2�^��A7�{�8�ᬍ('��������K���\s��rR��'�����^y��E�Chu^��>l��f?���q��	�<a*�C�]��PԷ`���|��i����vJ��5�q7�~\���j%��ⅢUK�j�Ro�����a0�h�:�|���6�S��ò�3pq3�ޔ��h��+�"�    C"^�4�3�/��Ot�. �L���DQH�k����7>D���M��3c��tyJ�B�H�uIiu�$)��v;me�rSr��Hܐ�q�#0�}F��Bޡ�3V�3FB+��N<q��w2�/܂ 7�!���KEi8&�<��g8��>Pge8�ټ�0�g�=Es�P�����h�C�ԅ?�
��Y��;>D�$Lp�~��[�\+'}.I�����ofd�c�{��I��V)����B�k��p��I�4<�n@�HXdt����
3]'恇�^峃Rf�0g+�A?2Q:eA!>�GEc��'M����<���<���[F�ʻհR��Z�Z������ԣ�_nK�rPj�j����qݷ!x��ۨx9M׃P0 TZ�su�B�0S�>)�W�)��˗�S�h�e��j��>x�7iQ0r�ɼEZ�iܟa@
�9�v1mzK�S���:�&�=!H�0	����v���0�!.(�D�ƣ}��?���®If�������*@R�T4����*v@�O(�+LY�$t�5L�G�h�����M���7��2q[$I}<�����,@A-��̅�g, ׎�����]�"�
�D��c�	�ͨ%������ru���h���4��Te6UE����YXALr(|<��
&8�	����y��A̋�k
M��yA�;���^�.��
k�[8&|��ȶ~��Sr�6�yn��Y2�s��S@��O�#��@r���A�a�	�k�pڏ	�u�u�z��p)q�1o��i0������q�� O4Ŕ;'/�sO?�Rw�����+�ח��@읋u���ǯ)ij-��i�0�_�o�#�Ĥ->S�Rg�%@�T�f2�e����-�`c�Z/�JA)�˕�P����7k��u�"lTڕr1��i
a�~�bO�v�3�q���y��v�͙g^X��*χǑ�!��%c)0�de3e��w��Ǆ�	����dW���ѩ���
拾���,
��褒�Y�"10~���_�̸u_�O/�B�G�A2�7��
^|p0.���$
�Y�Wj.KQ4������g:���%�9��C��T� \o��9��-�^�}2�c
)hΠ��O�����3�q�Lp�~q�x��C
�AE���X8�M���p��#(������1
����� E�f�a+�`reAb�kN��9��S
hpF�������Ĉ>.��?q-12 ������{��Wb�j� �׌/u��F�IN��u,�:U�1ǁxu:��8��	b�_����!�7�]ɚ�3�
���7��_��|�#�?��KR\���N<1���f<�d�	�Y㔞�$��{�R��v���ej�}��h��Z?���B}�B#a����F\g X��&�͕�6/���Ȱ�.a5� ��X�	���P�A5,u�q�Ҫ� ,H�l�h��U2����_Sߌ��:ib�
jA�G�e�zvÎ�TDXx?U2ׄ��u˶r�����s������.�L/��n$Idi�-�GB�z��y��$س2��s�<���y��ǚ6���)%�I�S²�sT/֮��
v�.3��+3O��cu�����^w�.B ��"��`��NT��2�����A�ՖF���J�C�����s�쫆��� �Z�H
��b��񤐹tBGN Å+�y�i%���
��[I��%��gg�
k���{�`�Z����X��Mw�T�[�K���+� ��$�_dV�rǼl- �����u������մ+���0����D/�6� ����c<B�z�0 �<}NM�5�[��.S�5��e�n�R����<� ���g�®N �؞�"�&�$P�����Ѥ���%��/����t�S��OC��d��* ���kÑV0%�lJ�o��[¥���/	\ކ�.K�.�ja��;�8�P���mK�;�}�x�DQ��B��)|�@P�ʼ�2�R�jL�����aX�M�TSt�(W����M�
l;�L�3����NE�jRW�7�i���X�:�P]��u��]'�~)s�)�n.�+��z@E�x@1� ��G
���d��9H,~.*VF�P^��z/�	`-�>�����jd��_�����3x�4�eY����|`�U��|�Up͈On��BBЯ�)g:bd&��Ia��@�ytԋQc��Nz����\hC,x"����w@�R^ W
���̌���S�g�I��!ELiC��ƥ9(pݙ�(�LFbD��+�[e,$�P�i�B"L�	/�ˢ)�I�8��HNaK~�JIn�=�f̔��xZ�Pv��d&�o>��k���3,�Meh�Y��,E����6d�4F$"D榄=��!i(�N7�E��j| H',�	%�an�P]����F��m4ʇU�dx�
Q����Af��h �rd�{���T|i��,6�b\����U��/uj~�U�f�^���;X�#V}ڛ�x"������g�W6��1��O�H��6�KF#��D꺠g$O��>X�J}\&~�����
�HmXO��I�Z����0� �T�.�pƣ��?%K�����B\��r��⛒��W8��
�iqUeCs���턛�PO!�1ʀ�3�	�@��)d<�Y�`8��"��ޛ��;���d��p*�f,r놳�E���.e~�H�uI�2X��*��#�(����B?Ay��8��c>A���M��#� ���PU�*1�Z0��XF���R�+ �
�)��W'%��y���c[a�؃4� vו֥#��!���~I�ng��YMK�*%(��<V��	_t��:�BV�Z�f#������R��ʍ�ߪ�;�FP)F��Nm7.F��^
���l��v���+���)���F\
��Ҏ�� �=t����[��$�*㜤�Νwev�X.��{m�8�������(`E)��|JP�!&�M�{Y�ڌ�;̥@��9�(��^#�w�-S�O�So���H�R��[b_\�}!�--Ѭ�N5I�}�+ŷנ?�'�+�v�A��q��hwϤ,���%:@3[C���l�O����F!������8�N��i㳞�@����?%�Y�&��N�[�DL��G��0S~
��((�@�Y�H�������������@�qT�>J��8���?"�a���q�!�-ƌN�ԷB��[]�����d+�G���βs��Cfj�g�m,�;T�/ ҫ+0����ٴ�n�XJ�l�]z�L�*yml�)�E.՘Qݖc����z��i��Z����E�Z.U�b�.7�;����M��wî!��zbB	�9~J]�Usģ��i8��J"��@9���9k�,��2K��uf�ax����e�_镔 y�\R���W��*v�x�9<"���D�[(�Jf�A޽z��N@@h�����R>%��`�H�JdЁ��qIo:�{�;�{;f+������ "U�����Q�C��`�F=�橢�5\צ����e���M�F���f8�Fg�6r��'!�2�H�s� �"ʌw�8�jG�t[}��[�yWdVp*<��x�<�:sz1�
�O�W�>O{��,�?J����t���g��:a>8*D7��\ˊ�oOe��CQS$��y/��W�_R�q��=�2��Ҍ�3��N�~ILzo]`<DKT��u�5�0�w���a5���?�Z��'9�(�sn�ŗ�3*��}����R�v˝r�S���Q�NK�~5�TJ�j�֊;�7v&�p#@�:�G;{?w_������W�C:%H2tn��5P�a���!X�.���:UE�Sˌ��\%`�q��K,��e�-դ%�7�
 ��K/�5�f	ѻĠ��32��'�2Ӽ:w	z�`{zĕ�mg@��`?F��MB��\��)C�j�ԙ89��S7�B��B�^3<�p �_�� 솟"�.��8����݈ ��O�N0�gЌ��E2NH���D:�*�HCj_^��{']mȤ�0c�EQ0���
�h4l��    �?��t���D~������sn	���<U�a���xN?�]�rQ��+�Xc^��Xb���d�����QY���r=����6E���=fSH/�g8��ݠ���P��מ�Ż�q���?�ܹϞ�=y����4�	�؛[�ډ��˄�ڰ�B�9&c_��(��6��:"� �r!;��a{Ã.M�).���,�6�z�qj��P�2�C�	�F.Ӽ�������!U���(w�)���
A=�q->�0�ߩ�q)��c��	"�Zk��V���[�R�S/����zܪ�J��_	ڱ_-5#�+~�)EQ'�[B��@9��~F)2󍭃��,�W�<xC��w���3�+�ӂ��P�53k:�g؁��Fjєg@�jr�����f�$�L�>��<�>�=��U&|I$�<�&�<3�K�(S2���K�
�d�Ew���zl��j�n��$R��@�oL�����]Z$)
?�r���{�$X~N�Ԛ�:T���Ƿ(H��W?�?HBk҈�UH�y��`rx�fm������#̑z��,�ʅ�H��D�p��{��g��K���H}��Y��i\�X���vĳC�I�?�dv8�zy�%fE���J�0��LR����rI�Dw����T_���y."h���P����,�Xw�%�9�:��d�xhdt�i}�s�R���Gl�ݶe����t��k:Ӕo��͐6zYn��a��j$�d�-A4��N\m�q�Q��W����nV+~���vM�/�	�|�)��a7�6V6���jW6�d�Iւ4��+$T�^��T�j%��
�.鋄�`���&�U��n䪗k���l3&���v��E�.�Yg��@n��c�e��^n��,��ڎ34��|77�0fo�-}fZ�$~�௥,d�i�G�1"/�F���|��%��f�
��K*��xFƏ�B��ǥM��#�v�S�xs�Sv�Đ�'�Yp�A/M]�����ɾ��I�Z!`ɝ��X^,������O��$�������ڂ&��h(�t0>�߄�����9�fH�ᕎjm���Iu�^;*�[_��2n]�v�3&&��N�p$��7�����#�3;w�U�.+�5��{)�����t�C�����u�~��F���iA�;��4���򰰄ּ+���թ4w�e�ʦ?���l��x؏��Ͽ��ö���P��r�3ŋs;x���`���5*u�_����[#�knD�A(=��9�=Ȓ,Ug�^��Yw��%�B��ܲ|lzKY�'��AbO��S�|�-�-���n�܎�����:P�7jU?hW�~�Ԭժ���
 ��-v���B��z���a���l�,I�!xv���P�xb;��SXS0KE<mj��%et.�pC/�����rάA{,�$��19B#�0��I�VCQhy��<͖b/k&�*�c��C�!) ���U+Ө����4Qd���\^2*���	���_O�A��vA09�����P��"x��z29pK�f�,�g����͟u��x̶�8�簟!��`�:�{9�S���~C�1�v�xZ/���F��(���cZ�}�N�ls�r��L"�4B�1KDQ��X����!}��&Pp���b˨`�6�$�i�-� �B|����-H�I�0�1w��fl,l�I��]B�C� �͚�>7�4��Lss=�o��c7��E��T溘]��V'1�B1�I�=C�a��?ƀ�ϛ�&��zIzR��>F/�󕳺P)� a�[�>�A $���y!���/���!� O3����yc�P�Z�ݾ���A.�}5��FlL,�烉R�ډ��wU�Oм�QO�e���	�Q]��*{s&.�W$�V��v[��%�.I�ޖ)�
���ͩ���)��:�Z�ǠSG>�\5J9��NC���JK@_?����&��6��V+j~�V�*@�Z���è\mu�QPvX䍡�:0n۱����"5
�^[(;Cs[ �[��U����S�3gp�֪�HA-��@&oi��\�t>��ɕ�ʵz��F��=dkFCρ����%�S^��=�� �P��I�&A?��G�*E��tU��r���[3Viv�b��%���1���Q������5�<�"�����smA5O'�?(KQ��s8@Q�|�H(X(�t�j�x����1��w��i��lc���6��s���b]&*�i���fciU�p-E,��<3�R��Y}�o�Ӹ�Cga
��!hG�w�b ��EC�]�N}x lb�uYoG|�dvhn��Bj�D�!
�oi�^�W��6֖ez��e�R ���+��*�����C�Y;g�@B�ǨN�cN�b��3�M
���ߗ4�Z����B�g.!5���u3�^�[�%�/I�J���M疤3J����721uM��y:'���kt��^t��hYz2���`;1*�U��u�w`�L/W�����J\��8���*�*��q�T/���ز2�T�I��i�0[����Z�ow:�z�)���;R���TM����ͼT�9�Ĺ�Q�u-�t(Y��"�p9ɬ�pj�3��"��RA�-?7�/B�Μ��I(����5cC*�,'�+�����p�!�`V`�ea�*��([&,p�e78B`���K���Kx�˝]g�)g��L=G�k;G�J�rқF�$ ��4M)�0M���.U;<M�&�20�1�H�Ŀ\�$�bx+�43�t�K�j�'�o�#��մ8�I��w����$R��#�Nԉ�J�q�	Oq��\�v�D�[������ 3�)f��{�䥖�[�W$�M��^Q�٩Ne!`U�b
���d'�蠋Wnz�M4:��!u6�M1� ���I�6r�A�grL�)p� z�
����F�e\CMi�:et�<�-�gᇗ��p3�s��Ƚ_h��=��&w{���%Zo.8&�\���	noh
���`��(��(8���I�R]8��Ц�v��v;��P�^���F�oFq�/E�Z-�ĕz��39bce���!M3޹[��͉Bky�~���DV������X�8_c/�t��o�~��!B��o�X�5�m�]l�(�l���Z�fs���ڀ���L/�b��	�L�h.���FP��
�C$I� uBn�s��ϛ�?MjL58ݜ�F�j	N��<�CB�:ؠхZ�o4.��<_o��1~b?5J�?�{'B�v&y��,�)�]�PTp��!�j���q�]o�q��lOKw��8�턀nƽ�>��V�1���c�e����A1ߵg@v?38��x���Q�w�B%r 0� ��N��o�{b][Ծ1+��Z���k����I	:�E-�n>4�#Ԩt�t���'
kV�@ɉ1�x߶$\v��In��)�9\^���:Rb^�z������Q�N��km�B��JݯG�Z��0�����Q�A��׊��Pi-�Z��ka��*�[�z��,�����U�;w��4��yĔ�_�C�'B�_3��W���Wj�o[�T�K���L�BPRi��+v�d�_����`q��qWw���x.]952z�&f'KU�eNL�������*}��,Jj���c��VM�Å�"��Ώ�٣�_wk��~Q}�I�،��Y��X͗�$dto#c�pξY��{��af9��##7p��CK��d�d���n�-z����y/��Kn̹X�� p��hHn�5�֌m!��Ґ�l?�N�;�x��B]�kd���2��v�Vu���7�ʀ��f3*�e!����3K��ae4��Y���,�u��;I<nP4�h�KҺ��2ƀ��!��ME��OUeW�}/҂8�2@U�f�|���|R�s�e{Ir����2\�-V��j���ZMh�zI|�ٮ��RS����\	�;�M�]�E�|��{t�������2K3�cy#��}"]�{��.ݘ�d4�㨲�����)S2��+0��*���z�F�j�A� |� ��N�^W�
T��t&X���"��W`�[KTA	�`�b���#��Z���kn�FX    �
����*��-�ze��Q|�\���D���A<+?��B�օ�Ϊ��LsK:~����&^��&`��JT�v�e�Gn�	�?dΒ�4}�G� ��ǃ}��X{�����Cm���G�� )���j���=���5���	�[}ť^bp�[�Gi>c��ib=b�V�FΑ���7��S����a���~|dw>�j����#�F�8չ�M�K�bp����!��2�ڦo��`�A<��j��� �3I��-�N'K�8��z��W+��o���_.��V5(v�,�@����nZ�wzO-kO>��f�Q��c�]%��EF!��.��'U�cK#�T�x^�ѦI��u$��_l�����D��Tz���.[�1�i���kk�����lx��^�D9���ӟ��G؟���?S5��_K�g4o|�Pd�����t*��U�z��h��i.!��*%g�p�o<v7b.��P��\P+W��8ة�a!��s�y �T��:sJ� 1{0kS�6�¸��( ��;�����}�e�-�����-rZ�*Ⱦ[�-V�C���Tݽ��3�z'���#�x,�6��3��Eg��j���&Z�T�OW�Sl����.9xaU��yC�R��o� V�-	�]��~�]��**�͠���r�ꄵ�G�N�̧�^�mH���v���=?U2K�>R5%���"[E"3h-ӶoPD#񌉠6�
�^"��7J���gD��]D���q�#7!�8M�vϺ������j�����?83?��'S�ʆ����&�;B�J]�с㹎�����]�'�_����%��S�T��$sq�K�0ڰ�%&e�%�BWf��kbc�Y=�z��LSh!�+��Q5w�MY��b"�T)ƌ�q}�>@�9(�*$[XQ=��_{��zB��¨�՝�6�A�"�6.�� ���AAn�̢S�����v45( �~5�dAǮ��.^����=+�y�H��2xvɑ��a��3���h����>n��`l��g'yv����g�~�����D4���q/�'+�i_��F8�9�*V�`�=��B�t�`ab���T�)P��/ �`�f�D�Ix��KX�-��J9,E~���jT��Iُ*q9.�+�JX���0?��}��jhc�H#���=�6��iT�W�-�������m	�+ݒ؂Ѩc����>�=Y�l�y.ë�&]+t�&UҦ��;�ǅ�?���ŧ�E�.{��&B/��þI�}0�Ӊ�2�`Krc1)����+@�Ir�sx�	�$5����JBRA�U�9��b����[iks�]�qa�4
d�s ��������}h�7��.��*��63Ah�d�� !7�{��|�e�f���H�A1Ǜ7�((a�{E3^R@Ha��%s��kf�ʹs�3��Џ]���?��h(L��E��N�R�I�������N������1Ϙ$}�"/�1�sw[��|��u]a;O�UY�z�|���ܵ_ʦ�]Cr&f{M� m�뻵�]/���;#��j⟵z�\mV�p�;��M���lW�z�n�cgz�>(ތ%�uCךn���.d׉����#��Qi��	�KU"�[ �Q�g2Ϝ��牜�?�($�d��� b�c��.�Aa�bh�'���͡;�'^kur�l��7ۢȳ�=,HZ΁��+ݭ\Ő_I��OFl��$�Q&�����U3���tx�lv��?ssr��n�(�􎃓1��{e���X�th&Se~+1�e��1�Հ����8�A���Fz��k0�7�-�'�|qqMv��yؕ
����G��̉œx�Q6�Ť�N���J�=���8Ee���\�d�.L�gE��G�8��ًw�3[����E��p�$
�!�ug�Ve�>��� ��.	��SKR+��A= ��%͉dI��`\�+��p�(��9D*C}���)/eOF̗r~�� Z�R9q�m3���r��K��߬7�Z+~�)������J�\�ԅ?�\p`�N<��	�K��0�2>��U����Y���2a B)0f 9�<�A�`���Eč�i�@�7~���A�PD
6�X��������d��ϩ�H_6%��J���E��ݯ�t��h1����dS�(%�T��o��=���������2Z����7�W���@��g�n��A������y�G}��;P=2z@U�[���g���� �eV%��<�L�=�x�xn^ҥ8U0�D�3^��k�!�w�I�k��[�˄�Ϟ�q���L�a��)F��&��dȖ}Ï���??��NC�-�h��%x�]�5N'4�?�!XY��7\�P��\a�4w�;�*0����+����ʢ/`�k�R'yg�`+��lm�h̩&1�uk�V~S	h1���׌��V�J�6�Zn��r���N��Wۥ�o���Bo� �)�v ���^�S��S曷�֐��bv #�x%�F)�bO��M"Y)��ov�������!~��\'�`Mb��~��dd~/s��g�:���n�>6Ng{��I��%5��y��x� �e4����
Y����j� @}�9-hm��$kms,R��%@��zJ��s�3����6���=�m��*J9Y��e��{����=IP�Q��>����̛�N�ewrH�R�RBʔ�Y7��.:�{�b��_�Ջ{^�[,��y�®���:t�-�XӞ��L�B�J�J��n�{�֠90�@�g�{�op��a|�ֻ��U��#P���cxm[(��+����'��;vu�$	/�m	C��G��q��@4��V\[J�5�S�Q��B��>~��зċn����0{x@i�����.�3������n9,�J�r���د�Q�o����[�v�T+E�
�J��:;V��y�����S��W](R%82�&�SUuf����@�j��]7|��o���+�W`��0!�?l���{��ԁJ��y��%�����b#@�knt~�U�ii"������H��`,FI����6aX"N���bt/$NCDcN�0GK �N�60�3�C�C�P��`���4�sG7bQ��m�W� \�6��BΒ9T�Xr��Y_�1b�t�T�Q $��*~����� �&��������,�_�� Ո9.��A{_"��)��ʫ�3:�?qԅH�7>�M�}���JSN@�No����!��L��E�;ZK�����g��ȠrX��ƹ�5�V���dђ��H`�ʐL�t��\u�+7�(v&I�q��$���M�n�R-���J�/�B��5� ��AFQ��c�88F�#M�~��m�ewBGУ��R��9A�NS*���nAU��]��s3y�t�Z�6�� U$$��X�IT��4][��Ir.����� [�}uXh���"d��7L�hf�/q�> �n��77-�^:�1[(��N�S��i��5	�����;7�2�~�0���b��a"����ouP�#^�( �]d��Hk�:Y�eU�.�،U���ΣjU:Hl.V�����)U}}�z����w�+�:�>���|�@�Wʓġ	 㦥F���\��Ax���⎭_x��O6�ݦį�2c�RW1�҅������`����rb`�PO
��J�l�|?�c�-��b���gm�%� ���}�oۘ F͗S���2*'%��ϖ��J1h��z��հ�W;��ߌ[��f�.�è�����4~*O��ܽy�ӕ�F�f��ue����R�����v��ƆfTH���ټ/n�T���d%�r��K��K)XP��J1c�A=Md�+g�+�Ę��+Qݤ��_A�������y@n_C�3<a��0�4"y	Ӝ�҂�_�t�|����{m@K��B�9" y�W��l8�~88�{�A��� ��[(������`�7���*����b;�������ߊO�f�D�����b�m�N8�2�EAU�i!&ـJ@�G��/�l�/w!Cp��/q�ku�9~#�EQ�T��ӋL<'&r:���Ǉ'е$���n/ҫor��H�    4�]'�0���o�R�!L]G�?-�*��eMJ��Ư��
%ug���LOC�!Y�-��9F�>�-��Z,���D��t��cī�C�)A��Q����	�b�TSp>��ʙ�o�6����a>ϴ�16��9с��)�e�B�	�V��Kk�ȲJ�[��{�b��n+n5�f��v��W+���ꔊ~9�4�V;j�Z��A<�P�ö�A[��9Y!��X��!H�VJRn�g��s��Q����hE��� ���)�U��e����<?�F^] W	�Ĳ������ڣ ��X5 e�� ��'��n���qq�%?ełri�/)������`��w���A<��_;�z���;e�6Q�8嗢�2��� �C��L��2輨��p����0N�8](��ء3�aS)I(�8o^c� �f��b��!���3�R\�A|�R7�h��t�^t��{pE�%��VO�*�=wϝ���xb5ܼ�ڏ��t����aY���x�p�}ƒo��΃�)9����+��L��̥Gz�X�\�>��=9�v
�I'kY�@�ǴxKr'q�������݌�B~7�b |!�V�]ãVPlu�aІ�X�\��V�o��v�����P|�^j���҈w$����i���N!E�O��h�v*z#�x�a5��΍��5�&fi���M�<ڒm}n��a�鰍����o��.���N��07�"f�8�rd�.��c!����Bb��sa(Y�� F~Ve$�@��\y� 6���&��H�����㼐�{�ֺdϐ@д�sf�:V�1O�e�	>HZ� �XΜ����3�"��N㾰H>d[k��;x~{̠S q�`��-#��(
2+h��Y��%��S&r�z?�oo"��e�F�*�̚,����),��.�5r�([��Ԑ�>cԕ⌒�F����NO`���ʭ�Q��9�[�fՅP�հ�q����~3j4�r)j��N#���.������)��޻K�����>��.��q�	�6T 3�G�,3�N:eD���[��Y�,�R�O��Á����t��"�cO���5��PW0���	S�:/����D~�JߙY�27P ��̕+N83�QXl�J)kԾ|�o��8 �ۿ��c��o�|�����I�s8$r~�n��,�!w=�x�܋5T�� ����������건eP�Y}��aUµD	^���?�����U?㠠�y����#r6D���R�`�9�y�8I(����uY��B}�+�2f��x|ԝ�����qA#@��J�ʭ�:��F������C��s��W���vꓢn��N���� �F*1"��.R���+"˯���n���aJ��3+M6���K4����oNxtaA��(���6JV��,1��xT$>	���Jg�w[��->��C ��ʑ�n��~��4��R�WK;Ѱ��8+-�i������^B��������j�z�֪g�F���9��*m���
�� �ؐ�l*c�c�����5��5}���h&?4�����Nbn��%��2���Կ�O�4�(�^��q3����W+�Ţg���>sUkE��d��p&� �&ȇ�����C�Ǔ�7��^��Kį��Q`'_k2�rNz!���A6���Ѓ��(8����Q;�Ńh�� �ϻ�`{�cF�'^g8�``��&�,�En�W�5�.QyØY|Ag�_}��'B�gL��Z�p���;�D@0�b1�8������H��-�6Rt"P�Զ���i�XV�֒�x3�>wER�3r�d7�~A͗ؖN�%����İ3S�1����->�0�^X:<%U���q#���Q���u�uZ���d75�,\�%U\���L��d���Pp����sa��+Wo�+�V�r�)U*~^a�Q���Z#��v�Tl7jAVv(-�f�TY��a�[����b)����KˣLyP{{�!,��l�JG/�9�����bF9Tm@�!��Sg��y��C ����
A6�O�R���=�W��&-!�//PLQ�J�Ч��r��u����5t�N��h�+Uwk�xx8X��^0�cd>A^�}��2I����qΑŹ�AR�r���1֒%������_��t�,�h0�C�v�(T]�A5�}rǕV��^�wD��VyN����Q�I��G�v�����u}��P�3���	o���z--���}�r�.�뻞��v�1���&�SL�W#�C�SCr��O�g��u=�g��H�}�3n2�F݇qA	�p
Y�	X"a�t�O���z��=mjhN�9�U�����%�J�nNKW|83�:�:(]G�$�����!�4��}�
�=V�ؚ���M�Fj�٩s�a�����M~+�����un��6�F�֊�bT���lwJ��
 �H8���D t�;�oS��aȧWI�G�:�/)W��teUU+L�^�j��J�: Q��ip�B��c$�B�;`5���8ݼI�ê�6�9�̣mB��R��D�>0���G���KD���!=����-�_�������w�OW۰1�.�E#(�\��7��)��<4)+P���@?�-�t�"�V�{��j��e������vx��}�Pب�eN�7�˵4�[���	VtR�{ZiI�ʱr;:o0�tØ�Q-���+  9��ޯ��x�;Qk$)Sp����љ>j��k�$7�5�^�3Q������^��Ig^@p'��6))�����ނ�&�t)3o\�M�ړ�bs�ܝL��}���n�0�ن��H�:(�I�E_�ڣa����F��u*4%
��g�����2B�k�K<��dVF�o��D齤]�Գ�M�-���M���<�簭�S,� 
�u6�.y[�ٖ���m��k�ł���l�jȝ�P�'1Y+�72>�P��pD�i]G�5��T��J+�D���\'�S���r�+���v���n\�z���拷*~[|�/5��r�Y
;�����gӮ�7޸k�^�����]��B�y�%J�;z��!�VJ�[e\����_�jS#�;�wբE��6���#�c��n��c�G{��\��@��J�9!��)=e�t������}<��L�����j��=��GB+�]� �	��0����io,�:�t��)�N'7���)����L�]�ɺ���lA��Ez\\��=��e��_k���έ�p
�.o���sns���L��i�~�=^��C��ƴM�Xіb*E�
u:�'kw`����a��6v�>��&/dف�?�1��t��Ml�f͠0�b�̉�/Ɠ�A�A�0?=7yW؃����*j�KL�c�f�,�x���@�윌��nf�l֥�2\2��s��6 W#������I�t�-k*��<ә�|�	f���4�p+fVKW��7��<Q��rߌ�96D�@�N�F�1�J�Y���OLb�9{e�;�,��������aۮ�TܭW��R-*��#����۝z�ڕJ%n��Yہ.
X}�*��o��
K�EN9�"�a�,V���K&� �Ȯ�ب�*�-!�(����2NS��1���RM$���"��Y�,��L7 /����2�v��p�)��!�r�z�pi�J��_��|p�7�E~�v��ޟخ��c"wӛV�l�s�Bz���^�� S�l56�Bu �����ہ�H���C#� �=5���U�7f��ʨ��̃�u�/u&
��j{�T�=��;�5Ұb�d@0����}o��a���'�k�
��hUjY0:�j�0B�{{c^�B=����9���'�� ����6���	p���`1��=���� f3!����Q�D�}��?ɸ�8����[m�
������L?ԡ�%ϱ��m��äI���.�\��Tj�r�V��rT��r�o��_����mquv�YH��������\؅������ZA�4D���d<�U�pc�ԕ�1���~k]���������"��6�����Ŷ�;F� �C�0�^P���bN�!�XL)j��    e��(e�ŷ�;�<�H�����[��X:��s��������J:�QI:��E�>uVGhC w}x�]�d��~��P�Qv�� �Da�Qs3�<�6�oq�쨡$>Q�z�n����/q��l!���v���J�ׇ'l�c���K/[���c��{��7����'1�D��n	���L�M�+.!�2̩�!�1�Ax�J�y��2���c�#,7n�~<���*/�	#�YH������f+P�#2B�z��I@��k@�4IrHq�Whfq�&�֏t�_N�G�I	u�!�B�?����>�!mP��`��M�^�����jǻz��N�	�e�[���k��\l;5O�%s
�l8P2�fB��W���Y2s���!/��	�w+�rX.���b����~��jk�F�i7v�+��N1�����b�A�[��Y���B;*���{���钬�٥D��̯d�6��pɀI<,*?�ګ���M^$�k5�LB$�g(w�`f�z�G��`P-�"J�´�r�c
7���yu�<�/��ԍ@�2us<���D�z�x���?�K�Ϭ1mvA��7X�Ȱ����U�n����������Gڤ�H�LV�Ncx�^�!ڌ��}P"��i��P�zZB�錼�t|�-x��ݸ��^�ŐGz�+J�=�Sl������5ud��	?7�/�1�1�fQe�8��Ys��;�R%7�xJs�V���g3,b4D���P���qSXCF�C��jJ�D/|A�S�͔,�8'�W���ؖn"`��Zv+3�ȶH�f�FU��-{�p�%�q�RX:�`Zs��K�^p�%��"�>y��lI���Jד3� ۉ")����l�Ņ������gY'7��L�\������r�q��G͠�W�z�*�v�:�F��jF�΄�Ǉ�`�~k;��Ţ��1ř5���ykS��l�W�f�ZѭJ��I�T3�r&�M"�h\�v�6��}�d���G�tK�7		6J*�sE�����m.��z3�3v�Sy�	�y@��s#�j'�������jp��8�~^��=��a��n���L����C,�ꝠP�͈�%��#�����������At��d[�7�q#s��i,�<B�w�=!�=c���6���pJ����<��#fF`�^'729b�5#f*={g�� :��^��{��p
u��K3A��쭱�kW�hH����J�у1���E�m����������S�@�jm����\��|K��yàV�����n��j�]�F��b�ĕFTi5w:�a_��Suv��dtK#�h$���в�^�O�/T�K�ݾ5RV�#~ 9��
�T}�!r�L�+f��pi������|3?"��@�L��>�Tʱu��f����A�K.:�B��"�F`��N'����l�5�ܹ��KAK�\3�/��n�H�mg3Wd����2�@ ����Y���nAS��x�+a��dtb��o��W	��-HY�p,�s�D꒬��k���C�ڄ;�\kk��#�C�a<��v&�P����EhL�qH�ً�IJK�2e�dƐ��%��q�	���2ڱv��S���T�<.�^mJ��H��'�lz�fZ�^)�]�(���+�0v��*h�6�a��,�V�F{�R+��v�R,�R9��v��įc���ﳰ!i������9H�-���13��6��CҋXߎ܅�ۢ����}�n��b��He.��BZ|<���
�R9F��?s�Ά�c��$GU�+鱄�>g#!5@���q_ȅa�1iM%� ky0Ćk,�G�i��aWfM i�9��HM�[80���N����\��Xьӌ��û|�}L3�%9�f�x ��� >a�:	>�B��!P�8e��*'jt	�'Z4b9��(��)V�-�E�^^Ƚ$�/%mTlZ&(��⨋z��/�%�ݣؚ@��F�ǽq,烕�j6�_g��
k ^�����+�T=�K�?A�P��w����΢�Ԅ�F��;	4	g�9��5:&�i12ǝOBI%�	�.�( �rGH�!l���?W��,2d\�6�G��ދh���F��se6�� �>/��M�n�`m��h��o��V��R�T.�a�\*�V� 1��f��+���t�	$(K������ֶ&�������Kd��7�p����k7^�,<vm��=��g�ߍ�2�����M�՚��Fz�+�āY��d���s�C���Q9���J��s���)�pC
���3�P� ��0S�d�>y4��*i;�L����\kԿ0̤��dѨ���ȟQà�~'"�Uؓp�L�?�A(�-E�������O��걹�焻�ؗb��GG�=U!7���������r�pz5z�N��ƹ�@�ԙ�2���oA~Z��f��A}��N!¨�ݥ�
�ٍP_��/m�$�	�Z,�N0�����ݎ'��D~p	��/�7ǽ8>�=����E����DH'����3�R�R���<�&R�ݕw)s#�4Ne�6����w*ȶ����^"�*;_�jɰ�ˎ\ot�M����֢�bKu]��N�	W�ڨu]�Z�)� �x��j��F����p��H-=m��At6q�� ��.��y���fŅ���SHNY��K8��?��T�
�d�Y4E�Tg�)��(3��@_&�[�A�]Ԯ���l�$�hl97o��� �� �S]���ǝx���hx����Y������&�Ė�᰷��V��NF/�O��4���ᆁ/��	nB���Q�,c<\����&I�1\�L��Q�e#T�6�m�g��C�����p �zv)��I~P�K��0��^C�P"��k&LٮI{zi�!8���d�@�v���.�WS ��}����#�2���1J�б0�yۘ$��br#�鰀�;spuf�����qt!L)��D�u�|��Y����v;��4Kg7��0O*�X���:�%1y�!2FI��$͊�dr�:�V�pv|��(�.T�8c��d���+�8�,w"�_�(���Ki^�b��I�Yq��ʿ[�aq$1	�iT��	z�T�|v!Wv�2�����+��R�ȯ6wk�f�ت��r%�DY|"�VC�^��R�ʕ�U�e��７-a�$ʗ�Śz¨�6K˨�C��d���0p�f�ުpe�q ���ĕ�|���ibp��	�Y�P��>r k�8�٥L���ť�?8����i�c0��� 1W�J^=���F�����1�"���|�r2L���Z���]�b%��5v�f>κ)�R�j�.��JD�O3Ke=�����C�1��1��:X��ѪZ�T�V��㸐�3���� u܂H� ɐG��WV�-�D��!���WAm�4?)��r["�Y�M��-���~�z?���P!42�x�Qw<��B��P��/G �H��Ĵ���C�� {_T�f"�����.�n����H*VQ�����_qѭ1��X*_�U�?Ho3��b��v1�\�s� h�GpA4�}(ўs���D�*qI=W_R��"��~W2�$&������)����G�kRA3��t�4��r�[��7��̍`��,d����G?S`��Z��:�I����DW»�d���|��n�(A~��e(�/5�V����v�׊���n��^?���������;&�~|N�f��l�2�"o�. ��)�%�\2��#���Ita���^��՝���4)լ�d��+�������Rm72P�ihZ�K��=�^aBe�)i|)�
�z����4�0�@!o6���s
���	aj�c�Md�ըFSw\y%�1�l�XR�`y�̆��0���:� ~�@���)���Ec��a> C��?ߗ�W�D��A^�8s|�.��EVa�H�v��3*k1�����JhO�]���k69�*��ڥ���Ia)����<Z����11D���� |o���ܜ�Y�~Z�pbmS{l|4��	�?��G�ʵ[?�(���|:qo����b��5c!G�+9*�3p�&���όrb. ��[{Ycl�    i��F��C�բj�;B��U���~;l}��V�KA�U�� ,�Z���Ʊ��l��F/@�xk�k�g�uB\}ĸ.9rL�%���~�9�z���:�K�C����r�Pͮ$v���(`r�-�����kzFӣ�p~f�0�H��1���<&,��i�h�?˗U�3���J6&�XQ	G{�m�!��J{M28�h���O�R=���f�[����A��&;Cy�;��EH�cw���@��3Y� '�XJ-�K1ʗ$���d�mA?�/��3v:b�]�dŜ��ns26c�W���2����6 �R�MG1�(aGEC���=���&�<��7Z�������=�$�:��5&�M�:�D�dZ˖�]�ht�cDH�r!oT�t�F2Dj�q����ro�,s����|h� �1��S.
�t��:�{{wj�h�3�����:���O��:幚��')�22B��R�j�rh���D<
���Rkhs!z��8g*��oű�"�`
شX�����D�j+*��Dګ�j��A���A�S:��������3��;�s� �Ϭ�����3��Դ�h�9@���t�M��٥X�M3u��"Mx�+�C�OM%���e�]����# �ȏ2z͚Dÿ^�-r��5�7���}�_�?~0��	Ty��ܧ'`	�/=x��l�ͮ�L���$b�0k�v	����'K�����#�+nk�K5cC��z�!�ޣ �i�œ��]u�n!��H����
�K���s�+*߻1�.�!�%<͇A��{�������K~$�}
���2�7�s�+ًg�-n�K("+�M���o�io-�>� Kmtf28��I�~n�>ׄ�����V�n�|۶P�ةUˍ��:�#/��~+n��zXk7�aI(����z'�?�Wo|����cs�d ���7,	�*.��Iv�5�/2��@��v;��1+��2����d~.Q�U��.�7�O�1Ʀ�3w�l�c2�Μd������_@@�K�>y& O��!���ᔲ��vL:b��Q��0Gxɇ놂E���biZdZ?>z��1ץM!q�mb�MJSI��;�c<vY]?x}Hx�f��{�@R�.��kƱS���=u*<t[&H?k����tН ���x��\R�����z0ٰ1ĩ�c���4���seU�Z��`��&��E%��W��G�޶������P��`��8A*ڍ��tl_X�Y���F0�V�os@5��m�F�k���7�uwR�����P���ᨓ7�	
f���5��R%�v˝jG��_/�5�e�ى�~�]�עf�\�Tv���۳5����Z�lU�J��d���(Y-��"Fw�a#�pJ�`��(����~z�Ɩ�:���o�B�*�'y:��|�ϑ�j�ÿ���}�,p�/���*���wȳn��|�A�KP�)\ÿ��g�-&Z��sE��+<\�^
?���nu��%*�m����=p60��Й\����P}$��x"q��IY�,!��0X7	բF#�d�Pޑ����)�$���E�wȪ�M��?%GzP��XhLo�H���0S� "���t0��w��i��Ω�dso6mUA���0�"%^�n|�Zkf���1�����H�1�C�<6d�~,�#K̜�d_�Lbs�8I�Wθ��7;��)�d���k�햢u��\S�t;	�F0f�u��;sS�F��H+�#�Y���QԬ��5�Ym5�j�S���R�:�v�R��0��r��p������-��9m�(I�/mS��T���r�%��+�\�5�kwl9v�6�=����ݡ�=�&K�e�eLAt$%������5��Y.��[q��oƱP}�T$�kG����$K\�s�N���N�zi�P��[��"Bଖ�戔[�2+�ɐ#f�1o�d�c��Z(��!=b8d�%�蚜X���^�]sU17�3�T��0s�I9�sq�m2���|u��l�H�QAf�p����x8�#}#�(`� ����iF΋DU��tW�%�Js`�ؔUKn�J6<��!�W�<܍B�gfw�I褮Pc�� ���$A!(�����5}	]0�{�`�a7�꼣�p���W&Y�w�yfMK��#�r��O��x�)157��� �؈�������t��2�Ǝ���z{�V�
���s��ɐ���ow�N,W�*n[�`��a��6l��m�6��V�Ӭ[%�j�R���b��RT�t��v�̨�U�Ō^��h�́SdV���J<��_1(�̞��^B}-fR�1�(b���߸�\+2�N��<|	��zDi�+��o9�&�0 Ą���H��X2��������?�;�d�$�1�(�x������q$�@��7��Rmoy �7��H9����8P�ڨ;�#w�q�4	X���۲���M(��/grD�FΩp���|�À(��������3�"�zJM��H�TW��S�V
#eH�,b���[)2�kɓ��F{)ϝbҥ�"f���2h�n'-�������t��ӝB���X��o)�k7��Ja���n�Y��Fӯ�Ju��K~��
�b�ToV��v�R��}jS�'γ�����w�T#���D2)qM	�HI��,�ٳdy��sm'+K��? ���j�d������\)[�`�MM���%��҄Qg�;�wv�;��Pȣ�Ó�5�Z��1'�Z(�\� �'�h�9r.=#��Y~�F�(��|��u��|�[r5�X�x@��ݾ�f���<�	x+�)䩐
=o�=�s!8	Y� u�����2gF{wj�?����jQm�`��Nƙsf���q2�Α�6�ZK�j�N.2�x��<���Ԕ�ue"�T�����hk_�M��F��ԥ=�E1���n��59��z�%�*&v��L�*a媧�Aw�� ���4uǀ9G�t ��h���-*RE��%��3J�&�#@�"w���I�:��vj��ی�q���r�)\��ppZU��VT�ԫ�j�.�B�a��p�h/���vY�-�����Б��G�^��Þba6Ɓu�raѰfu���g1Jܮ+��Yň�p�
�+�f�`k�+y��"$�r�'�XC���ۻ<z�r��a{ߥV�"Kt��ț'bӺ� CZ����I�U�(���?&���8��t8�s��Q�e��J��s�&=�Sު�<���ԉ��)i=u�5�g1k�+f0<V��|=&\��T���v�рD�~
��2"K3[���&P��w���^d���P8+C��Mo��r1v(!%Q(���)x���<b�\P�&�<{��Ƭ�������6F�eӪETh�'�K�!z��4�Z=A�м������.3y�_�]��J��A��Ga!U�c
0�'�i��n�T��N���aկ�[�G,U�n�R�v�a%htv�'Q@�p�ȡz}�8K�/�)w���q�k����*��՞��͇`�����5�t�ԝ��(�!��rh�C�I�$��E��kI�.z� ����y�^qK�ǄY�J��&�z"��x(W��}�	����=� ���A�;>����dH̵�9Cu���6��T��{��}�XA�!�?4=�����r�XX�졥n�}�/R��f�y�)����������.__gR,ʨ�T~��6Jz��'�P��+ߞs��[v�^���h�-�T�CcwI�Y�g�z��*R�-efc7 %S�b����H8#�rÇR�b]�S��#�:<�}����rs�v
ō��B#��ev$[qJ$��F(4�2�	?JtF� ��ϻŸ�ڂA9>d��Aj���Č��Mcf��Fۈ�VV)�*O�y�g��ii+lEg��<l�+a]'d����V��`|��$�?��o<����*&*:�]�p#E��`��*��U�L,��X�%�%��L�x�]�<k%M��w�	��]��kڝ$!��i�3�Z?
�1�L���IP�b}c�L��t�2JZC�x*��h��h�(�&��(k��q�HA��)S�3I���J��5���GL�=)�%��0��/ �H2���n��o�w�_6z�[���E֞h̈+K�.ٜ    .!��A�}��FH���ų��8�ݠS�Z��G�Vٯ�բ4�E�N�V,�j�EI�U4����|oMSPrr�H;>���T7�mJu6_��$jf��c��t�VJ�9��}��L��r��٪�ɪ�������H38��n��H������o
0�������S���mC�HQ)�@⹻4"l,�5742�������a��Z�td�*v��_�w��9Œ��$[߬��Iw��!�9�nr�ݑ�@l�a�/�$)%d�����c��Mu&�{\�ﻢ�&�g��%�]!�h�n��F��ʳsU�ŵ�~�zJ���qЍ��j�!�[���`�D��� ��T6V93q��F�����Y�ǉ��'�X'�TDW�9w�+�-�6�ੲ�MLr��h��d�R�[��"�K�<c�x�L��-!
��v�].V��ݬB�jK�R��o� 촪��*��S��q,�f��}�7�̬�b>�g�����w�#����_���҉x?j�(�$T�5������#3T��� ;{�G=�S�EtC������ Z](+�$����_��Gc�ev��#�3IVi1�Y�
s3������	�4w���[���R[n>\ݹDd�]�R�%!��>��l�6�Q9)�z6,G"�#��-�G����մIv_U�����Fu}H�А��E��u���p�h��/hg�s��ZS��_h9��O��ǖ��Y6��|8�WN�ug����d��!KZ�X�)���}�E�v�^z��_���㭲%[nz�FC�i���&G�j5�����r0�7n��V��/S{aS$�]�-�K�,�|�^QF)��`1"ᔁ�(R2������EٵH��}%.�@�F�i���#O���YO։�#�V o�JL��V���<U�6Ɨ-CQ��
��b�JqM�p�aE���}�`�y�����X�� ��)=���]�Qw?�Wy�(�[}%�|N�.�耗F��}����.�j�P�4b��o5��z%��5�i?�z��[ϒV�L�I��'�`}���}�v��B�>�/��J4���	��|��h���ĠI)N}��:Yf��ۧ�%f��P�o�M$����K�=}��2l�=��@�-:�nsݭ�Z���J��Jd��_�ʕ0��Y��Ǘ~<s���G����|���=6R����}�b�=�\��|��R���bq��	O�i�mG��4�Ֆ��^x��p�l6˦sp���ؓ��� b0凐1�F�\���a�?|��n�sbEv�L&��$��{>\q�EV���z��W�y����4��~�j�d�mr�Z{���UoڵV��bȊ5��wٯ�-�{�ݯ�}�&$%5���9���ّ�l8�0o��-�d1�����#�-��1n�q}�d��쇳)qe4��,C���1��ؒ*�qjކy�2�1I��ߚ�P͂W/tj�&"X��+I��,�R�_+F}�Xah����K�5ޮ�@d؄?���}�DpAc�/��-����@~�U��	�d����'�+{���c�������i���������e#棘�2�O�]N&G�T������c �I�=�3u��osi7�k��E�O��b��Y
�,�i���F�w2d���@��!r׿�F��)u�+J�UQU)���0�/�O��Jw��q��;��M��Zu[�Z��ո�6구���G�&���ṟ���J�Yr�3�Ƞ���+���*�X���r)Ouf��4��)�ERO�p��P���B}eL%Ψ^��T�:c��jJ�.VK=o��3�X�j�(�E�	Lz3+#��v�V�:�];�|I�$E㐢]������'�A����	��X⤕(բ=_�9��Gjן�9W�EU�!C���7�ѧiS�#��6�@a73θx��ѽʯP�51|r��Db& �l:�G�����<\��a�e��M�]��í�a$|�.�]�ŏ�-�EQ;ž]�"91|L	�����sT3k'
�5p�*�K7��Dʓ	�n8P$�6)��pib��O��k��*��G�Ծ�RW�tn���j3���6�Ӯ6����9�/�3,�"���u�T��âQaI���l�+���=I��%:Bƅ]��ĺ�M�np��
>����F��#�\�/V��d^�M�a蜱U�j� �Ef�3�n*�ʪu�N�"�1߯7�n�t�A�ճ~\m����� ݲT��������&�w CD�ͯbk�e5��]�]:�^�S�Z%h�ij�%=��n<9��wB �+�	_��ڶW���nJ��5�>�w`�">�o�e����"z0B`�΍	��{�/?U�-=������9�W�����pMXB��ل��h◥W�aix{.�A㔄d�vKU���,h�l�e�s{�������|��ӫ�������al鞚�MN�[�)<Xd6Aj��P�e�_H��������C#KN�:_���g���c��,m߃�˿��7�i�����V6��N����"o}�)��J���UW�,��NҪ��N3���VӸ�^�k-��������SkAՔ����)��*y�g~]���A�k;�T�i��'X�#9��u9"�@S6�G���:���ԕ6=�|�U^��v-?^��'��8�+}h�������%�)�IguI*�bG���O�蹋}*����t0�-���v�6�+'{ܠ���s�R��<��5�l"C@�7�ٜ��b���D�&�=X��ߑuf�"E\5C��wo��溊E��" e�O�M�y�n����hr0�m�q��`���EK�"7����������p���V���d<��7$QH��Ӈ��>���>=�x�I���*��Zl?H8V�����=ߎ�;�I�]�<Jti��ʽ-D�m���tո�5��~cŭV5�^3������mT��v7i�[{������^=���
�w���B�C�2���i>��奄/�R�<� 8Lmb�����w�3���F$���4Ѓ�
h� ��[bH(�qS������Cp
B?]�� ����PiHsDW֠B�b�ܗ_ٲ��R�ϴT5�3�:l�O tvb�r
g0��uM�)���v��]"-���J����(#*d��,�E�'�*�/7k޳Ǝ�鎏M�$�Q������<�OO@�O��jjW�sݔ�C���zh���齴��9��%��#�������ė�*��bs�9�t4������09I��8� �������qvO'��#ϰ>�]�����Ѧ�B�����/Ͳ� J��dx�����9�!�}s��6�?�If_��5����������%%8�����:�"8����� �e/�����/���n���Q{6?�!���Ѭb�w��l<����D��f,
�����"�4sm%�����<�Qe�x>Lf����tqp0ʸ�o�R6�狩�r���b��t��y]�d��:����� �š�R#����G����7r����m��!�XT	���&��(��7��y����M���vBwtC7������7�JzS�[_��߼�n'�vܭEqR�Xj?����V���F�����=h���ɵ��7�A��k����Q4���+~��1�%��Q��m��I�DʳV�,��d�-Ϊ����V`�d���w*��]�(,��LQL���.؅ߤ�`Bs��M�Bl"��#��+�����#1��PZ�.�0ݥs�,��z6[d���?�*!�H�"n����|��0�N���A]�j������f�>4?acku6� ~,��0�������� ��(*�#��[A\�O������0���AFK�O)|CX����^
vo�2)K���«��CRK��X��#��?E����4�g��#tj2{�C@�թ�J|�󖪹l�Rm_em�fֶ��:���X�͂���b���_��X���y��f�~|�S�5�%ݺɌ�Qu��Qtt�Y�ōj�UK��耱F˙�P� �Z۹y�.�ͻ�x�oUֶ�����    �rhOV/�rP4?�9��6� �[aJt0oԠn�v.	gQ��L*�Kĵ��<��6��_��@s��CxwM�9��QFxQF-�@F�'��ܘ����3R�.�}�p/��"N�kbB��r�>��a��)�G�>6Ar��	!��r��C�CJ�����}KDO�N�yW� Τ�%�܇1vf��2f*�@��/���SxC�����|*�hHJ�|��0䈪��l��IL�Q��P������x  U��85����_��x��YZ�s�B4h�%\�X�H_�@	.�<J�-к��ON�`����+U��Rm�}T�^�����1�@X���/m��Z2p�x�2�]�lhT��J!�1vy��w#�F<(���!u�'Lqp� }�/�����,6Gr<��:����8�!�
��,#H�}	$�+.LJW�`+��(�����*�����T]��Nx%�	�?ă/�_ݻ�WM{�n'iF��e|Q�ݎz�N3�5��~�x����k�itPp/�I܊�u�l�Q��LL��m��l��6��x"���難���Ȁ����[�U2��@-M8֚�Z�n��A���1�
�{B�v;=쿠����`X��an�N��,5l\m���it�)��Á���lx0B�r�:W2(֍#O�F��q��r7������W��G���9ׅ*�\�$(��`��>O�r����?fq7 ������3͹W���o	=%I"���z"OA�}.f9zL�	s�J=_@u	=ǜ<�Ͻ��n!
������x����.�<���3]�4挈�v����U��b�$�D,�)q�نM���Ix����z������(K��<���+ʆA�5���trD?� ����
���T?��]��K�S�KNaI1���o�U7�3[1b'��ś,bd�z\A��
ec�m�653�G���=�,�ަ�W���I[M�8r��ڧ�z*�^*5�~���-[A�~�D�4�?*cI�B:�T��o�dӳÃq�3�,=�|,�XϤy�q*�	n-��s=/:��A���e�����ۿ
L&�����/I��ع���:gZ@�4i�u�i�w�RS����/�`P���_�N'i�I'X� 3�u[�Vԫ��^�Qm�;{�#���ȟ�����cRn��a��{Ì��0w(�3c��^�Q�o�+�������R3th���n�H�)l
�[b�W��
�>��p1&CWǵ������e�t��R�K��N���0�x�
�n� ��x��Xfh�̧�co�P-�)���)�^+��N��ł-sg�q�>ǆ6��(Q:89ʯ�?��j;��Έ��Gwh4���%���[�E ��gU�Pחhd����+�A��k��=U`i|��Y�6�S���}�3��B ���t�Y2�~.-$?ܔ�^�D��	E`�:�,ܒ���?�G���FP��?���zl9�<c^��6�tue���g�%�b���Ҋ���=�����f}:ء�Xny�^�XR.��c�g�V��M~�Mci��r5�Νz��K��4jv����Q��&Ѡ����`�ng�=��`�`~h����
�_����D�͂��Ou>�S����$��e/
��q���,*�R�(����Z7������&y"g�}�<�K�a�݄�}ܦ��؅���@H��l�X�)ӌ��Qʚ��CH�'�5�7�}X7ܹo�8��;v�a���f�o͈m֣ڼs�u�~%��EA�ȣ�6�x8�����,���3��z	f��dl:f��i����<���f`�KtA-�5#P����{E��}E�!�.e���<��b,Ǿ��[��<"�z*8��~���	�������տ�y�MWK=���#���-.PՀ�Mv�����\vJğ0+t8K�xT�G��ֆT�3�R�[�L�������p2-��p��}�;p�?sՑ���Ķ�6	��q�׷�Z=ǮJ��a���+����i}�i�%&?�}���F���3��ȭ�=e	�H@�7���|Z��%����N�	+�k�+�~�o����ο���Βyw�N�j��i���F��X���V�Zi�Uk�{I=��	Q)�c8��I/@)�����oT�^���/]h�iO�q�m�O�1%7�R���R�6t�ܟ(;���6�Zm�E�+�Ey�S�n�t?��o흴���|��#����"d���ҟ��S������;>�J�r}f.���=��9mީ,R��w>|���ѷ�x�j��B��k���ZBi6�ϦY�:
�#{�^�UQa��~�Y�t70וW��8zK�h��^�삞����0�ǳ/2le��&�X�2N����a����J�I�s���}IH܇�8�����)%��U�K1������ |9�c��XP�9+���`Y$!��<~�c��a
���!o�Q�=�r:^�8��L�V­=�����-7�K����ئcP*&�U�4�ݬ���(i��U�m�C��z�3���v�Z��qa2_���R����&����w��h�\_ P1G��w��r���'f�*��� XI���@�Nh��Vo��f�W���C�T�#�0.x��߄��w�?Ͽ���z�N���|�}bZoM~c������UA�sAY������b��4K�3�!ĳ{@0^�
s��o~����ye��m#�v/ǃ ����L�0�6e��G*�c�ޤ�U�+�vdT{�N��#O�ׯ�j4�v�#Տ�81K�q��'|o�`Lk��������ZA
�hK���i��Ć�#EV���
�1@R��Ɓ���}�\�K�9@�YF�.�������0�� ���9��Yr�9&ޜx>���=�U�����1
F��g��O�R������+<�,���k�V�A����~���������yW�ZԳ-��l�r�L�n@��%��Li7�$��+v}��s��N;�N���W��u���vQ��{����Z���ws�`5|�&���{Q����˱��li�秀�~n��c�pڮ���&���N�K�M�����=q���]���uW,���2�&��D0�?���>�@�(2��2�&�7�h&�� \3	�ِI͒��QÁ�	��,���!N��i,x�q_�;�c��V��Bjm���h�6��)^�'��o���j�
�1�E���AYU���hk\���z�Y�_���o����@�8��p<π{1O����|�CD���o�|D�D%{��E�I�Z�3���|��n���(�ܖK�"����w�~d�|Vy��gԱ�0a4���H�g�e���R?#zn��(�L��-H5TB����� �)s�4 ,6��`1��������R�bh�"��"���\�sB����Œ敳m����s%Z�OJ^�J����>�^l[n'đÛ|�!�鲡��/��C�}���}~�g��0�6��pVgI6��Sb�;�N�!�?����_M���~�+��|�@b���E�%�����y�p�1�!_2\��@�^Q����Ig�d{UR��A�
�G��i]�M�Ҋ|giE���p����*l�o���a��8?����|���jd�&���Q��ծ��vI�A�N�t[i�^���͏ZQ��3�����Wm��ٛ�`P-%H���-���� �'L�s�)A���a ���p����!����
�w	
�� WR�2'/|���M� �Z++;�I����>Р=�2�j��l߶}#��3�=`����-�Fz�[o�t���]�"���
�_��Ä[�x�F;�c�?f��\��XH��:!�4���#p��k�BA*��`8��*I�~G!�7H4�щ���`������\ZP=Y�G��dxџy��R�W�9Z�?34�Gq��G�#�s��ǣɳ ��mro?7/�x�B�zMX?��[)WNwf$��?>�|��ᢙ��'�o�#�a@�pl�g�B�	�����t|��`o����_�6>G.��o����zr'�|���/�|I^�<�+�a)d�3-4�E    �b]�53on`}L�[�����㽤�z�Y1��H0���W��y͓	/�^��z��}dVzL?/0&:�%�X�z�+�t/RxYn���;�z#m���(�Qs��E�^܊�q�ѫw�jV������k�X?���Yb�<��C�|V�՛����q>!6��\���<����*w!������j����7.��i;����1����r`,�S��V��8��N�H2���{
+E�Ig�������Bw�Jt"�����*�v��:��?��ۻ[�;��C������h�
&M8�fi�S�b�xh�l�T*�ۂ�}>���>�a��'��C�@�PG'0��d�t����"J��1�|&���?�QD�w����4�}A��rwϥ�#���۞��]L ����ʳV,��g�����7_=�!�����qj�� ��d�(x��<�>t�t��bs���"�!忧��2�0�Hp�`��b_�Su}q6�V7ICkwr�"�3]eq�7`^A��g}G��W���j��٩Gi'6i_�ڎ�V\��n�����^m�a͌*���_�Q�Ԏ�]"�������܄�6��C���dgo��.B�����l���K��y���Ʊ��`4�O��)d41/�y+�1�jL��w��
��̋���ޒ�Gx�M=d�!J�����q�1tfh�V�	�����&�ꏍ=��hj`�	�2-�$��2��sQ�J���g-z*|�������Z��d͍M=z��L��GPy��&�_U�2K�����R�Q�f�pn"l�~n�t��/�j.Wr)_��ȑ���J��Q���*�t���ss�$#(�͸^y��<��y 2������ȇk�z,)�~4Ri���������ꕃ1���0S;���i��U���0L���0�+ҵ�t;�$��Q�]3?�쵣� �G�~��ԒF���C]R[����Ƈ��(v;�e}�%3����������C��Vce�rb@}&6ſ�xi�b4�T��QV�&�BV����ikjkQi����*�����Q��$��a>8�!�����(ˎ����0c��8��v�S��VV���pR�to׏Ԅ����٣��A��Q��C�	\r��Ri��y�j^!�u�� Z�0�d�w�G$��l��2r�C�;�~創�˂�a�w�R�_��X��f���Ɩ5�-B�����V�������m�})W�Ť?q��qw�N�����^�В�iǘ��[�N��Lڭ����Q�`CW50��7ߓj����<� ���b���F�+�9�W�'�8hO9x�%p�������E�ʡ�'AKs`�a��p�m;���>���'v� �	%�<z���>�W�̘k�BO	y�'<�k�}҂oT��*s��o�M��Ϝ�?��r{��G�̟[J<ŔDXy�=� 3 �O���H=}���C�+��%��(<>MFp�Į�\���+����`��+�|�#=�p_8��5�b�s�ܜ`)ᛪX��!��E����CFu�m.�õ�h���+�V��Z�U��&��9�@8 m��d��"Qx�䧲���t2�B<Xl�����]̐��e�S���H�	LM�`GY��!C�lnR(��mM5}z�T����tR8�����d�u���;,�D�/+��>X�+�2W��5����o�X��-��[�r�M�N?ku��F7J��Z��:Q܌�(k��N��h5�)M@;xZ�3��s�e���h��T8\A{�{,�����BB�\�t�=���YX��'r	�
�/��e��_�W{�o &�w?��T'B�ƒLF�,�B���8LU�c"_L}��?7T��F���`M�R0FB�� �JZS���LR�;�������3�wR ��!�c�0TC?z<�Ju]��4�w��'�@n��Hk�)R�Ρ�8�	����Q��7�Ӊ��=�c�0��Q_6�-%� ����?�W���0!�A���(�g����mK�[Є'�(�z� C?s�#r[>��{���¯��ܥ��"�;żk��ad��5�Z�ɿ4�~eKK7qI��nQ�I��e�z�A��e�F(��Q�^9�A;J��~����k��L����GL�İ��'?8T�����h�k��R��w���}��~��3:��2��@0Y! <�V�Bz�^#,�[�7Q�Me��a�xbꀥ��
�
�?����/���X	_��D&��	v%��@j���0��F�ő� �Y���X�w��QXzJG��}\�0o^3�/�%�u8�2����5�3�V�-�����Y-��^=�Б]���j��j�p��T�5V�>�?Z0�|j�7Nk�@�������� eT���Z�T���+7��_�	���^�W~�e���Ԓ�I����T,����MB��� �����4d��j~�ێ��v/j�����z�ʒ~ߘ�j'�Y���9ag�{w����8���w�b�<�z�yb1��'�2)+�|���'�Ykˎ{���2���������@X�vc	��B�8'��u�)��޸�{P[G�����n��&4
{t+$�YT��)=ŧ�e�N)ڻ��4�J0u��N_45ި�%��|对��CGݟ@��ѫ��;~�`q؝�+Ӊ�P�|�`�e�?�a��m�+�����_9��J�w��ß�$F��Qw�q8�jU��I2�L��x尤.��|�K
J/*,��� q�ž\͢��k��PpNpgc���a�g�y�o�)�fЏ"�}$р�D���pk{�^�%�:Kߪ�QJZ	��A,&z~�B�X���J�\�TZ-z����k��T\L��ܹ���Ļ�!G���]l���+R�[�7Dt��"JvA@S)�6�z/j׻��ُ���KҨ�vM^�ei�/�ƽ�Y��@�y��᧔��gIA�ru->ڟP5����B��5l q�����qN,E�E����J�{�Y��$��٦�o^p�vI��[*]�Ɛ�O��M�9Gѷ�F#d#�1�N��.q ر�
�}m�D��� $¯&���m�~�K.y�6�+|c��*H�A�x��{�{8�O�q�N]�\�>����h��J�@^�/��O�-�`�^��i�g�MW��(��/�|�x#�&ch�<���E<2Y��b���ɞ߁KΜ�f�"l��t:ס
���ANV�
��A�m/~H���l
%�1>���t�-�邦k����[�l�5k#�^�$ ޣ�����JlJ�ag���X��m�W#Z��k��+�^��-R���=	�}��Â�CZ��p���
&7*ۙ5�]�ĵ����+K<|o�W�'�v܊�F5j6��(n��Q�2�)���z��׼��Z�N�8����~��FI��KjI��H�{,�yTD^�_�u��i7�y%1zC^q�다�R�]��:�kW�"��I�J�5�a��"Tq��1���[�b�l���n��E4���+��q�%�qG��5�h��������h'1��:$�Vb����j�5M<tNye��} J�a���`��[	U��:��x�jm���])Y@��N�O���p����N��+�~#�a���lk�{=���R/s=���=�3��R^�����+�^�ai�{0�o���^��W������/e�}t��_@��s�r{�#�<jji��o�G�plN�л��10 ��([ݭ�|�c��wB����gG�~`�"�o��A����+�;gCo'�,{����}����NowS�w
�B>4�٪��Q��� ��A�'@��F�d[��X�a5�t�A��6�Q���a�^'��4���nV���cy��É��}�v�>5�=�������,jb_�+�h��ֲ6doA���=Z�x6V$1w!�Zg�Ce�����*��B��x�b0!�8�4B¦s����-i���1��U5N�	��y�{8��r�j=���q� �>�Ӄ��2ؖ���G��Z��`v& �"���)��~��    C�y~_����+�F/(��Pr�j&��	؉_��:�a�j�2�w
\�x�F�k������".�K�_�'\Q�hI��+nZba�i�:�4'�pI��"�Z�v��~��F[b�yKrM9/>6�
���)U�I�ʃ�,��%.&)7�k"��H�NqK�?��/5p�{a���nv;\bhG�.Вl�!�Ό����#��h=�TK��^O2@��V1wmA����]r�eE8�+m���R%��{�c�&���t��;�Z�ݨ�YTO�N����Q����I�^m�{����dF<%�`d�������R+Bj�f*�^��AA�@��C!Ϭ�gV#�����k�����C�X<�?S�͒��d�}�J|�[�ʭ�3����rjB�X��T0I2�����ǝ/�M�� %&1?1?6�µĽ�X�˄�v���T�	��k�������I�/$�4�4�d��It%�Ԍ���Y烼u9�T���)�ħ�8�<��� Z͉Zu<���LC��0�7-���W4���D���#��N��Z���M*���:��s�b��*�-Izڻ�jw������~�5��F�K:0~�JZ�^ҭv{{�|4��k��W���t�w��1�r=��U�}&G�$DB`�r�kN7��&�M��K�
1��=YZ����P�p� ���o�K���$�F�Z���?y�s6��K}Y�}U	7;��wsk�Y t�S������Kڷa+ۤD����:w�>��>�fK�D���6�s�s����!��&P$�2�K���d��jE��$L�yef�|����T�� )��������O�*��dRv I��]ѫ���}B�qvG3H����d��f9����Po*J��GÑJ;����|vo8�AҼ�^pM=#�C���w�+��,o:N��'�ov��25>|�!ւ�9d���	���\�Z���Ut�z6R�
�4�޺WJpX�z�b����r��D�oEx�	�E�Tp}�hwKz:���6�2�+� ��{Fޫ�&ٺ�n����[�<�����.�U�$�[���N��&�(n6�Q���g�^֫Ɲ= �ˀU~�C)��1'�����^�G�DW��-Nx�f��M�R��WX� b	���<0�fH	��?%H�����~��*1��Vи��
􀆣���\�����a�q�R1�f�WB1��n�?��
c�l��$D��b8��wX�)O�B���$�9��� Xmԁ[�%'�0r����hR�����GiHh�H�	/�t�N�XFB����+�ʴ����-�T	�-��K���kŬN�pmv��_�*�������z|0��0������¯�}�v�kh�{Y|$E/0�|N-���'�>#�t���N��
���xƙ͆�l�EY]r�a���䪁Cu���j�?��Ĝ�G���~��~�G�`��Ѓ�Q<v���jY"�#$���p��t����pzj�"z~4�W��_粄�c��O�����d��� �!���q�.��x:̘�����<�ů���|6˦�Y�V���@<<�/���=u5FF���UL�3w��ŝ��2!�ј2����R>�oT� {�-�jȏ��j�q������t��4�K��E���y�:�zi���S2��I�ݤ;��a*��X/��n��E�V�9���ݬ]�=��pjONX,��[4��92�"ն���.���8�����^ܜ����1W�i�D��>���U����A����5d/��r��?\���hS�̴`.e��%HcYN�Kp��6�w��^��Q�������~����}��O�U�Mn}���P���O��)U�+#����`�q��	�\2>K^P����L<!�Mؐ��Ġ���E����'f���uY���x��,�#�!	KI�
;������R0չ�"+>�S�F�x&9����P}��d�%)xkW$��թ�iA�.�%����3������/aaJv��w�I�U��I���@AG��Ռ�c�ۭ��;{<Þ��Z�_���>n�Y���CH����8A5���bdX���9�y�RCe�pO�V��EB�l�`W��i �D5\�u�����/�;�,vѺ��G7�%(�@i���L!�ǳ9p�Y��b<7!���h=q:01�ʲ7*9v�!y��4ҏb� �CKػx�b�;T����`B����Ą�P�����x��Z��	�ʤ�4�$�
�_�H�IV�T��Dn������ʾ>�p��<>�h���#����L1���ݹblx�I*gZ���֦e����c�ι6�QA("%;��M3�^ԛ���T���b"Jd
`�]� n"	Q?�suR�@wKT̠|<���Y�sE��� _Ky
�ݜ��z�XNbX���G.�z-��x,owU���]��6��A��I�X�V�	^�S�G��g��9�Ν��I�i���&H>��Q�ڬGY/�v;q�|�#Cz��`�堢9=����mH�kh��N����2��}�y�G�A��s�~#AW/�e�%m|KK�������6(ܮ��k���8��čK٣�^� -�ۇ��t�.�&���aG}�����{zdɘ�Mk7E����Rq�Z����B׆�����9T�&�cM�ѪR۶p�$u*��^O��������������u�*�XUG/7�����7�jө��@��l2�?@�HM5��e����f�P�����0������
�w8�:�p*oVe������I�%�9�2&f�~m��zo���krm�2/���&%/\g������Df'��b�S��KI|��9����.�Q���;=��.+X%&5G��m�9��-�˞y�H��|�F���4�|i�B�I:9]p�� ��Lo�&����e.��w�w>�-.�{w��A��4�Q���&�H�A�&I#��n�ׇ${0����Y�|���ނ�im�V�0)��B}K��o�/e^��ZHƕTܟ[�d�F�`�H	�He��	8��OIo�����	N�N�����(6�)���lG(���~�C���+ߺ��S�^b����.D���E�
.�̿L�3u[�K�L��.�u�V�8C��>�0�fDnw���Y����v`��l̴��R��wY���c��m/���j��y<��I�M�yH���C@��i&�����k��	�ԟ]1�׋��B�UTZ������ՏB$�7|��\B&���/�o�j�v
߬��f��D�~�U������V���1�L����],J�GN*���v�Q�DY9-fx���v����*6C���|�2%�V�ӹ��
ڪ�Y��R�PSgqY8~������o����M8��H	4�2K�kN[����� �`��n+�7�*x���VA-��g��������:=,�lr�O�Q^(n�1�P�ך%��a�Tv�J�.�J��a�L(}�[���:O�D�"���e,�t,UAK��H�	#֛%�~�-�5�l��¹�����ﯸ�n���o	���б�ȩ�lڑ�c�ذ�
z��Iǿ��Q�W�7XpC�Y29kb�Q<N!��Zf&Sަ�e��/���Q�D��϶]�Ѡ~�����\�����fO�L�F�;����[l���{��W_Zp�W^�����c�/�ռ�h�*	�T�VlU������D �OB-KZ���q
 ���wVW�0��ҞYd 6���K�دn�\�"iRkT�=�i��f?�E���4:�j�;���h/�=�����4v	�мDc�L�sx+x\0Ɣ_�?,��H"�q�2���G1�Q�G�<	�ڷ+��ۥ Ÿ�C�c�Q���Ӄعg��m����B�ſ}I�Х�V����f�����l^O��D�w�h"�n�N��!u���7A�^(c <�;�9�O���༂���ƴ�"��gTw�?�)]b*$�8T���E[��2���g����Y����L��8�I����psI�Gf]�' J��ٜ����[��3��r* t�G�vE�:r݄�V�2q���7�(a�0�?�ͻ<s�k**h����}���     jV9�t��������ގ�f��F�Vo��ޠ?�'�vV�"%���6���N���^��"!Q�\.�����'��o����V��螂�)ߩ�@$D�}���WѨ�?ެ��h��ͫ��7*���1W󨖰����;n�'�*���xt��w��t�Ǡ)�- ��O�vr��*���HwL&Ɩ�����D�B��3�cc;�Z����`05߮����_B-@zk0#d��Y6���~tR�B�c~����
�b���gv?#�3�Xf��v���x�`��v|x�$PTkm�ó�5"��n4m v��z�t�r�0��Ν;/�!Dp���l�����8�,є�:�
"=_�����2VyyE�����|���\~1�{�8��W�����%+>�?�Q<��O>��[�������V�7�H�4Ϧ&pA�?aЄT� �ǋő*��Qu�!G�p�S�����_J��n=l��������N�v��x�m_�o�O�x9W�b�����?ƶ,�*Ǉ'�a2���͈��0O��qaM��#�s�̫�m8�	 N�8��6�f�V�'G�hY�1�A���xe�3c5\�]�S���L#�z�QT���ޣ�[�+���N&�.i�c������P4�%���K-=[,^"�-�8v�`���\��iǿ�_ؿI(`���Lxt~�
��Ս[�lF�:�Xh ��ƒ �Tv����{{q��{�A4����ЬG�Z�m"�f+K�V�4��[�u�FsG�F�5kY+�7��(i6:&�jW�qco8��HJ]�6!�����l)��]2X�Y4vu�s�@*�7�	:�ke ��E����:xRo���b���D�cK��G!vO�2�V;��o�#ԙ�r�����O$�wE�G�5��\��ɂǋ������#c]ڸ�0ֵ]�S�)2�0)����|������W����z�`�z<�x��bkvJ�T��.]�n���2�O�o�",�U� ��K��OޕU���z��o�v��Q��7f��94V��_"�䗬�;k��kﳶЕa�U,J�}�0"�
gL�	��J�s�|�!B,3n�8���q{��Lc[�yɄ+>�yNE��E0�*�}�58e^2n�K]s��OB�C�8��x��Py0�a:�?/�T���-<<����_q�|�sM�8vAF�>ѻ�-��>���Y��z}?M`⻍W+(�q�{p�?gkUY�M����t�����@|F��$��_���X�>�i���hD��?�"l*aՎ���f����$+���e[���f�֎�Ԫ�@�`�1�+[�h��S��U[��5
w�t>	+��P�g�@��jX���Yg��pk7��ECplsc�!w5�r�U�w"��%��Z��;M��F�6��R[o+�0�"_���(�Ԕ$�v�iYo�7��ny��PD�d}��d��x��Ɔ/�x�jw�n=��Z�:���x'ɢF���Z�7i|��fY~����#���j�k˩� {ኸF5<LB��>���k=7��쒡˖�R�R�g������(�b��Oj��:Q��#��p�L��~<Z��`-H�h�7��n|0��s��3I������2a��'��������. ��ǯC���(�Ͱϩ�zp��ջ��cNE��H�!���_�8󵃰���,l}�3%�K���xWK�Hp0fL�e��.�g�f�su,�E�"�h�x����H>��3Q��lkH�!/�PѮ��B�1���� �2�:'s�Ae�#��Nf��ysN�'�p,$�����r����0���� ���9�z,����L&Tg���"�y�7J����Rf�V
�[�ܾg���U���j��2/�]�w:�z<����6�֣f#�Dq�׋��8���~\#N���k9N2���,��vI:p�o�Ez��+qv$���?ι����=`H-͘����X�b�� ��u�IZ���c s������t��s���!S.�ea����&w�����C�Q;��d�f �)�� -y�]�+��3."�f'��5�*�D�Ϣ�Lˎ;�R ���`������:�.� ��n��H��̓T���[$�}8��N��:ߩ��������b�\c�2����L�!ɕ{�y79*c�����@�M��=[�����ˊ�O�\ �
�q���Ɠ`q�]�`r���{��iL�BVI�Q��x�>�t�:-J���^��x����k<NĖ���*a
?�U������N7�'��~����vzi'NӨӭ�fүE�^�%�d��'�4n���&x9C��_~G���dp�v�(&^q��QPڗ������r��휚�P�ܜ�����U4��R��M�w���YyTu����5�\kKYWT���!��+�V��\mE��la�in���>
i�PYg׋G����Q/Y����R�As��g���r�	���;g9����؞�R�=n�%�T�$ˏ.)�D��̢�$����V&e��j�b4�`͆�r����L����X��Rޕ��H*&��;��v��&H��t:y �+	���A� �2 h�%�/2��&�W��iPH>���+�!&)�E���l���!���~ٖ�&����)�����{�l�!���ۄ�9�A�`u���Ik!~�X/9�<0Eb���G��oT�����>���Qp�_��2阢l`MbK�S.Q��ɳt��{j� ���^�R"C�
s������U�0����EIY���Y<�UQVkv͏�M�6L��j���^��NC�Î�i:�
��o��z:�a�<�Z�^�+����<m�"P�nK�����&��/+?+"O�8$I��敍�o�U�?�%^%_���jG&
8���$�m9I�"ܛ�g��⵭�����ZX�\ɩ�S�xj��8�~Q�y�p.TM��^?�i_~-O�fHр1�Z,�v~�^5eB�}"��B��l^}t��)�I�&�4�éX��`�ǍHfˎ�ɞ��@a:���ܘF�>:Dz@
AfPQ��hl���`km��9'�(����u|?�ΰ&��C�xB-��>������x���O�Ջ5ϕ(iu�	��c���f�j�����r�3[�Я��~U��@�9�I��=��*�R�a��;X�ar�μ_��~���L}�U;��_��l�	�`uB�K��֝� �{�v7�V���תQ܍{Q\ovj�F�U͒=�@^���g[V�xO���5}r��cBE�'X��V
?����]D�дAy5(�m���z���m@
u�_�S\1O�������$�`b���Tݙ"~�RbJ+aHf'&�}1��s���n�~e�:�YѲ��8�i�l��0Q���af��PB���kJ��w��bqt�W��q���Ƣ��R`��|�����t`�������m��hU+i���M˖Ι坳>��\z��]�\7��w&u���8�h�����\�Md��ѻa�C����I����/��6� ��{���T�7b˱�������r���T홍��5Wt�ޛ8,:��+p���8����Q�)�v��pJ�8�Iԡ)w��� Ǘ*���/�jE�9o*N���~!�OL��
x_y��Da�2�N�	N۵۵�����M�m���EF� �o��g��O�Jds��U���i��V֊۽�f�z�lL�^M�Q��O�f֯7�鞯���Z��'K֕V����GVp���&y%�D��l�օB�4V��:&l���OD֨Rs2Z��ʺ��cf�1P�͖�q<$�v|[�C�/}�3N֥�>$Y��S�!*b-[�x��ub��~�@�����g(W��A3�����*:H���	;��c�5����0*�
��~����09�FB@3��g̖��G�4�a����xHH���|#N�� ��L�KB�u_r� Q!��i&|B���Sr=*5e���\4�U���>S���vԟJ������i�D��f��u��s$t�p0�÷��0^s) 5	  �+��^&����&(��� ��dq=7��2���{0�6��84��;�O<)�@���U�jQ�� �P������-�f�Z���jg��ѡ����o�O1�Me�����|Q=���\���R��WJ@8*Ѥ��[�/=�`����������m��&�v4,;8H�7�k"o��	v@-�*�Џu��X&Sf���!!1��i�$u�E��<�b�%-�b�ϊ>ј�9��ޤR�plD��?�Ns��DL1�������Q|t~88�>��k%���҆���<��ʾ�ǚ��X��V��������} :[��*�E�q�,��a��]D���6��V[�Rf�h�$cءz�o,A�)M�>a��)� J����(�,���{y�#1�u����x�d)J���v��TkI�u��n��������&�ΠӉ������e���HlU�ڱd�c���`Z��R�Q��7+����zح��)��h��x�3�������! N D%"���ù��t�'
��+D����A�օ�x���-����U��D���&ny&�-�����*��a��z�����,' ��w��иg(�I|H2��4��� &���G�OZ��R�[�*25Έ{&�E��/>�7��"M��]<��!1B�,s��083;NU)x���e0�~T��]����@�L�)k%��!�%��+�B*�+m�KY&���e6!t��W�6ߧ-�H�Yw��|0�=�z�N��6��j7�6�vԌ�,�U�I�ي;Y�֨��E�QW_��C�|���(��-����w	���Pحm��#���v��Af��'�����>�{!�=�������^��ѳX�|:j_K�M��4r�_�Jfl�q.�4;#[�� �;A���0���q��s���hV���t�j �1����y�Q�(�
����~��#�?�$"aa�-���V�Vg��ρ'߄����!�h21;���@���8B	D�c����l\���&�V(s��K+Mr���#�Xc[R��B��kjj]�S9���Q|�j�,�_/��P���dA(���&'Yv�%��������>)�N�+�����ˤ�+K�p��*c�{�ti`��Ix4P�<����@� �`���o�D�J1Ah1�F�����b� f�)�-�������c.u��A�/d'$23�E���� ���{8�~�(��lmv�xJ�h������Z�]���_��&�U�����-��Bf��?o�]���l7���Ƕ/�_LW:�ʪ�$���]o��f��B?ieQ��$�A�^�4�� �{w��uL����G{����R8W��l: ��_U�d1���Q�pY�j�@U��b֏5ڡ ���'��sݝ#}vM�r��A�S<��aN�'3hH�09�?L�T�w-蜑W2r��˴J�KI	jH{g�r�I	�Y�U�Djn�nڍ����� t����,���L@���C��jp��|cԑ�E3�G@��C^=>g��m�d�YG"e�_��%�!|s�ϗ0}$R+\���[�'۸E`��Q
#�D�wH���D�,�-�`�f�Y\�h\�N*���a�dE���(R�_1�;���+[�Ħ��g��$ђ��]V�y�+�b
_���E<���XA ш}� �x�q٩���d��o6qbk�V�/�V����*o�M���=�.Xiڊ���s�}�����>2I:���4�o�G���]�E��x�&8~px����Y��"��v���W����:C�����d>���\����D�hs�w�������P.i��L�n7�Q��L�f�ي�q҉�v�S��j�v��'�3H
v��>�0]�]R�f�ya�7�h@�$F��R�YA#n�P�P�I���_4�W
>���*�!&�?�8�Zx@��R!�-O��SȊD�ס"O����|C�試g�u#�-��lPL�e;��)����Y��yYߨ'��Ő�����뒃rw��þ>K�̥nh�z`�f��{@�pY<��y�Q�ov���<��;��[Onґg<ڦ�h�me��A]��߷4Gt �K%�"�X����ϻ��������W_ɦ������P�ٓ��Nj���Q�� ���@D���h
}:�-l�)D�yx{/]������sK��i��}h��p���F1a�u`��s�<s(W�2���K��r�=�1�٤��N��Y��P�~�)�}!eb�r�+��jB;��ͼ�'��Gl�R�;�x��M��""4��M�������ޝ;w�?����      $      x���[r$��D��V��cL�|i-�����mR�����ܐں˪��p�������Z��lF\ܦ�4Mr��ܝ�!��w(�G�FB���U̴}� +��%s�Ԇ�qY#����Fu�9����[�M��\}��-E�m������$�WJ&�䍔0M����Zj��ú�W��`;���)�p�L1��B
�W�J�߄�ݯ��'��{�ִ��-�lJ�vv�J�p͖:
A�T��hӻ�&��{����p���fW�µ���vf��uv���<�<R6�$r[Fٹ�&�H�j��ZM��Q��J��k�,-+�:�o���dV�o�~
(�D��q1����uzU���J�T�����h�/h�uNܮ����v[c��\"˞�v�������/�T��.�^ץ\z����[�6U������X^|�9���P�u+�K ������,�:�H�N��Y�)fF�3u/����˯�l��^�n�pC|�r������+/ֿ8{�f����I�n�0��LI�y�.���Z阥��(�ź��%�X �ؠ����8�`��)�z�����%X�K��(o`hV$��v�!5 ���8�$g�n���LR��X�>c1Ckɍ��,�W�ŮW���3A��,�0�)�����r��U�n}��M��G����.�kk���My,}CVf����s8��k&�cr�̥a�x�=��V���s�h��)�� �L��ݻuu�$�"/ѱ�9|d�'`�o� �2�|�:�1M-^5�^|�dw����BN����LtB�.d���r��^�%��p��6����3�.e�
��L]�s?қ�1�݊�53\Wh�ib��6�.�t���0k_l�i�OX,�8HCrL��(����d���M�-�V3�`;��3����]&�xG��Y�6�O���q��x�,�3�+��ʦp\A��F��`"��{E��(����M�9m>I�N��PV�h�: /�CF��?���ȭ�
�4�*B�Ma����u�����	O��Y�w%���Z+����c?I�pDv��*�2�Ќ�N�*p��^\��G���S���k=9�[$��ݤ���"��NK���aǣ:A8K�C����p
Qv���}U7���z�5�'�vg�b8),77�@f��6���V?+�n�wB�Q���@�0������*����ȗx�ɾ�ÿA�3�B�۵�1oH50S.6R����fN�C&�d�O��3p22����K4����� ���c��I?���i�B^9ml��~�4Z-�b�uh��VX��%�D3��*t�� �Kv]�e���n�;�i�W-�.ak`��W߫�x���'�����*�f��+����ϋ���\�W���8w�>$W��s$�� ;�#�u�C�b����-�;� \��)����1_�k�al\�̊�O�/x�*�io٭)w���*� �$\��cȰ��b9+0U0Nle`P߬]׊ث��U����-Z���R��vm�X�{<����J��Fsj�����D��W���I�%��Z&�)�y��������'�1z�d�u5�aagm���5���`1m�Σ���!�;��>h��- ʐ@s#��r�ۋ���ҷ�����R�F�`���6;�6�Շ[4�Ãb�f�U7�E�]��u���_b֞&Wpv��AC���$N�.L��	�f��~{�FŚ��-���$��\��=�Ç.Q����)������+5o{�� ЇۇU<�ܰ�Y�^PmP
O��PÔ�J��A��A�8%��K���z�D�G���~����h��b�[��'�>*�hz���&WM��<D���c.��}ߘ�L�m�]\fD�dn{�I$���u
"w�c,�lRo�	Le^?P�Q�)"a�����ݓǂ�򅝜A}O��P��}^~^���[��$��.�3������E����؜÷��>��� d�k�:+N�5�c��
�H{$TP%��P�	����s����$���p Q��pl��2�hh�ҵ���}8K�1ͤ��Xv����Q
Eٳ�L�G��>����g��hv󧗈����rku>ًi�C�k�w(`7;q����1��N!�%�;^������~m>-{F,�EY��'�:�p(�^��:�a3X�Y�H���ژ��.����9܂K_�u`�i�s�$����J�L�AB��^�m@���.w&5��pz�B �󶸱�oΓ�~�4js�Zm��Zƚ�I@����=qHu�ӝ���hImf�5I����R�����>b$��
٬�C2�q�m�8�1��n��$��pBX���$���c���'����jW����FfDT�q�CAt����ٓ�#�T��!P5��8�	;�.��hP�a���vCU��������nZ�Q��#g�S��M�a�l��P�ꏜ��"������>�u�x��='8k1�JQ�!����|�W�D�e�̈́���r`01CC�"L���yÓ!Ç|n�4j[BfdeG#���A��z�������.Cǣx�&2L��d��-�/��d��3���2�gJC�Υ�����7�|�S*���,�C�b���@�m;g���K ��⨔�����K�l���ն�q0]�UDU:��p�5	�V�ބn\��- ���n��w��=�ϒ!�ާ̸�ʊ��lЙ"�u�%�۩?��P����:��d��@��y_��}n��{7��&\m��>��00�Xr'A�w6!6B	�:cQa@sp]#��зqk�����~y��hF3��}9Y�a�[y[�D�<#����L:�>��Ɠlv�/�!�4b�i�k����ٜ߿���m��v�t꡶�1��Ads�Q�ț
D�wꑟ뎏��#�~����#��C��&j�45gJV��"��p��c�m]Ȼ�:_��!��<*��_�,4����"�n��!��w����,�\��u��l���њ=K3�������Fg�6qE��p��pCV���N���:�	nI�8��C�R՟Ÿ!�#Nz2���sqX|S,f�m۩������@d�p�w+Y�b�쌸�l��z��xZ+��ʑ�J=!���ϩ����iY��ݺ:sz�i���T��N�YjŧE��ۗ��X�O�g��^-��(0�O�%�i�a'�4�S���=a���sD6��4Om���u��&��,|rz�����U.n�M�Q�ۑ~<�UE�Hd�IvAK��Q���n�����I:N҆A���&�UB���ѷ]�]����p��K�I�N9^̮mT[�鑖�z���."=����-�9�f3+��~qU�K��Ӊ��i]gN�m<�sWy�S4�Pn>���1�'���&�DĔ�8�<u�l�(Ħ:z�K��(F=�1�u.�ɝ���z��ݪ��Z��X�Ri_/������EwH<��I����x ͣk���:R�	�(�o[��GW�����E�/'�� iK�j,u벺���Iʖ�Af�������P�K1W�����PNO������/rj�ڬ]�5���A�L ��u��@��W{ �uWeC�o�v�	p+��7��*v��eK�9p������QN4��q�6յ{rc�p�n�R��M�<�V3,Fq>�5_��-f�X}n�Q�aVN��hHz(`�� g����3�Y��n5Z��`�N�����!\A7�����k7?��}�����٭٦�����}/�������펠T���̔�����t����c���>�[�7�r̺!���|:�����BE�������C�*t�H9v�����K_��{B4���:ڝ%�U�2X��M���Кsdh, PWD<.1�)2n�M�=����*�=Vڗ�n�x�}��Y���х37������a�y�×�����~��\<�}�l(���G�&�'I����Mn%#��9������r�l00�"D��AJ��j��^���&F�₞A^c�����}��Xx籱�G�z���&�� ]  �6�P;؅�ҁD�=�D�c%�&�z���������xd��	No�u�������BWO�5=0tw��X6�2�ƸD���r�.n�|)�<����'R׹��<R<�yvn�ݰ#q�F͵�2�B�� |m<�(�P���Cї��&���{?W�T��~�CYS���ݵc�p���mI�`�:����xv��e\y�p��H�4r�:ͻc���ܼ��?�7=��X�j���z�M�I�h�6Q��,G(6���������|GZ�$Օ��~p�����'�z�/
�ܼ��tB�ү�1FB��,��eK9����o���K����:��4�4�_H߆{fQK���X;�.Vݔ�g��U��D˶���-����G�p�z���1<�3��\m����q��&.���ݳ�4�ڄ�l��V�uů�.�F�����ў*��f=$�R-Vk4^��}	W���cPkAD3�*���A��i
��z փ��� ���������Ð��@1y�7<Z�_��p5�N�� ��Wf��$����+)0���[{�0QS_6��3CΔ��)���7�ه�Ć/`�t��o�Wl=�	ť�+�Y۵>)�d�X�)S�:�Y���U��zV��]u>��p�ݢ����������Įovt�qp�5�9Z�t����[��E�K<:Ϥ�-dkm�h����y@�zf�k˚|�]w�
zv��U��V�4a����'�[j5�G\&ײ������ҩ�W"Èe�؄�]�pjw���y=Ϧ�0'1Y���
�@=�:}Tk��O�$Ļ�	e��УWο�KZW�� ���ROͰ)��&e��~�C#h-=ذ���z^����Q�&�����:�$}�r�Q3|�>�$�9[�u���ѝ'�KF8
2��RB%N^����MM����ȃ�Yw�]跚��;_�����,����
�U/z6`�����G����D:�Ȫ�	24��T�#���˾�c1�'ា�U�����`��!˂'DJ�y�q�6c)�1���.���\`��$غ��}�_�ڷ����:�&�Uu���ZMϕ/,��V�a�X����A,@��5L���tڰ�j��I���~��-�n�6�c��f���Cm�A�0�C�>u��|Z���a�3	 �m.5�s�4�x�W����������^�Um�R����t��v'b�(2��F�j�/ԚN(����[^օKz�s@p��2{�zF
Dc!S�O��G�u1��Z����7��]���Ɨ�����N�I����.0~�c�=y�Ϻ���=�(�:�Q�ڇ8;Z.��0���x�ˀ��k3�b?����R�����ک|q=����T�n�7N�0�Ty�����G{�1U��}9��l!cz(���Z�^�x�#'|����M����Q�#��iY__���B,��uf=�����_)ǡ������m�����#�5���#eT�W�z�+�����"��k_��*d����(~v����%Y~T_$�p&)>��B�8LOU}�Ar}O.h��v���Q|�Hlr�!�N���FR=�T�e�Ϡ{^���s�
���[�~Ѩ��d�!B�ڇm?���!x��}W:�b�fw�Ѩ;z{I�<	�˰��U��n���?�S      %   ~	  x��[[o��~��!@[�T)���%h�4Yt7	��m 9��J�KR��_��N��@��֢�kY�ֲ,i���zΙ!Eْ��l^6�83�s��93Q�(r��7U�`���+�iie5ojZ�5�R�qö��i���T�(ԊV�TnUr�\N+q���o�O��m�Y�<5[���/m޲�s׬����3���=�����Qa�f���ڮ�[�7�cq�sܯ�&n܄8�|�§}2+�]��Nv�&�ZH��37q�_o��V�Ar[f��O��J�T��R9�dP�,�!�#�n��=%H�^R��]��M����_wZ^���n��~V����V_[�W}�wSa����[��.Z�n(k�kg��ߚ�ml,"2�}�6�3�%��,4��z��)��_u}Y�|��}�,����ʷ�����}�"��{����F����>���AȀ�/r����.��Y���\&z�Ac���������e��\��E��W�*8~�b٪n�M���p[C�C��j�g�g�e3�ßq�r��h�~��Npt����Zxf� <���&<�£���9z0�����q�	_}���!��a�3z���b?���c�&�aj �=�#�Һ��Ma�h�� ^���0?��,����w� ����X�;&��(ixt᳏�Ǹ'q
ϰ,<
����>b$��"Y��c$�9"Ս��n,�H����b�;�Q�&r/fA�#`� �]_o���I%(�~xr��ٍ4�"փ�~��}�|�s_a�N���8g&�BP�-��q��/�J���>j	�_!�.��]`�c�8} @6�F ��ԇ|!2�D�o���ՙ]$�m�*���x>�7��7[�"��=�;�
��ۻs$����NpU��,�G��u�SX�nLl��V���w�t	.�l�Y�rxo��")���j�g��0�'���KZӝqE�5��Bm4!�n)쯜����h��;hf��M��V�A��:`e���`6d�i^R`+�-���)sD���d	g�w���U���0�wV��H\��=��vw����<�����%��%���
Ik��x���
8��!d8�'� 1�H�nxJ�ϑ	ρ�1B��GJ��4��
�h���1������ $2Ǖ@���0<����{@���fc������+B`0�KB{"v��&��%��P����Hn�J63M�_�N{��a�s%�̩V�,�F�[j� ��V*kF�`�~Q�qJ�k��.�&{{�Ǖ�k������P��ɞ���i�Q1L�V,M�=�>�=�;������ڥ�=��ǲ�����1�	�G"韠EIZ�	�:T��D�٥;�?x��~�C�B?BǗ�����J�@�y�Yc*��%[s��X�\�D4��H�C�p��sJL�2�!D�D��{1�bp�,W�����L�}	�t4"-w1�>�8��E�����K�3Sf���eҍ ��&�߻&����q�!��JpB� �Pha�.2��,^��?%\M��t�#µcYW�������������pҗF�����<m?��S/�ǅ�*�����2\�rK�B��Qq���s���@������Cܹmd�i���崖2l�K� ꡃ���2He�y$�K�Z���2�� .�D��,K�%hHث7->$%��Q�,��!��G����!FT]��M���b$�[�0*e�ۧ�H7��g� �*,�w��T6F�@�A��)�s��e��N�4)7�L�T���M2���'��zM�q�b�բiB�]��U]�T�.檚Q��%>��>���	�x�i��♵��b%��C�,$���o��]�=-������ qO��#�+��_�_XMt��L;d�t�I规5�a�$v���OV2(e쎉�ɏ鯟'���b/�����ʉ7�T�O���Jb-�$�C ���r+��68��
T�$���(U��iv!�>�f��mp�噽���v�_�$���b��1��@�]�m�۪)2�/�'��.�P�]������3y�;�?fb!Ac.�QK'2.g.7m������  �:��*�w:�:���Җ���@s9�T�rΤ9Q��Y�)�L�.����k�I��Aɥ�'ϗ�g�ԛ�!�,r'E{t"5���*7DK�u$��,��vV�v�=r�4����9tz��C����9tz���~c����h��_>G���&Hk��&Hk��&Hk��&��5�C�z;�����pz;���������O��mzA�^Ц��mzA�>icoO��T�밽����B^-�u�U��*�T\-�J5��م�i=�9����e�W�R^S�V�����]�tݴ���o�J�����o�QN�ۼ��o��ޓH�'�p=�����g�W�      &   f   x����0�s����8M=;TBn�ÁT�؞��H�XPX[���q�5,՜=d��/~�4"��yT���&��RII�M��_��v`���OZ/D�ft      '   w   x�eϻ1�:���w	�	�{Jq���Q E&rZ�l'�I����l���M��}C%'�9�0=i�Q�|�/�K�Fw�$�O�u�vw,t�.���U����\��w�w�1��;     