PGDMP     0                    {            LangSequenceTraining #   14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)    15.3 #    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    210   p,       $          0    16400    UserSequenceProgress 
   TABLE DATA           �   COPY public."UserSequenceProgress" ("Id", "SequenceId", "UserId", "StartTime", "LastUpdateTime", "Stage", "LastSuccess") FROM stdin;
    public          postgres    false    211   ��       %          0    16404 	   UserState 
   TABLE DATA           >   COPY public."UserState" ("Id", "UserId", "State") FROM stdin;
    public          postgres    false    212   �       &          0    16409    Users 
   TABLE DATA           /   COPY public."Users" ("Id", "Name") FROM stdin;
    public          postgres    false    213   �      '          0    16414    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    214   /      �           2606    16420    SequenceGroup PK_SequenceGroup 
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
       public          postgres    false    213    212    3216            "   �  x���͍�@��N4`d{<�.�[�j)�FG���#�qK.A�F�(z����L�� ���	��ڑ2֌�v|;�ϯǟx�����q~������u�>~���&���`�V@�`q<y`5+�JѣL!SRVEF�� �zv���ت#3�*�r	�$�">,~�j����0d}����>��&�����r�ޡOVȣr.{�v��Q��%E�"�G#43H��T�I�7r)���Q��=��T��h"7Ϫ�}mV�5��R�(sȜ�/-kk����r�A�\�Y�o�٣l![�&�<*�A3��Љ#P�k�C�Y~�s�9��uBm�AV�ؔ�a��wc��<��@�k�1i^҆h�Ҧ���ʎ˹e�����m��.�&�bcq��W�f��=����	�$��$N_>���Ê�      #      x��Y�\�u&���+��R* N"�A~ �	�����-@0�/g��##�10�~"��"ˬ"m����+�Zj_���P0�AF��"�Q�5��q"H\��beL������r%�f�a���v����W�f��t�Z��ݛ�G��p�u����?��,g��˙��z偷\��.?,�7�o��W�������굷��s�z�~��/�Ļş�,o�ފ].g�Ż��ȳ��ßX^�W����e��r_7_^��.����߽_����[,D|����W�x����ď��`)�+��K���į,��މ��V�œ�ay>~��\��|���_}"�����ox�[�__Ï�5\�#�Ǔ�X=����O�?�s�wf��8�qG�����ߋ߄��XމU���5������=Y�㗊�V{����o��݂ǃ7�o���RG�v-ގ/�i܊�[=/ވ��m�^����,��]���|�9��7���?6E�w�%���������~������^��GQ[���s�O��w��_q�Z��(����I��;�u'y������+w(4������k\]�R���R�'2<�qM�ޱ����q�L����H�+gq J%Q�;�99\�-�(�
W�L2 i�û	��}��uU�a̯?G	��C��	p�~F<�� NF�I0�����x�A�ft�;J���V�u�0�,���^�ƒq�V������
W���^�{�[���Wk��\��E+\���c>�@���(�c���e���ed���ցt`�h�}+�H��D��9\�c�紽�7R�r��r����To�
{Nk8ث�ەV9��Q4�z7�����_��Q��.�ۍh��_	��N�*lv�z�[�ðZ�I�A�SnEݽ�w:��c��{�ȲV_د=�DG��.�G��w#eFiz0��`�/��&����wĦ�#�'������za���B�*/�8|�EX��¯@	�����^|V�0M�/��w��C��p��u��r#n�K�7�N���9m����O}���4(}���y�/ş����<Z�{�� �ICެe⅀�;4G�����2w1O�LxÑPP^������PP��Py⊟�o�ݓwQ����+���I?�"��?���2�.��s����;ҭ/i�2����F��1����%�c������{��M���%l-.�ח�,ɜ'a�:k}ǁ��`�''��`r�؄�a����Č��2`��f�4��+=�4��y�y�������Z��F���'�3���nJ��z�ǽqo��E0ꍽ�@�?8������Z84�`��'š�����b��\�k��V�Rg�E�*ۉ1�[�~����N���K��v�w��{n�5]H��N���o���=���K�� n��k%�:��9W2c� �����Ѭ�"
��~\iu�uh�a�.�Vk�~��&.�IT�'�F��wzԋ�<q� �a2�X�"�j���=9����[�W�D�-��q�YJ���)���"����&�;p�"\��aa�A˳B*��kVI�
�B� ��x|���|�k�:,(����p��x���p.>|���wr�I}���.�6Q�''̸wZ�L��^m��3c�������/�4��[���=��+8�H��t]��r:xz���u�n�[�״�� <D�J���c�OcIP��~�6�0�/G��T^Ex�99���u����'�H(|o��z�`p8��,���9
ti�pG�����V��C�o��Q���V�'?gg�bg<�[��b{�k�?�����d2<A�{8
N��^��{����l���I��k�2ޢ��99Kl�ޒ�^�>�����̯�"���?�K�B4�ϔ���+Ln�M�Z�����{�����l��C��Z��^ )M���<ɂ� c�\T�r_��
�7�ΰ� �7�����2�*.Җ�2I�AR�V&��9�R�eE��-E��ḑ�4X7��h' �_�qe�f���[Gw�A3���$�ڵ����vͯ�A䇝(okQ��I���&xb� ��]�XZ�0�赨�Q��{�(ϵ��]�Xf�����J`N���D�)��,6 �#�3����l�'�n����f���ކ�8���##����P�(�/�A�D�`�O�S+W^~򚓠��~a0���֖���?ǓQ�LJ������Ɖp潰?M���t�Y�_H��i��|^�J:�t�TJ��a_�����ˀ<�{�h�f�82�Gx�%���P�����p43<9�dh R����Y���?�N�I���w���k�a���A_
͉ޕ�T�n�� �W;BJ�|q7�~^ҞI�|={#����Q�;M��x��g���N��3����w������)���q�@���D�U���)�"�ރ�m�~H�鸏���������w�=�R�7�a�oᲽ�_��D������G�ߝL߈�����7�W�x���xX����5�v�2�����.�p���V�_oy�Ʀ5�JLo�����j�������q�/�zD�y�Z�bq��2�#�\�j����JY�7�u�Յ�J��_-���N=(w��=tHA'��ve���ᝧ/��[�d��"e�F�^��I�Z���Nl�,"h%������|\[IG�,;40^��k:-h�������e�#x����"�V(�DT�y�/t�R
�R�xR�T ��B���������)>$�y*⼈�_�����G�/�S�✹:(��l� ^��o?��9^�*�^ຝu$�D,d<�6/b��/�~���<
�in�`�0��^�7/�����sa.��u�b@�1z$��u��.l4�u�`r48!̀���f����6���@�\���J\��_~F��#��3�X���RVY�W��	�bY㾥
w�ӕƬ@ɍ�t��-2�E�Sۭ��J��K�`�RP�+Q��s�ffZo��3���T��*�����q��Ǖ�x[��A���F�iT�NT�����N�iO8ʽ	pۺd����Qj?���-��7�\uKs܈(�n�\���T~/̘,7 �̄<�L�^��mϬ�f�����Sݔ�[�����P�>���r�\�3n	^y�+J I�S%���6�ק�(K���&��v����TM��GT��s	�4����Ĳ�ɜ�/d��p��TY���ȼ�4i���\�<Dk�h 65�z*\�8:��~O؏$��-l��/��^2>�]P�m����V�{�3�v��]3pk�*�]1��^�5=��%���?Jb�1��(�����9JN��Bt�E�耊i��S���l� }���b�M	�[*�<YJ��3@5	-�+��"�V�֞_�� m8cOwΟ�=�����	{5BL_3z���/�e�v˵0����&+�}���j�Q���~' F�/l���E�Q� UV�L�[�=��C�r�s�2 oi�@�岪�3,�:�ntk��J:m��	C?��M�5��j���ւ�Jy?I��z���ۍ�$k�D�_�Vj�z9���(*؉��� ����	m@f��X�63l;�(��o��L�+�ݢ�,�R潭r�D������`�6��w�:��
����p�H�k���鏂�w�μǽ838Nƨs~��4�r��e�G_�Xb��n�
2��r^�7o���z\&Q[��n�[iNY1S�sO�M�h�����1X���r�PJ|&Art�	_��"��N�Q�A�%?KFQo��}8���n�G{��r��=Z�o� �b��v�$�d[����} u
�J�'C�t)�������9wr{������"�P�����T�y
����������8�a�����MIc@!B�1Zz�υ}&]�7|C�@�w������R��~r5u��2�N�[�Q���bV ��8�
����,�6�_R��=�dO-�J�y*�����ǲ:+Ѳ�<��߮I^����$2�x����}�U��Z�vܠ�	aq��    ,j�*�I9nE�J�G�vǯ�-h�T�n�Z/��JP-W���䳱w8t-���E%��������\
����\��M�.���k| Ņt����*�yq��`�t���N�����}���,%�`/��-�3�2���}{���D)x������Iw2��y����8�BPyk�=� ��;#.�ݍ�-��i�����^����y��r&q�W������t# �G��9n�ma�oK���^j���4:�\�t��N�P�<��-8	F��G��Budv%`�]�l��d^o������`��;I0�>c���E�������ߋ����x��%ﳔ�7=>�6�;o䝛S��oQ�?�ruO��{�nKn1$�������#n0x�	���@м&^����A"A�u���+ϴ�s�7�Ո��V�Ԁ�'��s�6��ح�m��w*�$��~���z�S��J=���Z��mG����;=:��d����+�-�z�5PY3��]ÿrY���u��,%��T�
�l�%L$f~�e�p���r���AWō^����m�	w���D��7(7��� �a�u�?�7#�pcU?V��}�P�;���p{!�i|В?����Y��d��f:9KuE�E�+L
�����2�B�K�#{��䱾 �z�y�I��U����C�����S��o�o��3�3\�8[���a�O��Z��+����$Qe��*�K�!��G�0N�������LԦ�.�w,k��k�r+.'_h�H��zK��nï�q=iw��F%���]����I
�g��Ys�jw�o>���gx��kwNm��� K��q��+�n��Ҍ� �U����W�����[����+A2��q�[�MU��[*�uŐ<'c���C�<>�FAo@�h8����ǐ*��~?��z�=z�PJF���6dv���ڀRA��K`*���K��m�V���b/MA:7~EV��BH�A�����a�!�Yp�ٿ������P�&�<�'|A` *P|+~�=f�����3|���!~KN�WRy�]��\����Z1$�c08�N��I?�LB�D�c�F( �7��Y��r�Bw�(F��q/�]������ 4�L�I4��g�ryKՈ�B�;b&�#7w�?�S;�-2}�����
���z*��Ut��7>ن�OJ��=�����}�Zc�)_�7��%,��P�{a+i�[��_/c!%h��Z��Wä[mV�Iv���N؉�v��[�Dحr�w�q�0��4��f3�3o,$���A8���\���e7�c��fq�E��TRb���fV��Ι�N$��{�XR$y��v��Grqw�S�9�Dc�������<JL|~ȈJ�@C��^�vVy�	8@H?eғ��$�^"���#D� >����Oaů��:SU���}�u5Bvo�uf��^�N�^j<��]L9�%W�t��lS��ץ,�K+�6�Pǯ�(j�y�b���g����"�d4�!/!�1JN&��@Z���X�(.AKX�	��P��K�L��c�j��xX>�G R&1���$�����bx���5@�*�k�s�d�`�9�{]a��q�����1�Ik���h!��폰�'���MG#���&� �	���0���@���z�4���Sv[MI$��(��A&���h�CTdg��e���A�"&�G�"B==	G�/�������[/mELBG�KZ�Z�bw��a	o15��L�#n��'%�{�1Jy��`b���m) >9�#h�-w=1ur&\�T�jt�ٻ"�aԯJ��\Y�;};�2ngA���_�V+Iԩ�a3�z)�j9�Y	��VTk%{(��:�X��$yi|��Y���ӥQ<���*�ˬe蠥����_e6�u��!`;f�]E��M���;5���<r�@j��S�V|���]�v�(�Rm��r�7� ����m�*�R0q�K<٫��z'P3�/`����C�9F"��oF��\9O��!s��i<�0��;��2�~:�?�v�v�wZ�����9F�O-�7~#�fو�=�#����5���:��V]�Ky�*�۝���}َ.�kL��Գ�lr���	eiM�~��j���@X6Al�[�Y���(
�ZLq*>�0��8D�-3��%�X���߈�v��l��U���v�R��n9l�ʑP��^���p�Al�t���|��S��3�K%���\k /Y�Y���ݹ� ^��
�嶕�ݦ��b��xzBẘΜFX^!o�wd��2:�p���9�ҵ������en��̘%�:��dşł�^�	d^?��n�ʢ��T}2�n�$j��1��pr��tc�L��������*���**x]q�i����!RMe�XJ,�)w��E!I�����6
7FD8�W���Ȉə�#7�3��������P�"���;��"t����!f�l����<W�?G��^r ��t��Q�g��I����(	F�����P��KKt�'����N�7	��F����р��iF�*�*?q�]yM��\�,XK�!˽:��:�S݂*���ڛŮ�d|қ$(P�#@����ȥQ�R�P�Jo��p
('�!�3�=�[
���6\��V�qPe���g����Sjjn4}@�ߗ��;����^Čе|�os�&��ri��X*�C|�~'Ų?3$��m_I���,�����"��˱���Ҝ�x�H�I��aب���؏�QG�$q跻��߮&Q#��ͨ]����$��0_�v�A��h��4�0H%���9��e��!����� \�7�Y�a��ا�X*��a��в�>�wl�b� �e���h�]\�RϮ���y���V*�脓3o�bB;uL �V���HY¹�ފ�.0���Y>�����K��f;��ٳa~�x�`� ����8+�]`0<��3����A��lx��_xM=U�S����\����x_u:���\�U�=p�7N���N ����٢~I�#�+KD5���A��a�z*��>٭Po�ڻ���˥��`K��lWu5J4]x��G��5��k�6��--�ƫ��h��8nv�z���zҩ�a��v'�$A�4:�=��q�mȦ���=���I(Tw������$�7�_H*|�f5 n�p�l1�o��8��w֮��2���Y�ެ��^A�v�g�'I%�<���ϒ�����rZi�r�Fژ��k��o�6����z�d��'�sY{b>;�H*����V��^S���Fd�T��(!~��w�nP$T��Ë�d�?�\����o�n/��m�1s�u�?�;>,b�6Y��*��L9C�j|��4�ܯ�J�m>�c�p^�Q����C�qx��>4��9W���l�O�.ϕ��S`���Z��B�L։�l�O�1^R���=�����q��,�{'��O�h���~�)����5�,��$>(p�9�b`����]8���+��y	��c��w-��Vޔ���Gv�t*�l��������#��g��.&:�g�P���_�&�zԎ��U�k�������8�*]�%a���c���z�˨�f3�	ou��+���nzSg�_�/��+�Š��]8|�˹��t���5�_��a��p3�叓�����YA��m��`�$�x��|A��*�hH���8_��"��v�i�)3�� ����o�8S/��`�υ�V
���i-b
@���K�;��7>hY�ܖ�/8�o%��`��By��M�~ ^����K��p<�-�DH���<N:0�G"�/��@�;�p���=W�Y՘�~Y�����
��M/�
��{��3�7\%}�6'�4�[v@�0�Z2��kB����(����a2.Q��W�vQD��?U�����R՝�Iw��1��A�>Э��'s��nid�Y��S�-��4����p�ƿZ�R��B���WT9����<�{C5?JD]��b282s�K1_�Q7���7�[*l3��qD���i��VmE3�)h�)d3���f�R	*�_��a3���n4�~ܭvʭZX����ހG�8-���w�h�    JV@����3b�/�~����H�)�:6ک��V��d�6[AD�6�=c��`L���B"��9��V�l��}c]�X-Y}�W8c�#_���o���X5����QBD/�D8���p:*y��Pl�@2�2'׿�;O;5����&r���p�ֆgqK�C��W�Wy���
�d����g�]�E�m{��m�sf���ܐ�WӔ��g>��*�|,�݀f���ظa��=���H���a�i�����)��KX(��RD`�px�GV�(<u&�I�
��{B��r
�L6�s�,-ͥNJ9�vn�����;Z���<��o"B?*6�A?�)}
���t0�FI2p��=X��Ӽ�(�N=s`���L�j��V�4��v�A��o�vBC�A)�Z�L���zYS��\���A�yd�-g�o���j>�Y	\cX�Ҙ҇ۄkmV�y�nȕ�b]��?u����~�݈��V�oV*M�U+~v�ܩ4����ke
%{�I2BR	��t4i��;�6�#�K��|�T=�1\QEP7Tv�b{���ǅ�!1�:
��]MOQ @�̕����\q ̝�%�-�;o������@�#F�$!��q4ϙ	t���Z���\sm^�LU ӷ�[�<��峃앩�?%��h�ꨋ��5$Vtu�T��<E��.e�f
x�0d�=�ڱ;� q��0
�s���X݀]��E�ƿn�h���j5X��.5�=W��&��XD��H�}s��
��pI8 �N���xP���ґ*�_���G�_�*���f�=�9�l��Fw+��q7��{��3���q���;�����\0!�A��j��)�v����Bk��Xs��t�J-�kA���J;�à\�]%��q�)W�=d΍ ��1�/l�1�I��P��1��,������K[;r�ʤ�1�ti���}����)�aJB�N4~w˙]vy��h��4��I���$:�a�ś`�Y�z�Z�H���5�m���������{�g޸=�it��x(b�����S�}H�c�._"Թ�������q��*��ԥ���_�F���G}�A��{�8�:0�x���F�^�?�^U�pd��:�&< �^�ڎ�λ�~e���s��*�ہs��R�:��3�I��r�P�j�uck�D�'�q&���Q2�M(�9Ʈ��|Oe>
�o=�c�TD>ZlZM@ݓ7Z�Kf^n�"���Š=���|� &r
!j�љ,�h�诌�-�������a�[���h�v~b�D[���ŗL=����UQT�Z��ʌ�܂lZ��X�o��N��v���Q���
:~9���N��@N7���p�^܅�(E"��4hR���K��dnQ��iiz��aŊ�agk2�KnC/� ��%����#7`����0��1RI��9b1�z��;zO���6x��C�3qo0�����s%Ah־��
��&jr�EK���f��ҽ�����	M���8���9��H�z�u&t�ao�1�'u�f �I���x�~o����I2C��٫��{�Ag�d�"���*"(=-��ϕ�A���<)��$k��gt��b�2��Q�J:���0��=�,7Q�Q˗���F9�PmL�;=��Ϣ�f�b#�P&�hp2����AǱ��§y��[��kE`���1���@�s�E�l�J�ryQj�]��5z����L]_q�vɞ@�ݒ.�x��dԋ&%/�N�sL�A�FXO��N�gx&0-;� c=.=���t!n�6���V�v#�,]�54�A�QLK�IW�v�=G��fO�_cCv�d���*;��UK�V����ʢ�P򕓆Β]�q�!�#}P2&8S�PG|j/�g+Y�=��G�v��B_�!�}�D8*I��7a�[�T�I��''u{B=���˻ �r���?R;�&�͹�U�%q�$�����#�֔�]����}��$��)uZ���<�L�AO���eh�ǽqi��Bh�q��~b"�k��߱��.s1+����V͹&����ꆨ_�U�ij}%ǐ���=�V�+�d�J�W)����gI���f�o�<�ň9�������)AU%>e/:
�O���N���9�ox �fQm�l��h��Px기�"�k&�Q��_d|?5d��dj��[�[���YHVbx��V��z�@�X���.dp�o�0�mu�V�T�͸��J��[���J�/Wè���F���	i$�Jl\��ʧ��X]eT�$
�,�ʼ��_S$�k����5Sl��+�?��c��_�Z���XY;�7K�x�5�@�,<k=��u��軌�Eݬ�^�>p?� :��"�����þ� ��/9胩Ȓn��k���R�Q�}a�#j��60��`n}�ʠcG�K��*��A����r}�����5`����x(��dxӣ$��a2���W^��"w�	m޳3K�և�3뀗�S�O�m��rEu¿�쭅~��P�}��\�iǍM��MNPZ��9&k���0N�o�#%�8�+xΘm�>R����.�3��v��Ywr���a)��v�����x�	%��p���$��P�F��R\4��
/��,�T>�m��	��6��g-A<�F�����!֩FF�/���[���{�vZ'g20{�� n�r&��`�]������e�n!�?�nN*g ķ��� h�������T�K:tP܇�G�s̗�9U��.��=�r[���A�#��jT��z3i�a�Z��ͨ6��Yo�Q��z�7ˍ�_;�x[��7�j3�hU���,�9�%��n\�u�T1I
�����4 ��#��10Āfg�A�p����k��rԍ�`��k��YOyO*__c�@��j�<�rB	?(]y!0:G#n�OWr�aݜj�Vys⿟���wC(��%�P�zu�[{L���*Ȫ�X���}E?�7��(�T��ӛ0L����!$��}g<�}xY�&J$�N]0�<n���dp���lY�꺦H#�6�0�-꾲&]��޼�d�
#�GY33�Ygl�B��<�mo�EU^<��t��������2@]r�gM���J�`	�|D
//Ql�I�����W��UU/5��K̻�z,�0M?߆�7LK��))j���+p���\�S��}1
Z��~��֣���a����5�Z�o����f�ӄ���W���R�Lk&�C�F�{���^�S��t�%Q,_g���>�2Y;5�Hr������+�d���|n�,Ŧ�q/��O&tDdG=�Ш.d#E�!e)UA��m�G0�B���S\�H)R;ɨ�:�J�3Y��;3O�f��exn�$���	������6���*�����u(%9�������iK�.W��m~~k���вJ� �a0NbY�?M�	��C��I)s���01#�/5<���\`���ĵ��B�n�#;L�1gy�^��� elO����H�^�"*|��	L�}{El����xh�OI�1M���^8�%]���ﯦ`�ew�4⿳��!O#N�I��T5�m�_d��� 4�Μ���m����M�!M噑�He�Yu�n��3D���Gط��=u�֛��U��Q��8ȵUr�`��ø�ܢ:2��W�^>1{A�^ۯ�������2$�땸췃Fˏ�I�5a��H��8�'��[��}�@���ĕ�|��'����->1z�,$�;�Ǩ�T�F���$���y��zÏb�ާ0�m� �N!�i=�t�ۏ�q@7ގ��d���Te������W]S�9������T�M�q�|ɮ@���6���� ���u�}yL�9ـ����J���m|�Ê��1U����}a��	Q8�z�۔E���v�uHyN��yd��lΣ�{/�z�S��*��hӌďa�4��X�'L�2�`��i2F�Y�sU��O& ���S��#����$M�+�W�sO�����d:���9�<c��-NRvTÖ�ZIPF�$I�D�oLK���'m��˰ ��ՆM�`�2:lV+n��)MRH7����0KT!�]�o���n'H�N;I�z�^�;q���n�t�    ���D�
�&5��ym��ܵ�����*}�l��%Xl�9
�΃dc�>]�܁] =�.�H3�Tܟ�?��<��C>�����쎺v�PM�>=J��p"g�qWނ05$��[k7n�/ M�|��	�3{�f�~�@Y"`�Bp��`ҳD1��$e��^j6��R�ު0<MO&љ�Z���,�|���&�L������.�.�<	+�^��5�́"���Sۜ0�i�*B�HE�3%Q4yD�� 9�2B�)��u�DZI��3$DT��ڪ��o)�p¯�v�?L�z�SHv@g��A��� �tw8��X$W���G�P��"-f�\��Jj��B,,^+Y_�<�����7��f��K���E�������aIS���\��@���E�U��/�z䴃��;t�I��`�O�{W�n�7�k�F��5�Q�6�z�S�ۍ��WQ�픛�N3��\�Oܺ���n�WO���3x��ejPof��V���}z�{����,��ֲ�o/g#2oKҡ|!]����|c�yz�Ӟ�ݢ�4�\m�D\�RcI3L�`-��¼Ni�-���_v��>*�}�U�7C<��N����}���݅%�ea�~6��^P�ď�E��CZ�a��_9f�E���"����O'�����G����V�3 ��I��&[+Ι�>�tZ�Ȼ���:���Z`:��gc�hk�9b�r�Ve�&"O�yp��T����h��:r��de^�r�H��Tm�8��L�-�5��-bvņ'*kx�S#��%m���1˝(c�b�qV����2ǘ)�F#*�
	/����U����Um��F7�M?��Z��e?hH>���JЮ�;Ę%ki�,��:�Z ü�撌����D�r"���+9���D:�V������� Qt�V	�e��aā�0������n�7�;�� M:����ױ�uUe"�;2�np��9VĎ��qx�,;��ڎȔ�x��a��Mv��˟��:#(�[�d���.���~���òf�0k�R�F�
