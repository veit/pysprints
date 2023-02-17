:mod:`cldr` --- Unicode Common Locale Data Repository for Python
================================================================

.. module:: cldr
   :synopsis: Unicode Common Locale Data Repository for Python
.. moduleauthor:: Martin v. Löwis <martin@v.loewis.de>

The :mod:`cldr` module supplies classes for localizing data. The focus of the
implementation is on efficient extraction of the iCLDR XML file for output
formatting and manipulation. For related functionality, see also the
:mod:`datetime` module.

The :mod:`cldr` module exports the following LDML base classes:


.. class:: Alias

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`special`
       a list of :class:`Special`
     :attr:`alt`
       string
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`path`
       string
     :attr:`source`
       string

.. class:: Any

   - XXX child of YYY element

.. class:: Cp

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`special`
       a list of :class:`Special`
     :attr:`hex`
       string

.. class:: Default

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`special`
       a list of :class:`Special`
     :attr:`alt`
       string
     :attr:`choice`
       string
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`references`
       string
     :attr:`type`
       string

.. class:: Empty

   - XXX child of YYY element

.. class:: Fallback

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`alt`
       string
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`references`
       string

.. class:: Generation

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`date`
       e.g. ``'$Date: 2012-10-15 11:02:42 -0700 (Mon, 15 Oct 2012) $'``

.. class:: Identity

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`generation`
       an instance of :class:`Generation`
     :attr:`language`
       an instance of :class:`Language`
     :attr:`script`
       an instance of :class:`Script`
     :attr:`special`
       a list of :class:`Special`
     :attr:`territory`
       an instance of :class:`Territory`
     :attr:`variant`
       an instance of :class:`Variant`
     :attr:`version`
       an instance of :class:`Version`

.. class:: LDMLBase

   - XXX child of YYY element

.. class:: Language

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`alt`
       string
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`references`
       string
     :attr:`type`
       BCP 47 subtag values marked as type language, e.g. ``'en'`` (English) or ``'gmh'`` (Middle High German)

.. class:: Languages

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`language`
       dictionary of :class:`Language`, keyed by ``type=``
     :attr:`special`
       a list of :class:`Special`
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`references`
       string
     :attr:`standard`
       string
     :attr:`validSublocales`
       string

.. class:: LocaleDisplayNames

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`codePatterns`
       an instance of :class:`Codepatterns`
     :attr:`keys`
       an instance of :class:`Keys`
     :attr:`languages`
       an instance of :class:`Languages`
     :attr:`localeDisplayPattern`
       an instance of :class:`Localedisplaypattern`
     :attr:`measurementSystemNames`
       an instance of :class:`Measurementsystemnames`
     :attr:`scripts`
       an instance of :class:`Scripts`
     :attr:`special`
       a list of :class:`Special`
     :attr:`territories`
       an instance of :class:`Territories`
     :attr:`transformNames`
       an instance of :class:`Transformnames`
     :attr:`types`
       an instance of :class:`Types`
     :attr:`variants`
       an instance of :class:`Variants`
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.

.. class:: LocaleDisplayPattern

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`localeKeyTypePattern`
       a list of :class:`Localekeytypepattern`
     :attr:`localePattern`
       a list of :class:`Localepattern`
     :attr:`localeSeparator`
       a list of :class:`Localeseparator`
     :attr:`special`
       a list of :class:`Special`
     :attr:`alt`
       string
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`reference`
       string

.. class:: Numbers

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`currencies`
       an instance of :class:`Currencies`
     :attr:`currencyFormats`
       dictionary of :class:`Currencyformats`, keyed by ``numberSystem=``
     :attr:`decimalFormats`
       dictionary of :class:`Decimalformats`, keyed by ``numberSystem=``
     :attr:`defaultNumberingSystem`
       a list of :class:`Defaultnumberingsystem`
     :attr:`otherNumberingSystems`
       a list of :class:`Othernumberingsystems`
     :attr:`percentFormats`
       dictionary of :class:`Percentformats`, keyed by ``numberSystem=``
     :attr:`scientificFormats`
       dictionary of :class:`Scientificformats`, keyed by ``numberSystem=``
     :attr:`special`
       a list of :class:`Special`
     :attr:`symbols`
       dictionary of :class:`Symbols`, keyed by ``numberSystem=``

.. class:: PCDATA

   - XXX child of YYY element

.. class:: PresumedEmpty

   - XXX child of YYY element

.. class:: Script

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`alt`
       string
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`references`
       string
     :attr:`type`
       BCP 47 subtag values marked as type script, e.g. Arab (Arabic) or Cyrl (Cyrillic)

.. class:: Special

   - XXX child of YYY element

.. class:: Symbols

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`currencyDecimal`
       an instance of :class:`Currencydecimal`
     :attr:`currencyGroup`
       an instance of :class:`Currencygroup`
     :attr:`decimal`
       an instance of :class:`Decimal`
     :attr:`exponential`
       an instance of :class:`Exponential`
     :attr:`group`
       an instance of :class:`Group`
     :attr:`infinity`
       an instance of :class:`Infinity`
     :attr:`list`
       an instance of :class:`List`
     :attr:`minusSign`
       an instance of :class:`Minussign`
     :attr:`nan`
       an instance of :class:`Nan`
     :attr:`nativeZeroDigit`
       an instance of :class:`Nativezerodigit`
     :attr:`patternDigit`
       an instance of :class:`Patterndigit`
     :attr:`perMille`
       an instance of :class:`Permille`
     :attr:`percentSign`
       an instance of :class:`Percentsign`
     :attr:`plusSign`
       an instance of :class:`Plussign`
     :attr:`special`
       a list of :class:`Special`
     :attr:`alt`
       string
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`numberSystem`
       string
     :attr:`references`
       string
     :attr:`standard`
       string
     :attr:`validSubLocales`
       string

.. class:: Territories

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`special`
       a list of :class:`Special`
     :attr:`territory`
       dictionary of :class:`Territory`, keyed by ``type=``
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`references`
       string
     :attr:`standard`
       string
     :attr:`validSublocales`
       string

.. class:: Territory

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`alt`
       string
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`references`
       string
     :attr:`type`
       a BCP 47 subtag value of type region, e.g. GB or DE

.. class:: Variant

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`alt`
       string
     :attr:`draft`
       One of the values ``'approved'``, ``'contributed'``, ``'provisional'``, ``'unconfirmed'``.
     :attr:`references`
       string
     :attr:`type`
       a BCP 47 subtag of type variant, e.g. ``'1901'`` (Traditional German Orthography)

.. class:: Version

   - XXX child of YYY element
   - the class has the following attributes:

     :attr:`cldrVersion`
       string
     :attr:`number`
       e.g. ``'$Revision: 7847 $'``