�jX�n��T,���Z�������#)geC���1�((�T��*v���Gc��{��<�9#9Y�7����Z72�dPl4/�����M�<������T�6�[F�F~�=?D���Pϋx�c�4�S�z��L�VR��+��wR�מ76���y4��TK_k;���Q��L����̘%cW����2�Ss�*d$�]���oque_���r����Z�%lZ�!L#�k�f�Zo�[�hO��8I�I��q��+���@OM9ʥO��&��S)��Ͳ�~ْ�zO����7��@�j�2&%���{l9�Sv���mi�ݨ%�	�����w�,�y\�I����|g� W	�H���4�ۖ!�5��٬,��A1z�R���YI7�<WyA4�oR.��I����chq�!��S`T֍�1J�)���lL�8`G"zT���{#s�D#��V���CgJM�1�ߥ�S���O(̸�uS��Z����Q��`&�G(y㡳Cc|�(�Iv�eN�t�~�9�'d���<)��ye)�x��=䚇T�Bv?��!'x8q�����(�VC5�E*��.��r�~���N��pM�^,�&9zG��e+G�*�S7Ǭ��!�ݚ�JEX-e_,�]i_����liR�����1��.9�^E�ou�t����I�aS�QG���g7n��jS
D`1<�z�\��̯��;X�9���$�53��g�4�z]C��d�\7�b? e͍N>f���2dn2�n�k���o�^��;�xS&�1���c����%��S>��Ce�%��-�s(�NYx�=H�o�TKV0�C�����$��Q�x�������c<�|ce��H��B�g1�1�L)���0�)y={���v��	&l{c�,���J��-�J�n;��.�4`w��'8�u��*�L΋��,`tJɬ+�Θ�I������]�A����8�>�e�t�`FLg��Wnm\_"]Y�����˥�G��%ώ�ʝ��:;'������$m��`Ƌ�:X�����HwL�$��[�2]S=�0��ϐ������� �y��iw��[��V�i��N�a\m����.Wk�n��U�����z���vǯ�������aFn�)^�7����Ac�mI�>�!-r��,�&��q��9U� �[0���T�+������tmvʔ�5�фf�·�YR�;�Z�dM�v�KYI������춄�͵+v���� ����`|J�f�H�����w`~p�](L�t|��6���Q�VA&Ԯ��d�>�tR[~���T^Jt[�sL�L�΀ƿ[2�h�|lL���y�03���_f��?ɟ�޻��T�)��RކG1#���nI���5��LWsd�)&�Dn?���t��.?��.�Sx��ю�����8g�$�2l(A�\nD�%a�Q������r�^�u�J����j�%��n��r��Aǝ�^�p���)b���`�����3e�m��V�0�Fq�J����������H�4����$�9ub��� ������� ��x�t�A=����H���yp?��w�݆�Aľ��.D�v%9�B�at2�Vv�
_�*�l:>�q?�S�>1x�"���+?���s
���y�8�p,�\������.��Sn����up #��4���@����=n��)hW�`��^!�@��P��2�+�FI?�Y�?"��w�4��}&4�;>#�@Q�X��5��[=��>d����F�y�W������P3cOX��0�W����q�t��<O����a�������;M�ʲ�}6S~�8�1y�)Rpqz���<Sp�L�Vd6��S�����a~̤q�w��,d�k��j�S�녰�~�V+��J9�P���n���N��Q�X6���,�y�M��M��Y�r�Od`v�%;$�c����#��Մ%c9
_V�)��9��F%�w�7�,LC��=ϖ�;q��Mb���}2�Ӕ6����$x��q�P����`;�L\���� d��R���擜�	�qh
���
�\>���綨-���e���.` ��O{�T>�4s�� �j#�7VNG�Ϩ�T�*�^�ѧF�A�/b ~{��;_�zLM��jO��J�@�oa����}��{k}��=�f�m�}o�<t��p�����$a��V�A<��a������w�Q��[A���ä�wZ�į��v���J'�c1�M��ep^+<�.�T,6�.���i(sK�&�Ii�ip F��qt�x@���r;�B�ӧ��_}��Ze��0��/��Z�<OC��ے�R���R�Y��l�F@ǜ{�>'��	ݗ��Ե�E;?�����j���S7�-���ʟ�SC� ���p��1�=p�Z�e{��	��;l���7��cڿ���1����9�sB�x�SdV���|$�7RYo�J�]-@z�V gj+�8���>��j�)��>a�SKߦ�@��iۮ�0�no��@��c�ܨ��˵r�ޭD~��h��f��w�aݯT��NЈ�� ���F���9����kL��.���v��+��gN���/)�f%@<ՆE�S#�jKrj*¾��i����:�J�lF�y�rw��A�54��^�����$���Z�'�t$�q�9����k5���\�wO{G�j\{~Fw:�W<��J�O9��I�
4����0�*ݩ�:o3��I��hDoM8=�&��Q2ѓY@�'��}���*�@�W��K^���p�?ў@��[\��f�\:�7��yO�h�ch�GB������O�� ����Q;~ r��� :{�5V�	���$�(�D��\�����2j7rD�n("�,��nyn��$� �j�4�;O�fp�e�G�6Γ��?�֬6��j��W�"�7�U?�u�~�m��I+�U+����$NZM?i4�~��ԁO����J�^�5;�0�,�#�g���|��[�)��*V�F�ۀ���� ��A[+����m��q��n�ui�9J� �u|�^���d�W��*��b�A�.�������    ��I�P���bơ?�H,g�U����5��"�v�eO:�8R2����JN
j���������]����(�&�Q��:�3U2j�|�i���*��t7�c���Jk.$�w�҈̈́�Ǯh�D�e�P���b���6���RE2
'�X��t��l���0K])`~���=�U�[��g0�Y �-��*o�U�JXe��6֯������2��ʮ�e�\E�aT�3xL�� W��j<8�@�Hi�<��,���M!�Sݯ��F���ZS�\��ƍ�uʝ�u���������qഹ_����#��)�&����T?:�8]7�����ƅBt������~��pM�y�p� �����=oa"~�B�	�Y��R�
�5�Jɜ��5Z��袼��������-
L����jy7�u���q��}6��K�܎�	�v��_�y-u�wx�!��J�X���pO'����p*1@���>N�}���$6�f9�d�Ⱦ7�,	h��������l/�q
z'���H�w�$�.e���* +�%/�զ��%��ʼ��#�A>�"���w0Ѭ`7ۑ%�'�	`4z#(h%��r�`Bk�˄b;zǥ�[��m�9X��7\�|���,i�1F���KE� �����ўoM��������	��9R�Põ��fS�/����;O�l��/f�j�q��j��_�V��a�FX�;�JPkգZ7��z�F�r��_w6V9d�Fx#��������</ct�1����V������L&u:�{X�F�����R3��~���3���݈�����iA�k��B��=��
�<�8xb��.��PYl���������7��^�oc��{Lk@���7����H���| �fc@s�}:zG=DH����t l�`�4W�D̘\��;@�-�O��M�KU�����8ү�PM�8y��c�N*��s���8�	_Pt����F�-j��7�hI�":'7���.�D���Nbo݅�y��O���0וA���SSB�خ�4(�r�ԗ�Nf��9�����l\:��Q�)�����﷓zҬ$��l�ਜ~�����n�^�G!�!Sq�p8q����O�1\�`��ޑm��Vrc4�B��f��@kL���f"��GD�r��A�<�
����F�#� 8�6{���㒶0�}�_g*+
�'����:���*?��%༔Q�f�9��e�ے��ّ�	}�i����e)|;=ݡ0�@U0co���x8������s�wonc��o�B��'Y�ιH~��-�1+��|�Wx�N�l�bV �o 3��2�F�L��8$'���נ���~�s[9�s���0�����)~�g�MT0�$��YU����XM_NA�R����JH���\Y�<	F��ܑ�T�Z�#�g*GzωQ����.�8T�Va(���b��.Z��OB�W��� �\Af3�u#�Ҽ�
}���'����������!�i'�M�g�A����Y��~=���J��'q���[���i�b?
k�r�jqT��"���3��ϟ�;���k<Q�s+�˔��l���Mj:4U��^��h
k崴�%k��g�.e3���f�/��J��3�8}4��dk�U��,M7#���"7��nCSL>�L�2���n��ÎT��&�2�`[��x����Fb�����#�&Pl^0J����2�u`Fc��*l![֖-�K�ͯ�o�@���ns�l��X����`���H��w�N�B���pA�^�.ϥB^�s��L��ї8>N�`��ǂބ��z��965�c%�����Xr7�y[Ic^]��l��C�+�L ��=������eУ�N�,@,�#8�~�s��&0B��0Qq��j��@n��3����Lf�n`G:�]�o4.�Ak	�u�?���o�Vs�&gi�>x�GS,�8��}�9r։��<�w1���.~R�L
7�wj��VJ[�T�ŌpS�Z#�]?� o��A3���N�R��N��e#<Z+�ß�I��qH��,�A��Qq'�ހ�A<�b�\z�	,�i���ba��|F3:�3]�3�(�Ld�6�YXE�:��H�������x{*��{�#l�A^�%�����������0���z�o7%��D�5^iV�q� @
B��nU~�8(փ��P���y����5� �՝,/( �rF�����_�Gľ��E���&��)�'+ɽ�[�F��v�iq�}�]�=��� ��S.sI��`���O�~_�e��=ÛA�����җҍe�H�m��� &|��i�$�Ur�
Yӂ��#�ػ?��$DGuN��:xT��1��a4�blXB�Z�M��ş�j*�e�k&à*6K��l��.�t$/�sO��6:������J�V*�kr�P�n`����ۘ�u"�Ԥ�>S���	��p�!/��eK��CA3��o�ʭz���!b� �vح���z9h�q�R�}jǽA�գ�4s}�{G�s{vd��[��je��H����`�D]�M�K'Y�%ɟ*h��) ��+��Z�%�G�ϵC�`��������C.��l�.�D�KY�j����-\�o29��b�R������yU�dE��U
}c
M*�g�S$d�۝#�ʪ|�U���!{���P�c��o8�cR�!�^�V�0�mN=�r�0m�����X��(Vv��I�TI���='�/���Π֍.�#V =I�G0�>���Z.!�f��@�b��/8��F����%2��_˷I�Ls�;�$��D�N͐㟱�Fw��Ll\1k�q�7]kO�.�ʍS�$�`���}����}����>�PR���XH�ɰߛ$�3����y��d�TA��Qȩ������.������=�����V�7��S!/`�-����Ҽ��FA٫��,լP,jN��aC�ZiK (��:k�a��|(��s�B�޳��v�o�0����En���L'��ے�5�f�Ŋ�zT�@a���%���-S�C*pG5Y�[i��*ըZn~9�$�[��� .W�Z��)7*���x�!0&�'�ݑP�)�s�RWr�����9��63Z��y��8���ҹ��>#���q%��|+�Ɉ���d��L����P��^=��ɏ�F�?����\��</1d�c�D1���Џ��Ta܋�M�p�d�������p����SǨ�5���tQas�=����aV�Ez�r��LGY2����6�ٷ �@��0C�[�, ��8L�G��g^ߍ[I��¼R��yGi�c�	J��r� \m���&HTǗ�(^�т�_7��qzd� �G*�@���䧧�g#�-�x����ŽQa�?��;����V3��/)9u�f�>R���j�x����%_�҄��xy2�#>��ȶ"TD}lɯY��&f�ɓ�ݗ�\��&y�&�=a>�-��������FN2�9��a���e4�V�q,��_�L\ʒܔZZm�zK�9��n�Ѭ�?���ެ��v'i��Z�t;A��=&���Z���f���
U�׵ux���"��E��e͟| M��b�U_�)��e�-��ht��y0��S��ã��'W�C����X��ízc���M�bϖbd�[r�2A�Է |��-�<*u�%0Y��͒��Jw펴��E�:�<Y�Ѧ�����`<?�FÊ�RGz�F ��� ��D�XI�a���Y4�˻���F���S�n�m���~J�	��)7�s�2S�(�`��A�"+�=�S��q��qb,�Cڃ��G�\<�]w�FC^�m��F��;�Ev�m>|@C���f�{�X� 8�~��	U珆�1֤�&�v?N���#-����O�#�7=�ꜣ�km�/�lN��oJܞd�T�)��)��[#�g��n셣����RCF���P�q�a���Zz��-�j���;yāv J֡�A�9��鈫W�@���L{Q�T�s��R��J��̩��[�q�27tn(B���;�)�,���vQZ    �� �&,s�^�D���l5C�^��~�[1x;
��(h�;��~R�����'5?l�u��jW��v%!;�I>%	������N�.���S���%�ɟ�g� �L��RN�Xe�ۻd�_�{���;ϴʝ�u���c��D�-���p�����p`��ֆ�����(Af���ϙ�����9�V�m|�5�o�e�{?fT�-��,.��ł���M�$�5`�r�1��AQ�wL/:
�XY�q2�	 �c<MT;���;f"ϩ.�x�']_�dݲ�)�n�{�A���}����:i���/�f��3t��E��
g��Z���m�RcK�k��2[ӈqEc:&�F<�F�d�D�$�#��Q���1fD�R�����]�-f��J�|�����$g�w����t�' Gι0�s���$�L��2K6�E���r�Y�;�ڡ;�.t�g��↵Q@��;�r���u�,�d:���z �bfB����e��t�M9	T�$��7Ti5�lr��Kկ�;�:k��-1�Q����w���{�?�nŽu�J �Pl�fy�ڎ��v=�]�D�Jⷫ��W�n%	��f��LD�}��P"�D._,L�b�BR�@�Q&���ݶ�+�1�LN*cƴ�%� m��WZ�}Gڢ�f�q�r��.}���-�cW�֬̅�晞3d��m"�M�g���r�ޠ>=\����,��rH�?�AQbppp`,���BgC�� ���ޠH��#���v&Be&Y!�7�*����&Rn�I��8��oqƲ���|T���EM�XFii��MB�0L�Ke8?
�j�җ�<s��љQB�{�n2<�x����ft�����h���p��m�Y	�u;EdU�����qZP�d�=5�zЋ��:�ǑM �O�ݒ�o�7��Ag8Fc�S\�U/xߠo��)�ώ�p�e�Z����q�����Q
T��j!h�8�DjA��K�W��*Owj�;u��d��A�ghK��M�_������GRj�L�4K�m(�����JV��o7ہ_�G5_���ԃNخ���nS6r^7I��i���"�]�}�t9�<4fa�L��Ƭ�*�S`����sc���ߗ\���T\xa �/:9NǤ�w�A��q�Wi�-a��OH��fl���}���� R�_����02{�4BlM�|@St�ۛs��gy{�ڑ�b�-���^8�n������&��9hK��������+�w�~���]�]
߅�g&�J<�q�cB$�Yp|�e��G��?%'�P�Bg���`JH3�ف�Ym�2�,�Qn��B��z��BFB�M�-���g?��	3�%������,��9c5�/�>
�5`,�������K���!�~�G�H�
�Po�>�Ŭ��~���E��7��82FZ�j�!����H�"��|�|>'�r�g6c��-��~�5�0��.Y�`�����^i�e_g�mq'��n��a�VK� �ۍ��L��SVJ�� �b�\�!7��H�\�3�8{K�F���4Y�ݎ#$7 ���I1���ٌH`^��HiXD��_ou̬4�K5s�J��4����w���/�U��2�� 		
��8e�33���?T'["��y$hk=>�%gc
d���x|))��&ʸ0�Z��J��dil�Jy�Ή��`p�1�C�;&�N��Sb��$g3���T�;�s��HX�Z����LA+�&�x����Oħ�	��Ċ�Kp�D�X8�􅰰*䡭������FW������_s����=����!�u0�^oM����X�cIv刚�
��x�����5�Q�1�w�<���<̈́&�����$$<�ﷲGS����V+"�&�����.�/ٷ�J������/V��J���,�A��F#
�vՏۀ�I��ߩ���_�t˭n�ӎ��	����)�_*�,�I��%�U��J�W3�I��]e�uj�ұv)ҵ�[)�\��s��Su�li��wf
!�{�yf{KG\�	�a௪����G�T*cq�n@;z�*��r�Hn`��Z�X���>�g|�ω;8���\%]����7�2Q%���8;� "���~���tQF����М''}!]�w��Q���#�o�B9�x��P;���3�}���4���;�H�S��OCG��x��*���J��ZO�H@ɽ��r��*s]_x�ȏ�����#�29�>��\�;��e��P��P��6A��av5�� @�)�99%� �*�j�t����4us?
�Fخ���%�V~�
b�v9Hj���i�uG�c��!좣�S�(���i��iҹ�o���3K͒Q^�V�$��DC Q	��] �?\�e��O�g��B��&V�P��s�\�r�J{|
���O�3t�MA����?��m��P��{�|.O�岤�}5
�)O� ��"�&�@�ɸ�:z/%����@�F�����9���<�\�^.yn>Fƶ�qOx�chK����5��ޓ���`2:�t<>�/��W%ѻ%�|mcK����)�&��R��!�E��g9qH�G҆��d�1�ȀR���ꆘ��q��r�M�����iwfB^:�}��.������=����vC�-�74`�Ӵ��1tx�&�B����ңe�hirB%����~z��'���׻a�o'�޸����Z���^ϛ�������+�L���f(n�(P�WRR�x(����Ӌ%I��*��h��,��� NeNѢ)d�5 ��ٹ�T�:�(+@�� #3����z!��Q��Z� |�2�~�l�sf�c�ճQ�N��羣�Y�.դ{�V.��l>���D%��>F@�JN��~4)<�0�B��gñ���a�O�l|�E����������["��@�G����?�����˿�D4"8����Xʅ�f*z� ��p"-%YSL[O�gUڑR��X&��UXf��oMƝtȼ�^��Ȧ�g>�]���a /''�L����ã�^?ֻ?���3�N0���L$)��ռ��/����(�IARU�g=���Ʒ)�B��qh��� ��f��i�GG�<y��xg"��ܗu4&��T\�f��rH�Ԅ%��T��raR%�NS7~oՂ|����#�g�u����c�$�'Kj6�r0x��2���':����F�[���U�T��*��߁�*i�*�V�uZ�=y%��&eN���}�[�Oc��kl��QbTK�)�q���3ˉ�$����**-n��&����w�^I�G)�&���}1-J��d���V�_9�RE�ə�=.R q��z��Cf�l�q$T.̅��_��_H�ĕ*ap�h���͎���Ꮢ�	w�0]���2wAexi��}<M�U2�bb��y�J���g9|�V��o�?�vS�i�a��06����f3���#wڙ����났eax��z=k5|������\hy���"�p6�_cɼ�tܺ�\qf1�ع�J�T4Vx�b�Y�m��;��N;�ջ�_��Ua���֛u?��Z�j�Yn�=!E�f���Ƹ�z��=��������_3�էL	�����5%/�i��	�'����G [�-zH��T��ؙ����������c����<:��X�O�g��1��=�!��p�I,ꬕAaM'	����UR�����'���)�M'��!�3kTq�!�~�J���9���*�S�LM��YXG,&� mʉ�ѥ0o紾��{��̸�&`��ƌ*��%L�y�(|c^+U ���]�⼝�E��m�m�?� P�>	&�D<,b�Ķ���s/��'^4Oģ��@���%k#���{�`�4Vrz��[�T`G���,5���Уa�(A/"G�I��I0�AMi<�MΌ��|&�� ��'&�s!�S�s�����������s�(�7Im�N��SJ��T@��	6�-�<����nV@��Ŀ��B-B�_�$#�Qp��@bz��S�8��K0�+ؼ�PkL�ő�����eJ,�.�͔���_�a�$�ּ�䒉����A����^�    O��/z��IC� ���佚�ٯ��Z�T�<�[|b���ɰ�^�T=��9�l{�zB�����tK�罧h^�Z/��%ֵ������-�}�G3��l�v�,L�$y��h�T1����`pT*T7�c<��%Q1� )V\�&�a�1�|���^1w�x��ֶ:'=��V�=���K�N4�S�4�}٫���f�S�k�fp�����[a�R+�j��^e?�U�z���zM���f�+M�&q�Z�N����C�-���n���r>)Gu��ī3���j���<�<=V/�+#7��sW���쐃���R�١Nz�ׁ���>�2�ڐ�Cy�
t��"���~�$������½��S���9�y`�5��b���X�-0��.5���J&t�!5Kxj2���D#FW.��U<�[V��g�/A��
�:�Ν�w(<�䊗i�,ڳ�9.jFi>�rT���������Ƈ�0����+9؜����~��;��-�Wh���H��ەBw?c+�l��2����u�ڐ%�iV��5=q���_a�7˔;f�=�4$�[�S���%%�J���ܶ5��%^�k�b���_ãUK||��G�Ff(#V�S2�����&�e�<��v5juە�߉_���~�U���Z�4+ՠ^�C��׵����9�=|9v�v���ݬT�r�|��B_��4���m �o��dƶَ u���RS$�1O`���˴1�*He;�!�9��1�����{z
$�6����2�ʲ�L� ʯ@�Ȍ���'�q>�+�@���������.��3l�P�,n�`N����CK��4�Θ����HSh��j5X[恕��ArƘ�I�̵R' ���t�;e'L_ͬ��2�[� ��SL��-�E�Y^ɳ$�)^J:��\����3J�"����Q�N��A�tgx�'�y1��k���0h��)�qO%g�N���Ck�ɇ�Ӽn�M>����&�����H� ɔ��"7'�M�Ǵ���e��A"� @���;$/��c�|�:�i�h�����Ph>:�Kn}�k#�����ޠ5���[�m���9�
���A��1���A�Z�o5�A�4�J�,��Z��F���AP��aP	Z{�O�i�@Q��߫��Y�,�⏚�J1���S���n��YR��Kx�u�>�z,|p�����R��� �9�Mb�B��3(�,C���s�nUo�=��C%,d���G�����i��{4��cP\`�����px��8�C��T������G_��C\��Ǿ?��ꃼ	�^Ⱦ����&���������- �:�<ˠV�2kIEb/������S�
���v�4��vצt�ڟH�	Њ�.�a�~�_����D.G�`}_ט%-����!\I�S���<�^�� �M� <�卽ht�,�c��$F�����ٜ�W��h�#>�k��\�� ��7�@y>(������6ژb����vUvZ�QL@~���|(Y���W_}��nTZ�jŏ�Ua�:���L���i�;Q�֨@�c2J>{�!5���b��_�4�0�`�/���I� GT�o���Fz)��ʐ\�]Ws��R�hq�HR�D��T᪌�3F�*�Nz	�3x�6�� �(��T��;�������<�#-'^0:��DaHe��� ���g�O���
*��9Q��-��x�?` 7��Dc.LS�~Q������2�J0}�u&aI��Cj�V�����h&4�fc��ʏ�
��z"%'�`_�E�a������������H�'�&�p��`Be���J�8w��`����z��y�3c����	��Ӝ�е�s�\�5"W����h|���EI�	�5|�a2�~�!�?\�����$9ɕ�sI��*P��+D3#TN�A.]ʚ{�cle'дEFC� >�:�f����?T�S�8͈_F%���#�[�;e����ߘS�m�v��)�U�4׍��V��r��uhx�w�N�L��P�n�^ە=��@ZA�jYj��ߗ�V��gFF����2�*��S���Y�o�gR��N�c�V�f�p�MLDnV?�ad���u��󚳬V�Y"&,���v�L�}aO���fU�M�{!6�������Ԣ�AR �D@��pn0��q()�,�����ז�L�	-����$�U(/Ϝu'�����d8�x�Wj�DFH-bP��k��~�٫F�J���5�y��gl408�m�r<<+�M�`��a�;��`�j�N8d|�q�`�l�G�$ �	��;�(L�(%�i����p����~��$��.J�E�1��+��qV�b�Gc"���"�
����N�<��r3bg���9
)z0�;�0BKr5>;ν0(�ݐs��d�$H�z6�T��b�|^��/�T��K�ԕ�#��ֲ�s�H���ցA9��W����3j�� �V;q���[ �i�¨E����a���4�V��D�pS��N�/|�����\���,(����2�Fk�&Լ�i�0j�L�9��x������|�fpS2��l*:��L3*���	`�������AC�]bIg��uHm1&Q�#'�*��=
�x>�an����hx�z�7Ks΀"�b�P�(���SԶzB������%��qɜ])�֘�Q ��'v���0���vg�d�H��1R̂�\�", �i���S{��G��f��j0�tB$��揉����2�R2�G
)R��9���ʛ��d�lea""�٧���`J���x8��.��D|f��F9�Կ�yJ^��!��-v�Y���'U	e2�����8����W%S�\$�;�AL�)Y���v���T8rc9e�t(�Έ9�D쎆H�#$�9����Ub<�	 ���J� �����acqu��Ysoe�G2�K�>cr:s�-�9֬��UH/J�	
�3�k/�(�$��f��X�ae���Ɋ��W���4�G��f�=c�?i������2�Uȓh�'Q+i�a�O�M�?4��6:]�N7�Q�����b��ʩ8`��k��	�<)%�%ߩ=T�$4��[��IO��ˉd�q�i!l)w��
��<��]p���f��������*� �	�ށ�}K)漢�шF�I/
����(�����hq/Ā�F�$��7t��)�$u')� Ǖ5w!���~{B�ɮ!�{�m(q�`kPS��t��2�&�F�z����ԁ���K:�NNA��ߘy*��d�wG¼����͐l�! �ǌ���d#>^~+�B�z�DGп������9�9rZ�"���[.�1��N>W�:����J�r����Jr�k�޸�d�An�|)j�"�~g̀S�X�ov�TD�sI�*x#��Ϛ�P��9c�:)Q~�wZm_�ThVNu븭��8�!���+џ��LzК�Y�5A�Y�T5�QB��H��\ "^?���˱0�}Z�L���
�(-C%��T�����1YO�o�wYѭ[}����~�9~Wjt�>q�"�7�� ��S����d�e���7��M�n�{'Gg�^4�n?�vr����  Y�l2�P��������4��`$�[_��nD,4Ɠ99Nh..�tU�"�)���f��,�Z����z������[J�0OW/� ���ɚB�{恦ܧ]􅚸
�	�^��ңjft�2���=[R���w��a�C����d��3�S�N��L�f�_}��S�7��ҎZA����*@&���`�J��ԫm?	�ͤQn��0��� 3�B�,�z��T�i��K������z�2�����fM�i��g4�[�l���I����ق��n�#�TdI)��b�(��aGܢ�nz֯�ȨӸŬ=6�Y�r��D���䞞�e�]~h�?�2��� �!�;��'�1�@����&l0�h8����}:/qO�?�d!��c�H���"�Q��[��辣y�����]�%�#��?EV�/$�rX�Uk��+�O�.��5=�6�Wx�?��>�����=W$|G�O6w���5��q��v�&�9#�Hxab�4'5Лt3��Oh�    /|�iܐJ="Q��b���1#;�=:��H��L������yIL���ؓ��(hg�S_�!�V;��F>іt��<�ǩi�l���q3��������;I��t�~�6���;�o~P���v;�F��^u?����W+~Xo�ۺ�����f�a�)7[I�7Q9FȋM�����Sʖ����;%��S�~3')��$��ZS�B�t�7e�w
�lgcr�S���%��39Rm��X:�;���b�s�8W��n�(��r�o���dx��l�!�����OA{[�dHI��|����f�-e�8���9ǐ��J?S�}}��-���>���})h�<d���)LkSI)�N��N�Qw8:���X���$���yO{�AB���Ь�֟��V�V��#
,U��*Z=N�����PԩR�-$���9��3����Ii~&���wNᜓ�AJ���l�[�����G��{��8�3M��m�h�b����vfw͍���������j��>`�@s%��,�l1옉�ݰ���_
q���h�=e�YU�] 	���7Dgef���}[ǢiۯV���ʑ�������\&Ϝ����@�� �Eө	r�/��|1�a�
Jɧ��<�( ���9��и��sJd9�U���C��Qy:箶����� �o{B�ŕu����s&�r�,2Ѿ}�,S��փ��n`��ĭ�*�"����V�z7RR�Wqp
?��^�
�#����F�{��i~�_
B�`�c�8ꉃ��Ǎ�F��nT�$�Gq'hF�A���A����Q�^m�;�����r{����^=qA��2��Yʞ̡��v_^8�m�˺у��K���N�U�J��@h�Z����ݝ�t}��ǯ�0���,��)���`:U�Ǖn%|86
+eW�G��+<>���:]GB�n�$h���e��83�Z������p:Ib��?Y����z�-v�ı�U	`�O�h��o(�ê45�sK�����`�&�)��v��	�c�=�Zb��O�8 L��0�B�'�#�&�2 ����f`��������`ʲ߯���I���&'t;o�vh����H	*��:l��w��'�=/�yn�]؉��j��v�(��A���a��^�V�6���������v�ת�FT�����f3
��vج�q�ި�x�a�>y'��3�	ՔLzI�@�R��H��덊
��"�V�`V>䮃������;,��[�=})/�ߕ��®�<�Ɨn@�J�:��[tPzb5ޤ�n,�#�Ix�K2�$/�7�5ټf5���Ɛb"��N,#]O"���}A���]c��5EΚz�x?.T㴖�q�ԍ��z�j�Gۋ%�uO��Vȗ��u]sTJ=a���EdI����I����*��U�A��~T��NN�\v��1�|ӫ�Ik�.�?_���!���Ӈ����ރC�i.�R���|���9$5̟̌˛`vf�QpɧΈ���\� '�~�;Z���oR�h���|��A֋n��=�^ܥ?$���13H�,�`���Z�M�٢�o+��@=����P�i���.�հ�ȒK��X}��yG�))/c{�j�����!
xO|{%0c�[�f��]�IA�i�@����ڕ��;3�Pjm6��_�B��R�oi�u��13��2)�-�M�as�6H�^���UC
kU��^֛�Z�QoU�hg0�͑��\%������{F�a��`"�[�Ť-�bX�-��^I.��6�O_�؍������a	7��Q>�F63�e���Yg����H�~\6�p �S��n�O���畷�9� ���W%`���<ZΩI�'�8��&pp�%�!�a��X>��U)���x�� S.阯���!�˜�͔��[���H�,9H�.#x���ѪV�d�pg�`٢rb���DNqB��h�މ�S���C��w2L�`��\�0
��v������ѻa�C���d��$��-��f����pql�q/7sF�R��"�*Z!WgH'� ��ɭٟ�Qȿ³}d|)TE�rqN>!]H ���pF�fh�"X'Nb���귪۾��1��fVV��T����)	gz�WV�ܓ�%�5ղ��4���]۽rY��o����&sj�}��l�|�'ޤ�M��b	��|	�N�:h5��|8�����ՠ�t�A;j�;���z��K�ۛ��|WN^�Ȥi�"��'�h�������v�ۣ=�H�Ut_��F�/�b$��z?�|����jH��[�VsY�kҦ S�;��@�R���;� $d?A�&_Z���q�I�1�^ɤfR�|����~J�� BM&����/?:�"�uέ�%�7��D�����0���
��Y�Wr�k���10�[%�܏*<�.u�l�_x��Um+d_):�C@�/'�?!�Of��nZ��a8B`�b��Pæ�|��ٜ,Z�sE�g2qOI�o�W(\)$��sG�"�ĵC�u.���[OOըT/�_�mh��b�(e���Qּ}�,���6ݞ��ֽ?֪`�l���Q��7���Y�>d��Kl��~���A���F34��A���pP�z���ǀ��q2�'�ܙ;ǚ���K���kYD��\��x��A"+�N,$y+��Ý�;�8�9�̴��K,��D��+�����C[	��P���/nn�5�M�|�Ѿ��;���բZ�WلD��pay
� �^���C*���4�8���pt�uAJ��*��!G\ Ua�����h^���/yE�8/-���`R��cp�#����d1���]c�F�։�`��!~��yl+\�V��}�*8��\�!$|Ga�;��6��AZ������%I�7���^D�g��΀˖��áS�b�<̛( �ڸ�b�r����x��n�}+��ڻݨѪ���PX@�5j5���ڍڭZF�����f���J��یӀ���٪,�7�dMZOE�/�s���,я���xF^+Z.DJb�YϱW��zT�z3�ۓ4�I�6�ծ;$*�7��������Η9D�������?��GZ1�+nK�t\]N0;�R��䃱�#����:���.+��S0
�Φ�)����
'�)ן��y�Ĕ9�/,������ \$eIE:G%��t�ɦS+����m����Q�grl�|�8q8�6�3�H�.�*�dCW5�̗�K��V��J�7��-6�[��W�9u��܋�*ܢ|CF
4f����I��U�� Pd����a�GB!��c��z8��Y�ۺl� _W$����Oy�"���
��h��~ҩ��=�-g���z��v�_��.��;��A�X�v'hףVЌ�z�$͠�o�[q�W�6;�wrt0��\��{���~��������1�k���+ī'v�J.�"�ϊ=e�*,�ϫ�xdk{��LR�.7�p����|�^��3~�7�o ;mr+e�8����t���ƿ�[lg��h�0W�7B�����yi�����r)%�u:ÞE%�+��_Ze�	�G�ԑ��j%?�������S�:��M�i9�:qě�ҩ��fu~�_��8%.5ϓ}�<&�\���C�
�C"D6[ �jG�H�0��|z,9�|9����I�O��pU�]o;�=ů &ț̛����K�g�:@����iz���
C�4� b�U��Ʌ�g���0}9�F�n�,xʓ�OR=�	��D_��i-�-��;�nt�a,|�W���˹��	��k�����]I���M���w�A+i�U�^�Y�^��v��#e�~�?�!��ʱ���0�hm��`�|����R��([���&غy�B�G�����I�F���v�]�Ǘ�3
�	���R��ր�m#�� ���[�<!�L���ؠ
���m�L�	��d1��ˈ!��"�8�?�D�P�A`�j$[I6�LC;�"V2.7��rq���u�=N��_�̛�P�2�V��ɐ��u�na<,Q��>˦�^�-�`^.G.:#u�r�UY��r�����%ي���0Z��&��FPx�G1� ��>�"�����$    �����V���5����cK�Ϋ�4�C��ɂo�I»�I�ti��J�b�S��G���0!M'�!H^� V4]��P?0?�R;�0��G��y�6���7��ԻE�8O\�E���P+{�
mY����6-<)�Mp��e��t*��ܫ-.�{��7[���-�2�כA7�:� J�I?��Z��j�b��d~�[�}'��Д�}Y��)"���8gm��x�q��Ϲ�OHdhb���R�V�w�T�lrl,.,-z��$�v�I��	y�_��ڴW�,{{�K�F�9��G�8,�/� z1����
�1�ֈ��J�����'3g6TƤ<i=/\�DG���)����7�aix{.9��e7�R��YH��u���\���A�Q?���ٟ�pcAF�mMl1�g�"�<�H�l>�~��$�Wx�Hy<�,*<42�a�J]�Hd��)5��pB�i��;�x�������|n������I=�x�Q��_g��F�C�y�����:�Ŷ7�Ś��|��4�MT�o�bB?�ݖ�/�Z�T�f��٩���ĸ�N#hw�ՠ�B�k�Z��հ7굤��S4N�91Nz^/��杧x�����m�A�28
�3�MkXl�N-�ε��D�Ԋ��T��[@�K�@.������}��\��fT��? Og�hZ��a�K��g{�����VE�m'�m�����x(yO!���p�!�2�*?q5�ې-�m]�R< �[ ȴ�ԣB��?9EτR�V���S�iZ��H~p6��h�.9?��4��|a(�#d'X$�ٰ?���o�o?�6�����-'�p�$W��0;�g���A?�Q��}~�.�<����]y�����S�cP�ǆ��)Vم��g8[L���d�Yk��Or�,ͯR����TI�+"��������Ys�N�����t0\ �
�a)3V�����aU0b���7zM���R�ޞ�oW۝�]l���lޠ�P)�~�yF~�e���Ԯ�_]P¼��9c�zb���Ef�3�n*��9��n����:�jP�W��6���u:���V�u����(�2�H����s9/w7t�b�E#��+v^̨}���7��ҁ�Ոo*\���Åso]��,뒪[VJ���®����E���/y)��%�N�,����<�����IFn�]YiA�T$��i	-�T�����������'��xk�ͨ��f���μ��������e�㎌��
8�������ә�� uזkB�6���R1�j�<�͗6$4N�� Ӌ�3钎��
D|����o���W��w�6q���j�/�����x��Y,x%{H�w`2V�.զ�O�X`��3PX�U&��:�rjތs6��s�l��p��:� �<�Y���j>�Pc�,��0��$n��%I�b0r0]�i4X�Gf<T�Q�6ߺW�"	�wC��J*l��'�0�P��"��ҶQđ�g��&\��5.����\ׯ>�l����d�OzWƸ�̓�q���n�֓F��o���J�/����A��6��f�5ڭ��n�A��I�>�O�B:���q�[����{����	C� ��qJ��<�k:Z8CJ�W4�xm�$0�p�=3���Ρ�3�F�഑5�]�mت��XA-Gg>'�>�s�*�V�z�}:�B����P���"���@�Tr�}BC)��e5� X�T�|��[�r�q��Z>�G�����$E��p��@\��K�9.�V~���L���	H�"�`�#�� ��F�$iV��Fy�˾rU��Dn�md�E�r\�ί���gJ������ͫ�fZ���!)�y>翔2�)O#�*�Ŗ���dd6�(�a[�$� �H��y���a8Z��C�M���89����h yx�ۥߊ�aʣy�X�~�ZR^��M���6�%�d�H�|�A|��aJ�I�?���k쟕�:�\�z_`�)����[^#+g!a�*_ԗ^���5���H��d>dQ�?Z�x�sw:\-�C��2��فu�f�ׄf�h���o��x��l��?J��a�R2m��ﾔ���L�_�b���϶g��s��6������� ����D�s'��9�Yk�yT˼�C�j�C��r�k�$2BAެ�]���7Z)���nN=7���7��o�y��`��$��M����$�@D�O:� l�ߩEa�jtvS���K�o��
>�������Xo/�#��S�w#�� ���K��鴘'���+Y���b1s!HS�,8��*t2�w0Wp+�Z�B���Y�6E=�p���t"$^0��� �����t8YO�o��!��=H�l�%f�->%EJj]�)���#�pN�y�/�{�'t������
�:����o��t����4Zb��8�����`�B�ޏ�s����������2x(7�R�<ӎ�1�*X�2Ҧ��Ҿ%߷�H����gN����XEs8HD�c�������7���+$�Rr��(���|H�ܿ���qf��%>�b\���c*���4�q�)�mX��5O@U%b۾�EY���/��c�d���fm�+۬��J������yh�W,��]I��йx�$�p��~�Z��T"��T���?�9N��0��j�ٗ@�_��a �T.	�A���QD�P �\c�".���kv��?x ���ʹ��n-�7�Q-����Z\o�n�č����A#j�q�-`�v�H�|՛�b���m걤��zn�ʉ������J��̯rAG�H>���: Ƕ�h�HA���qDk�G-aŶ<� /��?�b�
��Z�~U��T[�r%2���f��t:3
�W�����PjDm�S6M��o�����)�^�%�452(���pbr'f�J�<���1�����u���#u�p�Y���]r��#�f^	���[�d��ș~��r�n��(1K�a�Hh���a�'A����� ��TY�=�|����L���U,��ƃ-�LSP�W�n���4�Ԅ]iD��W��:N'P��%��lz8�����X_������|��9���� >?��@���%��#�A���fi��ޱz70kl��s�ԨCϾ��+l��[�fH����X˦��t�iĞ�W�d��m��Z;�ւ0��f4��C?��z�����vr8�?�c����iV���c"�9�ے�Aw�uS���z��1o-����¨�	�(�k�=�f�ѫ�`��N��փ���(�F��g�.h��Y�K1��2�)��t������KZ*y� ���$}NL^�����[Bσ����c�ǒ9���9x��/f�C��Cc!G.�ie���ٓ�g<o�]㏠�;'�~2#�gT�C̜����8���ؘ�� ��A���[&�������N}���ȉ�Ϝ	+�J9�a]��% *����Td��9�Uq2��E��`8����֦P6�Bm_Eڏ)7�u��:��\_c���uW}>����b�n�	Z<'c��<�����^�O9���n�X�À� 	��j���v+�U���U�f��#�(�)�����Ў�R ����S�H��e�	PTL��^�H��
�n�Pߕ�?>��eg�n	'6��q����1��+��������d�m�@]K�4+Z�F��( ���6Sؼ�Â�pߋS)P�9Poz�/�-*�����d�04� ��e5R���3Z�U���	<η<ί�����֢P�I
@V���}b{F�@A���0�肛����x��k'/�;�(�*�9��Si�j܁~�prֻjszd�q"l�]Ľh*̵w�K�|!�M�Z[������dp��nI�~>&d���7����I�r����.���k��gFK��-M�bK��F���M0�w��ʪz5��T�!Z}nC�2���J�,��[����nu�^;2�ۍ� #WZ�n?i��^54�����s߭���S�1������^.W�� ����LTM[�L��`V��o�/ ��y�Il,�|��ؽ��!�ݓ�� �!���A��T�����	7�/<    �#N܅�刘�Z��+[�r��*l�47�"a/uUR�f�:�1M���gw�2'S�c��A{T�xN@c)��3���}�5���.�-��|�|��~���)��2W�ƞʲt����o�ʴO������
Q%W2H�*s�{y�_c�G�u�H� u���4K&���~��8�4�}~|BuR��L��މ��5�����e���LA3*�Slp Y�(-!�S��-�r���Ďp���D0��=�ur���E}Y�$�1��( ������mO?!�.�>4Lv�hjI)��
��"�" dHK�-��F�[fN&zLO2SB=?��kCd��N��1��+*�P῕ئ&:↬��ɲ���O����	%��d�����5�=eM�=N���lO��AB�ި@�!X�ǝ!��ɡ1}jaY�B�R>�oT� + b�jȯ��j�q;o��o�p��K|)�c�;�l��B��QB��#]������Nw��(hDa+h�{�ך�v�i4��[�6�q��P�'�$;,?O0�P4f����Y6G�-�F�m�sܸ���񁋝����qϩ����Q{
�y2���3�|�
/��*�i/��?�%{A/����u��l��C�{�)���~��}�Vl'�o܍�3�M��
��0o���8��=��q��Q{��&��iV�������T��� �x���v�>��/b�xy(����Ê^>��Nh���R��"zOzD)���]�z>��K:�Wٹ�ya���2�k�XTB��,�����%���Sҧx	��&0����S�<�`V��e줇��2ވid�MT���Dv���9����8����P>�`��l�g&�MǬ~L�b������*���^���s��w���������k�>��eVC�3t�ILWڷ���@}:�����t��6m�r��Ll�L#��R,���R�r��+��{[��
��ϟ(����2�*�*~�|F����2g�h��ճ2P�cCa�q*|Q__b��)�\p�t�]T��E�:v���Ed�����:gz�
���"7�@���V�L��J�/5�X�L6rJ�(�%e��n�^��N#j�j'hv�NЯVkA�Qk��v/��;dI��������^9S,%"�|^S�L�yX{"�k���,�^�[����D���TAFk۳���..����paĭ}(K��x�7������b����ec������3�z�+8D���8cQ�G���'����M�dS��TEzn-��g	�~D�x��dd��=&k�\x�(��ٞ:7+2��ev!C/ZjrY�])��3��n:����c���� �%��	�����$W�y�_��E�]�%�9'�j2_ǹ�����ހƩ���̢��5�͐}d��V��I����%���qF�L
��E�g�����I9p��ڧ�y�,�S���������[y��m�6�$j�g\�x��~R�2������C�L@;'�3f�Q�]�R�C2��u)֓H�T�C�\�9ɒ��������W����w2�;I�kT;�8脵A�L�zV�`�ڵ^�EI��G�F��k��тH �����T���;;2e�7��������$�\y���������󀳍�Ҟ�_C��5��@=RO�{Ś_����PtY�W%)ʊ�E�]�8v���u�����2,%6��Yr��c�hGn+�p?�����\���2ТI�@A� �݊�t>��'�>;o�"��{�J�����JU�D�q�=�Цro���4ߗt��h���kz󯊶G[>����x$���U4�D�l�"-�յ��7�F5�P�o�Z��[���r2I�QΎ+��^�?�	��Q�2([��?4���+t}F���0�߹�{/�ˑ�x���gϾ!Y�A�򢄩���& ��n4�Z��<��
�@b����m���y�瀡����g����cAgįR�$v�HݟCs`Q�-1���g�@(a�
-'��X����;�T��SWS=d1�n<}L�}�ϨdN��0���M����3�-,�EE����]"Y��4���Z��o�OX
E���1�s�X��r��BIYE�4m��\��d��a߼ݙwG&@�B���3ώvy�8�����+g���{zX����7�g�=�v��|��?z�s����cO.�ѾI�=�ґfC�jH~B���T$N�Gt����gqS^�k�]�Z���fƸ���d� 5�CaCP�Ь�j�Uj�g�I:KF�$7������77� ��8�ܚF�̼�{��7w�K���(r�����U��9E+��"�L������I1Z� '��w0��j����2�b����UP��S��>�LXQy��d��*x��t�Y��/�������j#Hj�nЬ�� l5�A���SK�NC����8�z��{�g3��(�"�	'a�#�����a�Z�M;����KAr�vU��"��f����^�ka��V��~��(�](Q���	������r.+Xl��t�X
����@����[��Q��H��I�\�u�������(��>c-'
V��,�+�d���kѠ�d�� {"Nܛ|��u�QPS8r�?�0�RO��ׯ��-��!#��u�f�SB��D3���\�Hs�6^�B�
����˾�RI�?�>�ō���э�>4�C�Bޒ�e����]������XNA_�	-���d�� 2;�.8��2����:�X����D���iZ{�$����%4hK0�2��`��l��;�~�����s��M�ҩ��)����S'Sx*�K���nR�F��|خ�ZA�5�~�J�N�;��z�j|�#'���@���HlgQ8t�'x���b?�)޿3�ڌ������Ӊ�K����ɑz;o��DD>��E?�)�r�T��s��|&�ʳ�;���{���!,��0'��EE����<�u(��s�����,h�"-�A��|j�@�U-+�ʭ!Ě�k~붛�]E���� huA�0�D�Ip|�!���	Մhl�����p_a�ٟA^��4�Jt0��	��;D0�H���+��%lܞ�8)�=X�24Tu!��$N)�;����>CӖ���H�d�������Q�3dYu���Xй�/�)�3e@�\D��E3�롉��q϶p<���B�<q�(��b�	m�S�ДwT6_o}+_���*o�]���{�{. � a2���������r*,a}��0���k=냊f��5p�&��]��$�@�:�>p��\n�;\�Ec�\�^�3�q�m���ū�*��Y�<��+�I��߷�e����w�ޡ\$��mֻI?��A�
�&鷁u�ԛ�AXm���zO4�������(3�� ����4K��`F7�?k�����j�~�Ѭ�y5�(�YO\{����$!�Y�»Ky��'O��c�Ԙ*����H����~}�{b�����FbU��Aω�[JG���<�ps�I���7��q�S���q�l1�%�)AV��`�9��0�jb��Tm�I�}%����Q%��֙�e浇`��_��'�1��l&o��3��}�7�x��J0t��ɪa���:���z0l�d��H�jb,�VFnhX,;���hBk����x_*���b�OiKU-'��H�2���I��0��,��z��e܎�%D�*��JetO�:Z�)	�]PQ)C�^�܎��s� �Y� ���H4S��"���m����OI��7�Z������
���Y�O)�X� l��O?�_$�e��y[�U���9���7�k ��اsK���]A@Z/7(�ǜ�x�nJ���n�7��j7�6�v��$���8hF�f+�$�Z�����~�@7��j�����t�=��/[��rD�I�Ȇ�U�%"Eǒ�v�����@�+����3ee�⯌|�.�xI�[�9��\�`U0�X(�v��}�- �|�Ʀ��8���،�@@��E���#�������ؼG
4��~
    �|����]�*���� '���:k�)�a%�ؼ��3���^}�Xr��0,Ss��v=��i_q��ѳ�C{%%ѿS+��w���`H�U���w���"	e��g��6o<cC�ו܄zi�� ����m���"���\�9PB
�ʀT<<\�6�>��8D�Ĳ�r��J2>M���<��Rl)m9��q��^	���^FK��y�%��іQAMt�����������d1��J9��\��F��7蝠����d���Q+��o�9U�x'$�I��wD�G�I8�0A%�1m> ��GNR��7����:%j�)�/����ʸ��l�3	wI����.���
6|�1�N�(흻��vܩu�(�5�'w�C�kI���5�m`��� r^���>�w�j�n �H����L����V�U�ʏdS�f��P.<�չ�	v�SR��(=5�&p�noa�۟,]�Ŭ�����(<��K�����'�Sݫ�aʛq�@��%�p24��\�V0�m��t�0=��P�s��p ��6m��'��"��W㊜/�0ެD`H�xoBa�Z�R�}���xHT�u�i4C9�-����#�FQX�1·��U�����D��Ĕ�{8Y$ �Q�CH��R�M�ƛ��o!�Fm!ڵ�*p�A�z}N Ÿ ��6��?�"DqQV)�2�WY�ǁ�hx-�Xخ���L0C|-w�St�BF?��,#�ķ Ufg!��`�)s����.��/G���i_�Ȣ�<vR9����v����o����窔ѣ8ۆ7�s��\tc�8������3�����u�Mc�a��$�V�K~t ��h�<�n��D%p��J��Hv
��v�7_�͡Jl��h�A��W����5��q�8�w?Ws%�
��8=c�؉-���q�-��K���~JΌ�D����W�*[���]�i�|綰D��D]h��mJu߼п�u��XY)��47o��m�ԡ��K�/+�������D�Q�+��U2���֣Z�6���A�M�f��n?	�v����j�Z�l�A�Zj��'~X�}�~�yk+�Trp1�v���_d�r��T!��z!�u����D	�+����TL᠛w���f�/0�%�	%�r�
��T}�����&o�?��괂�d�yX�Y"!NF���rܟ%�QH���m����x�g�g(�H�� �Ԭ���������8f0;�7�!F�x����#�Lװ?3;ÏN�͢�o�CYt��O$��$u�y����{n�[��'$!.��S��I��\�l.����Go!�R	 eX�!y�וzdB����"�/�.!��W����i�2����p1��2;��`�JFKrxH�����Ȇ�zK{����Sp��Wy�޲_�`��%]�b�d�㲸m�7N�]GTX��.�lႣ(�lG���SK��?�i7�f5[A�k7�f7�n�W�դW�Z����v��^�	c�2��aѯ�^�D�h��G�8lր=v4��c������Ǭ-�#���B���4Ŗc��+ϥ��f���G5!@�y�VOO�e0���M�x���]+�5qq��˯����\5Wv��u�8��y���t1y!�\�jW���Cԛ�G�<�$���N�[�pt<�B�\��x3���ʑ��1T��w�ő���S6Ec#�w�\�� إi�pc���G!S� �{.�S�+v��b���zP�y��>O&0@u
NK�wD��ٛ�ˉ�o�9��7�=8�>JhA�<"vay ( �<Ȥ��E©<QF������s��MT�_�2���R�z�L����5qҝp��R�~�=\6Kb��3I3�^i�v`�,�ТF)px�)xw�i�Y�3��4��}���g����� ��ɛ]�`o渾(!��1�p��\c	�Tf��B��L9�%!�/����^=�$+�,�"뻭h���&(�DA�Վ�n���~�ku�(Iz��Y2Nb��N3y��zZ㑼�t�$C�`��9�"�_�"$c&r!V��1$��*�(ZQ����q�E6f�<��W�~�6�L�څZ�O�.���pWs��;+�cP��ت�A���"��x�>��:t��s����	=�ƭq�Y��-��z"�����+�aP�1C{�/�O���f���q�}v�yL��2�J�Β	�Y�hc>��wh2*���u�x�6?���
U0J$ `�8t�!��,x�~���/�]��0�TěC�1=*j���sڟ���(�!�gq2���W|�Z1/�Ҍ�|��v;�XZ9��A��{�� �#��<���uƏD��pH��a<X����"���� ����+�#7E�`.l7~�����{&�+���t7�"�e���w�3YcY�b-]�Si�d&ju$���{�A?����ܖsR��n�����~�4�^��V�z7�&���|���Ť<������lS�KR�X����<�ɰ�D=[��ƽq��y�P��4�?,.����T�p��=�&���X�bC�A�"�@<���_sOC�iO��[?����jF���4B)"��^	��L?��&X	���d�3�%q���M@x��W�jܯ�f��u�^�i�w*�6!o�UgH�����gK�Ӊ���X$�.���E�h4/x(�����Ha�H�f�O���ET�.�!U���;�y)��%�����M�M!*��Zԡ�h`�b���G6O�j���BLZSB�<T��g6��Q����Z����v���Tze�P@p�/)X��1yC3����_W��x��/'�����^&k�ޢ$X���X|��c���S���������nR�5�f��@��W�A�
�����֣ޠU��v��^ FU?�N�Վ�]��g�)����A�����
acY�Q���L��F��ը�ﳇ�;�c�:w:��0}�f��� ��aɊ��)�,zT�73���"Q�VJ)��Ԝ�!��	��Χ�Z�8���P�?4�h:'B{��,ԃ���8]㈒���3��</���x~A?��/R�\��a0��x�V@����P( 4��&s5��\�}s�7l�tL-��r��� ��A�U��+֙��\y�k'�w�u�t��#<A}�ҥ�� �L�y��s4�%�P��������T����sl��CO��*�������0S�R�41��b��h�nޏa*g�[��n�1�֢ ��k`�[A7DA#��A������F]��;b�=WHOe��/\X���u�_��U�ܝ,�[ŉ�źV�����ߺ�ÉucZ��CYɠ��5E�Md���L�s�-z"B�<c��ŐS�j�h�6�Ŷ�0X�>� u�2��c.G�U���w
��k�g�'��|����B���� b�0��s��w�X=,�O��rߞ)^�ę.BK}�F$��j�Xbi����c3�59��+H�\���t���Kp/�	u*�b�e^�P��֋ޮ�>��3pW���Q��f�f�}ӳ~���
I�~;^�2���p�6آ�e�K	�7v�n=��Z:���jU�^'J�F�3�0�5�a��Րus�����{5���P\�a�����^���ڜgQq�����2r�g�q��sU:3����Gi��iU�)�ڪ1����$��olY�O �߭0�q_9~�s��*�izK-���($����ZP�`9b�\P�O>�G�Ê�$�K�/�����]���}QY���V�~#�D��5WGv������p��XCĶeEu�_�/���?ɾ- P�2��X� s>��;D�r`%�T��c�bexM���U2��6Oq���a5�_28�X����az�2�z�xy�؁�`	t5VS
ǠSTF�+u��/�\��<�7J(}j�R�,����d��<��N6��U�wi�����'�8�%�NЌATj��~k�i5�Q�e���p*&S��d?|������@�S�k�3�:Y�&���cL���A�4��f6�g�U.�..�om�%T`B���&�;�����/1<�g���\m��{�<~���L��,��  �  E�ʏ��KC.!N�}N�.�OTHƈ���
D��&-���<_�[�9�������c�a�h��(X�"�LpR�r.�����υ�W�%ⅽJ��	8=�
�#q�A�.Ҩ#�ư��☀V 28�Ze�����c,gHZbb������8��ݫ�R	���<FAT9ג�goj�O��)�a����
��w�k���a7R���$n�d�x8�N`�&K-��#^�Q���sr�*}�w������� XjA���n:h���G��,3n��y���~�=*�X��s�Ne�&�p0�}��eZ��ڵ�o0� ����;y�3��"N閼\�������$��A��K�N�͞�I+��jqc��l�cҏޓ�t���(�u�D�*7;����fR� �>��p��φ�<���{�K�}쇬=� �hdb[�~�h�n4�\E� �ʉ�Rw)f8�W���o��1�L���T���!�N�cc8��p>$�!*7"��Wr`�g���X,����M2t���3_���\ʰ|AqsVeɕ �;]PI3�ye��Nox:ޜ%C��%��˾����m:���g�O�g�*�������_�=-!A�>���R�Vb*g����%^E�#���c����3�ɼbZG���&�n$��/@0V9[��5?��A���5�7{� (}�z���jQ��k��|	"��Q�[,���N �#z�j0D>y)�,z�m���3��9��;C��j�Ga����ϫ�s0�(��gr2��ZС"0�.�<�0���h뀔� �)����4#A��0C��p��.����$9܌&���{@^b��ӹ�B��Ͷ���z�n����;�D�H�}��S����1�;�ZT~g^���0�욧\,#E�+y�i����H���8$���$�3P�����9�1�!�IƋ��y
	��ҫȾ0^���2�����AY���"�������"���A���)͒�ZB��OK���� nwZɠT[�FЬ���ƍ��o4a/jw۝�#��u�^%���^�9�be=[�����b2�}�rT�Ȼ\WGo��AÐo0@�u��1�3 H��C�w�����т��98�s������p�c���%���xZD��߫���Dcgy��P��ݣJ��U0�6��z��hA[%Ɓ���R�DǓ�8���Sh'�}y�4�Ў� 1�����ph��p@3�1�x:�b<vQ������?D�lR��!�z��`ֈ+�s���\іE��Q��G�]��>��ܶB��3�q��q ���G�ݞ�Q�y��kO��[57��:ɭ�\��^�	@T8��j�� 8����.���t�莊ۿ������':v�m���LA&�"��_��=��Z�S���W�����k1$/ԉ�j���U�q醆C����n�9���f?���8h�� 49CGQ#�n�ׇF�y]&9ai����Ls�\�r�K����E�\	���Y��By1�g�g���j���XŷE��Ͽ�*J9'��!B��	k�<Lf�p�IB5c����I�0���#�e+�nG�y�-�K�ĺb�>�O3�������C��
\�@l>���:�KL�	�z��FW����0
�	;��S�dT���j��y��C�r�՛)��E8�����2:@&���! �Ԍ���&6@�a*)Q�4Ն�zݘ�۩e����j{����'Έ��ٺ�oI.�{��\����NZI+l��Z�S��A3�����8n&�z���c
W�u���O'�HS5ջ�cR��WVL��sy�����q���	���b���wLh�~>�S;4ͧ����r�H {����8B\I���֫�t�Ȋ}�����Y)�:J���*�b�ZM�(f4[�'������Ȥ��N�_i _�q��\��Ĥ�La��D��|��<fφ�O@�� �� ��.:�<��fߺ^��PH��BJ4xz�kb�`ot�t��3I�����&p���l�R(�gǕ�p�ly��K������*�Rd(��*%���ݩ��M���µ�7~ˑ?$�2�$���ڱO`r;�8�[���(�����!\�0Z���/�r��T2E��\ʽ������@��u%=�bw^C�.��a]O��v&�U��\�b�,�񿒾��ۇߩ6�Aܬ��t��&A҈;�V��jtcŔC�p^3G>��~�2�B01\c1�]��Wɔk�/G���Wn	��c�mZȍ�)���wA��ܣzt(��QA��&d̄�4!�PJ���P���$�j�L�D��=�Pj�;���'Z�4-$�v��L2��="+���0Z��X~8�&��[�ui8��CB�!�J�K�h�8���d)S1N�-t�֠EsLM��
��M v0����l�%c��PX� (�r�ڴ�������J��S ���,�p|΂��x��~*�Hx�0��Q�H���n"y�2�`�f����'l���R�R��tr����hON�Sj	�r�"�~��BJз�/�XΛ�wa��A�5�z��Ѡ��N�]���VuG�2�d����G@j�`�+�Kꮛ������%V�����,��''�e�S�Vf�{����11@-3�0W'�U �:���nZ
~�p����{��%q6���̥����V?w��s���!3�+O'�c������Ժ�a�⨿[X��WjB��ɚ���
>c.N6R��[z2�0z��B�l�D�3_F�M���}F/�
i�:�s�BD`j�-h�ϸ2�%���%�����h��@߄je&�$�"v3��F��l(0�?�9Aeq�/��ج:�CGW����<�I�n�ȷ�NR��*i6�����R�ÀZ����C9��1zتu��S3v�٨��~�^j�z�U���N�#
#�K_$/����߅	� ��f+r�va��!+�O�Phw;P'u=�,�X��dU^��qw#a!�QWAԔ�����ژߗq�B!pV����7[=��u�/}�bȏ��R�ڿ@��5c��
�XX��/�����_pUt-Y���}�1�&3�J$�~�e����q�|AHfh 2Vg��_U�~g8�,.۸7ؕ���6}��*�g��+*?K������x�=���K��Ae��O<�̓���ՐI��Ū��'3#��x)na���iG�՞GKo
���6��m�dЭy�g����78R��)0=�"�KQ�dww�������gǊ�      $      x���[r#;����W��T�޼������c>��e����eGt;�]�
&� ��3[kR�͈��Ԟ�I�v���3�c�\���(�H�Ӵ�����d�X��dN��0;.kDb4��a֨.8g�|x냱�x���q/1�Rtٖ�������GBp{�dbM�H	�tk�)�)���k;��}��M��L���f�q�Rؿ
W��&� �~���?1Uߓ�����x~��)���m+!��5[�(�S5B�M�ޛ�F�V�����6�]y�f�&ۙ)S��Y�[��H5ؔ��1le�n�4"����j5)�[�/+�c��w������>i�nr�Y]��M�P|����b|7�����J�T�����h�h�uNܮ����v[c��\"˞�v������Ƌ\*�S�`����_�^|xq��MU>f7�0�%�_n��;T�p�J����ev���4��6Ҭ�ef�v����L݋)md���7c��[4�_��$x��P���b����kv�����֘C�˔D����̮��Y���[��Yb��@Ί
�q1\��YC�H�������ۗ`I�-�����Y�lG4��Cj ��c�qDIΒ��7��$�B��}�b�֒ՇY~�|�]��4�#Zg�l-zY�aVS��1��s�#�8J㣢��L՛�7>��+ȫ�]�:������XzCVf����s8��k&�cr�̥a�x�=��V���s�h��)�� �L��ݻuu�$�"/ѱ�9|d�'`�o� �2�|�:�1M-^5�^|�dw����BN����LtB�.d���r��^�%��p��6����3�.e�
��L]�s?қ�1�݊�53\Wh�ib��6�.�t���0k_l�i�OX,�8HCrL��(����d���M�-�V3�`;��3����]&�xG��Y�6ׇ�F�8{O<uҙ��teS8��oz�oy0e佢�i��N��&ܜ��6�$F't�f(�M��C���!���GYD�VQp[p�֦��EF��:n��zC��'��,�����a�BX�ر���$p8"�maDz�s�Jh�y�`�]P/���#�����w����-wP�n���aYF���Mj���Q� �%�!F��
z8�(����E侪�P^B�q���pE��M1����} �d��RLp���?��P�c�����!�=L����hc�J+�?.�%�r�o��ߠp�����ZԘ7$��)�)N�Pa3'�!�K��'}���xg��%�{���� �5\��#*ZY��H:"��
��o~Z�=����&� � ����͹��r�}V����z��1B����y���!@f��P?rph�L���ٞ�AW��$��һ3���,U ^�ʆ�b?�q�dX�B���
 o^�K�z��C�1�]��:��b�C�;R��L�J7-<0��Ыj_���x��`+$�ʁ��UϜ��2u;#�/��vsqٽs�ǹ8I��x�HN'Z��G
A���V�~�'�N++w1� \܆)��<�3IۻXj�`�6�x+XA矨�-���že��܁ε�a�.����'�a{%�r4V`��R�!�A��yPɭ��j{^�.��ޢ��?b�n�<��7���x�!W�:�Q��t ��Al�h'"�r>�r��z�e򈴼���~ >�J�D�G��h]�oX��F��Ú��*���֦�y�,P9$y����@�$/sn�0J9x{�Ҿ�n�6���G:j�;I,s �=6�<�e��Q�N9,
��N���~�M~Q��mģ��"��K̪$���3h�FM @��F�G 3"a��t�wkT�oj*p:/'�h���!��>����w��Oi���T���x�y�
2M1���>�z���/$�R��j�|x��נ�Ub����+�>`�A�������$Q��ѯ<��=l�,�$ţX$j��A9�	����^궳�U��˷`8y�E���۬�	w���ˌ�D�m�:�d�8�Θ�pl{��M�6�e���<j1�e�����=y,��Y���Uf��U���5��U�A�e\e�Q^��ק�?���!�����e�s8VZ��V�$�����DVb;��#�A+v�]�a}��9⮗��pE{��I9�8��J9�`e�ѐa�kSȬ��1��#�w?��8exw�BQ����y$2���k޺��3u^4�		�.��t��Z}e�B
k1D�v�8�v�z�:z�6댇a�p�<U�h&�`��h�9ɈE?�(��P��YނP^/,X'��b�2���>�Z�p~�%�~�7`}��-Ϲ����ٚ.��B��#�,@�p�3q�!NOP.�y[�����Iv?�{z�9F����EyMٍ$ L�B�Jh��Vgg��-ђ��8k$�J�t�|�ك�}�K�e�Y�d�!��J���p��C`p�Lpdi����\7� L�N��I�W�����T�SC��UtXG�PD� �v�0r����>U�u�T�")�gĘ��K�?C�>��PU����{v7����G�%��H�	��"e��&����l7
Q�����]W��8y���aj��K|��9�X�awU�a������޸�%�8/#�n&�tR����ajW�g0<�|���U��%�aFVfp4����� ���|
:z�2t���k"�$Z0oA�_ݠ�B�O�P|&��!�wA��Li�ܹ���4���f��uJŶ{�Ew�\�;�h�m�̒V{	@{_D�?[_�zɟ-�#3��v8�+���J��ȶ�H���Y���i]���=��X���8�*I�튤>�N7�1c�ʼ*�>����W_�T�[�y�o�i{,4���CE�
ݵ������8r���!���pTD[����N#׫X�G�b�;��3|����S�Vf\q�	EP�6�|,� �v��8�b�	3�:���5�yg��g��M�1�w�C�!�E��w��е�O��K4~`i�5��3����;��r[r�}iD�F�97b���8=�D���By�n��;��C]���0t_�,<6�ŏ�)@ Ё.���4������x,�'`x�����.Q㦧9S��ɮ�"\c����u`�������C;2=���瞅~r��<
��F8}7;+���S��(�GM?�uKs�Rs�gi���8� ��ltM)fQ��p�0C�
�bө��Y7�,�'"^t�X�ڳw\�����!6�\���h�v���v�����}�
fɋU�3����j-��i�R*Gj+��VK�S<�>�%�ei�w�����1���E>c8K���(5l�ҍv�J��I�l}"Ыe��^��I���o��n�J�;�_�p�fx�^='d}�K���H�]H����'G�Ǟ�`����m`��&Us;ҎG�*�>Yx�]�o���9��i-�k�N���S�,��	p�!m���.����r��̀r�m�N9^̮��T[��y�G���w�3-��=�qo�ɔ5�Y�.)W/9[hN�R�Mt�rz�Bl㉝�ʻ4��r���N>�
OT�`�t_��)Ħ:rݻ&�'y=�2y9��NA�R�W�nUAK
-vA�|������w���ŵ��$E���J\VV<P��5Oym���rG�-C����P����E�'�� A���W�puKo��-��<(�1��3x��ա@�8b�a��i���@+aa]_��Y�bk&/��JG�h9�oI(�-��*�P}��CbN�[��9�����������h��1�XĨ�&A�\���=��s8t/S
�|7�8�ZͰ-�.~�|���\0·�Qc�I�E{DE�s�IO\̠&�T��;�I�ó�j�������}C��m��U��9�����h\p����n�6��W�[�4׍���ߤ�ow�*�c���u�}խ*~�"c����-߅N9fݐ�uf>�
Êc��~�"�ˈ�|��\�!h:|��J��C��e���|�-!�?S�c�����Ԣy��8<E��9G���� EqE��r����8�]�.c����J�r����������]8 \  ��M��q_I�u�w<|�w-ܑ��N����'Ɇr��~n�m�J��3tz�ɭd���1ǐ����B[N�̀nN���7HI�3j��^��,F���^c�����}��X8+ͥ:�����}�G�����o���|,�G��;.�=�6�@T
�����i��x���ABR<�nvn���#q��[B�v�|l 6k_���{����K�s]t�~��w&�[���~�b����:F���� ���lh�fJ�r�b3�N1���a�I��v?8��p~��i��W��P��U>:L'�~���к��nQHzZ���X+
QS�3��\/�^��������m�'3���xo�����&M	z6:�U&r��toqw�=�����D�&G?��j��,�?Op�g��G(ﶒ��`�&\:�,=R���+��v�6���ө�֔����+�b�����p��pO�ЩjZV4��h���t`ZP���=�p�\�N5��_·�\.5��!�x�F��%�W��TKm�>�3��t�O)�-�~%���wkLMn���T�ô���G�!����! ��������	A���q�|�Mk;\;�M?�ڞ�L��bt��DK=+�!ޯ��{@Z�nQb�O��p���������:w��2�98W�Z�c�-z��6�gRW���ld�ծ�<��zf�k˚��]w�
z���U�<Q�t5K��L&��>��F?ײ��(����ҍv�D�W��sW{vU���GG��ĕ��d�&�+@���Lݧ�?�z�{ir�ъC2]��������r�~�1|�Z�ل7�֤l��O��Y�[�{ΐ��GLixX�����ˆ>�H����*��M��:��g��}(�F��]�p��P���\r���t�����<X�u��u�~�/��;_���j��WD�ڂ�����d)m`����D:�Ȫ�'4��T@�8�pƾ��b�O�=�����+�����=��6�#���mF�c.d-����U� ��ռ���Ծ��֡7��������jz�|�������;�Bueݰ`
����M̥ӆ�0�o�D����r��۟?�峤�      %   �	  x��[�o��N����6��(���K��],i8{���"�b-�蒔c0��&qg����C_Ȳ˲����sν�([��4{�ԑxyy��|��9�U�(r��7U�`���+�iie5ojZ�5�R�pö��i���T�(ԊV�TnUr�\N+q���/�O��-�Y�<6[�V��m޲�S׬��g�'���?z�]�M�ӥ��M�(�ߵ]���o\���_�M\�	������ɬܳ�*w��J6����v�3\����z���v�f�����J�T��R9�dP�,�!�#A�ڍƮ���a/)����&�n4��ם������[����i�tw������U�>S���ƭoÒ��׫���ڙE�[�[����E[��d���f�]h���z��)��_u}Y�|��y`�U�cx���=�@d��H,���d�l�Ѥk%v͠d@�9�|���.��Y���\&z�^c�����o(&�>��U�s���r^5���Պe��]6�Z��m�
��M�����͜�=˭o�Q�n�S�t�ˠ���g��5�~�6���Ip�� ��XЃ!����w��N�:���@�oC���[ت��k�9���`�`�>��ep]�7�)���xk �h��p��Y�>'������X�;��C�4<�����c\���5L�SFk����U�%p�� "Rݘ�uc�Fʬ4#� ��ID/G t�]_o��?I%(�^x|��ٍ4�"惵~��}�|�s_a;N���8g&�BP�M��q��/��K���>j	p��p�.��]�у����mp� ����|!2�D���7ӛ�ՙ]$�m�(���x>�7��7[8"��=�;�
�[[;s$����'xU��,�G��u���nL��@+B���� �A�h��\�ۣ�Hʠ���Z:�i�#�������θ�����Bm4!�n*�Ϝ����h���hf��M��V�A��.:`e��p6d�i^R`����)sD���x	g�����U�y.��]���->m�m��]p솳=ϯ�+"�����&��BR�Z%�g��N�v����&@�S�����s$ƍ�P��	��"%�p �D��=Op�=j'�7���D���m>�G���r�w�\l>�2���"���$(�'bw#�$�� ��xx�MZ�f�	��ioQ^3�r���9ժ�ըqK-��5��Je�(���:N�|��܅�dwW���}Ԑ�@6t��7 ��bU�5M7*��Պ�i����g|�qw����T��1B�X�9}B� �3���H$�ct�(I�0�Yʜ-1bv�ή���_�УЏ��e�"c����Dz�D�ŘJ&q	Kr�`�Q�>�(W2���:��P ��a�3JLb��`"���d�$˕�.n0�"S E_ ��F��.�"\g�[���R�U����pfʬ��:�L�$^���{���T21.5$��Q��A��
-��EP?�"�j�S�ՄH;$^;�u�(;�~�ż��Y_I_�?Z��PH�i{Q��z�<��.n�ˠ��B��Qq���#�`xK$L���j�>tn�5M��7��R���`�# �:��x.@*�.�#�^"����8J$��p�n~�,ї�!a�޴��;���e	4��p>����Qu-"7'Ҍ��naT>ʪ�O�?�n>���`A�UX��5�l�
ʁx A��*�s�[�LߝiRnЙh1�t��4���i.�kz�[C�M�jU�ꚥ�v1WՌ��/�i.�9�\M(ūNۿ'�̽++���e!ٟ%|{ ��\��l���e<D�{Ҹ]�`_��������jB�3�f��!g��ШMB?%���HkǱ�%�
�A)cwL'?��~�42���hVP�H�}*'�fS�?�F�N0H,��T̒�w�Q�#ZA����|�@�J2�_�Re�dB���0#�n�K/�J �S2���?HIB1�ĸ�c�+ݢ���/ڄ!�USf_.�ON�]ġp;'_yw�W3y��?�gb!��\�QKod\�\n�H3��7�}A �u���0(��֑lG���t�{��y<�ʖs&͉
~ �� LQe�v�:.HE]3M�X>w�J.D?1�x�@>�^'^" �#�;)ڣ7R��}��rC4��XG2��r�hg��a7�#�K�a�:}���N�C������{������D�>����9����5AZ�5AZ�5AZ�5�Ϯ	�k���� =NO�����t8=��O�?|:Lh���6=�Mh����H��
��_��>,�eM��j��êZ�V���j!W��F�.TM��y���t�.�j��Z��U�T4�J��릭}t��k�o�Mn=��y>����kz!7��et��D���'z��K���Ḟ}�����Z�      &   f   x����0�s����8M=;TBn�ÁT�؞��H�XPX[���q�5,՜=d��/~�4"��yT���&��RII�M��_��v`���OZ/D�ft      '   w   x�eϻ1�:���w	�	�{Jq���Q E&rZ�l'�I����l���M��}C%'�9�0=i�Q�|�/�K�Fw�$�O�u�vw,t�.���U����\��w�w�1��;     