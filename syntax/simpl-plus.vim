if exists("b:current_syntax")
  finish
endif

" Case insensitive matching (SIMPL+ is case insensitive)
syn case ignore

" -------------------------------------------------------------------------
" Comments
" -------------------------------------------------------------------------
syntax match simplLineComment "//.*$"
syntax region simplBlockComment start="/\*" end="\*/" keepend

" -------------------------------------------------------------------------
" Preprocessor directives
" -------------------------------------------------------------------------
syntax match simplPreproc "^\s*#\s*\(PRINT_TO_TRACE\|ENABLE_DYNAMIC\|ENABLE_STACK_CHECKING\|LARGE_STACK\|ENABLE_TRACE\|ENCODING_ASCII\|ENCODING_INHERIT_FROM_PARENT\|ENCODING_INHERIT_FROM_PROGRAM\|ENCODING_UTF16\|DEFAULT_NONVOLATILE\|DEFAULT_VOLATILE\|ENDIF\|IF_SERIES2\|IF_SERIES3\|IF_SERIES4\)" 
syntax match simplPreproc "^\s*#\s*\(DEFINE_CONSTANT\|CATEGORY\|CRESTRON_LIBRARY\|USER_LIBRARY\|CRESTRON_SIMPLSHARP_LIBRARY\|USER_SIMPLSHARP_LIBRARY\|INCLUDEPATH\|HINT\|HELP\|SYMBOL_NAME\|OUTPUT_SHIFT\|MAX_INTERNAL_BUFFER_SIZE\)"
syntax match simplPreproc "^\s*#\s*\(analog_serial_expand\|digital_expand\)"
syntax match simplPreproc "^\s*#\s*\(if_defined\|if_not_defined\)"
syntax match simplPreproc "^\s*#\s*\(BEGIN_PARAMETER_PROPERTIES\|END_PARAMETER_PROPERTIES\)"
syntax match simplPreproc "^\s*#\s*\(propValidUnits\|propDefaultUnits\|propDefaultValue\|propList\|propUpperBound\|propLowerBound\|propShortDescription\)"
syntax region simplPreprocHelp start="^\s*#\s*help_begin" end="^\s*#\s*help_end" keepend
syntax region simplPreprocDesc start="^\s*#\s*begin_prop_full_description" end="^\s*#\s*end_prop_full_description" keepend
syntax region simplPreprocDesc start="^\s*#\s*begin_prop_notes" end="^\s*#\s*end_prop_notes" keepend

" -------------------------------------------------------------------------
" Storage modifiers
" -------------------------------------------------------------------------
syntax keyword simplStorageModifier volatile nonvolatile dynamic ascii utf16 inherit delegateproperty threadsafe

" -------------------------------------------------------------------------
" Input / Output types
" -------------------------------------------------------------------------
syntax keyword simplIOType digital_input analog_input buffer_input string_input
syntax keyword simplIOType digital_output analog_output buffer_output string_output

" -------------------------------------------------------------------------
" Parameter types
" -------------------------------------------------------------------------
syntax keyword simplParamType integer_parameter string_parameter long_integer_parameter signed_integer_parameter signed_long_integer_parameter

" -------------------------------------------------------------------------
" Variable / data types
" -------------------------------------------------------------------------
syntax keyword simplType integer string long_integer signed_integer signed_long_integer SIMPLSHARPSTRING
syntax keyword simplType cevent cmutex file_info ramp_info
syntax keyword simplType tcp_client tcp_server udp_socket
syntax keyword simplType structure

" -------------------------------------------------------------------------
" Function declaration keywords
" -------------------------------------------------------------------------
syntax keyword simplFunctionType function eventhandler integer_function string_function long_integer_function signed_integer_function signed_long_integer_function simplsharpstring_function GatherEventHandler
syntax keyword simplFunctionModifier callback

" -------------------------------------------------------------------------
" Event keywords
" -------------------------------------------------------------------------
syntax keyword simplEvent push event change release socketconnect socketdisconnect socketreceive socketstatus

" -------------------------------------------------------------------------
" Control flow keywords
" -------------------------------------------------------------------------
syntax keyword simplControl if else while do until for return break continue
syntax keyword simplControl switch cswitch case default
syntax keyword simplControl try catch
syntax keyword simplControl to step

" -------------------------------------------------------------------------
" Parameter modifiers
" -------------------------------------------------------------------------
syntax keyword simplParamModifier ByVal ByRef ReadOnlyByRef

" -------------------------------------------------------------------------
" Built-in constants
" -------------------------------------------------------------------------
syntax keyword simplConstant ON OFF
syntax keyword simplConstant _O_APPEND _O_CREAT _O_EXCL _O_TRUNC _O_TEXT _O_BINARY _O_RDONLY _O_RDWR _O_WRONLY ENCODING_ASCII ENCODING_UTF16 ENCODING_INHERIT
syntax keyword simplConstant ARDONLY AHIDDEN ASYSTEM AVOLUME ADIRENT ARCHIVE SEEK_SET SEEK_CUR SEEK_END

" -------------------------------------------------------------------------
" Built-in variables
" -------------------------------------------------------------------------
syntax keyword simplBuiltinVar _oem_break _oem_cd _oem_cts _oem_dtr _oem_long_break _oem_max_string _oem_pacing _oem_rts _oem_str_in _oem_str_out

" -------------------------------------------------------------------------
" Built-in functions (return value)
" -------------------------------------------------------------------------
syntax keyword simplFunction Atoi Atosi Atol Atosl Chr HexToI HexToL HexToSI HexToSL Itoa Itohex Ltoa Ltohex
syntax keyword simplFunction Random Rnd
syntax keyword simplFunction CompareStrings CompareStringsNoCase Find FindNoCase Gather GatherByLength GatherAsync GatherAsyncByLength GatherByLengthWithDest ReArmGatherAsync RemoveGatherAsync
syntax keyword simplFunction GetC Left Len Lower Upper Mid Remove RemoveByLength ResizeString ReverseFind ReverseFindNoCase Right SetString
syntax keyword simplFunction abs max min muldiv smax smin
syntax keyword simplFunction Bit Byte High HighWord Low LowWord LowerChar RotateLeft RotateLeftLong RotateRight RotateRightLong SetByte UpperChar
syntax keyword simplFunction FileBOF FileClose FileDelete FileDeleteShared FileEOF FileLength CheckForDisk GetCurrentDirectory
syntax keyword simplFunction FileOpen FileOpenShared FileRead FileSeek FileWrite FindClose FindFirst FindFirstShared FindNext
syntax keyword simplFunction IsDirectory IsHidden IsReadOnly IsSystem IsVolume MakeDirectory MakeDirectoryShared
syntax keyword simplFunction ReadInteger ReadIntegerArray ReadLongInteger ReadLongIntegerArray ReadSignedInteger ReadSignedIntegerArray
syntax keyword simplFunction ReadSignedLongInteger ReadSignedLongIntegerArray ReadString ReadStringArray CheckForNVRAMDisk
syntax keyword simplFunction RemoveDirectory RemoveDirectoryShared SetCurrentDirectory StartFileOperations EndFileOperations WaitForNewDisk
syntax keyword simplFunction WriteInteger WriteIntegerArray WriteLongInteger WriteLongIntegerArray WriteSignedInteger
syntax keyword simplFunction WriteSignedIntegerArray WriteSignedLongInteger WriteSignedLongIntegerArray WriteString WriteStringArray IsNull
syntax keyword simplFunction Date Day FileDate FileDay FileGetDateNum FileGetDayOfWeekNum FileGetHourNum
syntax keyword simplFunction FileGetMinutesNum FileGetMonthNum FileGetSecondsNum FileGetYearNum FileMonth FileTime GetDateNum
syntax keyword simplFunction GetDayOfWeekNum GetDST GetGMTOffset GetHourNum GetHSeconds GetMinutesNum GetMonthNum GetSecondsNum
syntax keyword simplFunction GetTicks GetYearNum month SetGMTOffset Time
syntax keyword simplFunction SocketConnectClient SocketDisconnectClient
syntax keyword simplFunction SocketGetAddressAsRequested SocketGetPortNumber SocketGetRemoteIPAddress SocketGetSenderIPAddress
syntax keyword simplFunction SocketGetStatus SocketIsBroadcast SocketIsMulticast SocketSend SocketServerStartListen
syntax keyword simplFunction SocketServerStopListen SocketUDP_Disable SocketUDP_Enable
syntax keyword simplFunction SendMail SendMailAdvance SendMailWithAttachments
syntax keyword simplFunction CompareRampsByAttribute CompareRampsByID CreateRamp GetRampInfo IsRamping RAMP_INFO StopRamp
syntax keyword simplFunction GetEncoding SetEncoding ToAscii ToUtf16
syntax keyword simplFunction GetSlot GetCresnet GetCIP GetSymbolInstanceName GetSymbolReferenceName MakeProgramFilename GetModelNumber GetSeries IsSignalDefined
syntax keyword simplFunction GetLastModifiedArrayIndex GetNumArrayCols GetNumArrayRows GetNumStructureArrayCols ResizeArray ResizeStructureArray
syntax keyword simplFunction GetExceptionCode GetExceptionMessage
syntax keyword simplFunction not

" -------------------------------------------------------------------------
" Built-in void functions
" -------------------------------------------------------------------------
syntax keyword simplVoidFunction Seed ClearBuffer
syntax keyword simplVoidFunction delay ProcessLogic pulse WaitForInitializationComplete
syntax keyword simplVoidFunction GenerateUserNotice GenerateUserWarning GenerateUserError SendPacketToCPU SendCresnetPacket SetCresnet SetSlot SetCIP
syntax keyword simplVoidFunction CancelAllWait CancelWait PauseAllWait PauseWait ResumeAllWait ResumeWait RetimeWait
syntax keyword simplVoidFunction Makestring Print Trace
syntax keyword simplVoidFunction ReadStructure WriteStructure
syntax keyword simplVoidFunction SetDate SetClock
syntax keyword simplVoidFunction InitializeRampInfoArray InitializeRampInfo
syntax keyword simplVoidFunction RegisterDelegate RegisterEvent
syntax keyword simplVoidFunction SetArray
syntax keyword simplVoidFunction wait

" -------------------------------------------------------------------------
" Operators
" -------------------------------------------------------------------------
syntax match simplOperator "<=\|>=\|S<=\|S>=\|S<\|S>"
syntax match simplOperator "<<\|>>"
syntax match simplOperator "&&\|\|\|"
syntax match simplOperator "[+\-\*\/\%\&\^\|!]"
syntax match simplOperator "{{" 
syntax match simplOperator "}}"
syntax match simplOperator "="
syntax keyword simplOperator mod umod

" -------------------------------------------------------------------------
" Numeric literals
" -------------------------------------------------------------------------
syntax match simplNumber "\b0[xX][0-9a-fA-F]\+\b"
syntax match simplNumber "\b[0-9]\+\b"

" -------------------------------------------------------------------------
" String and char literals
" -------------------------------------------------------------------------
syntax region simplString start='"' end='"' keepend contains=simplStringEscape
syntax region simplChar start="'" end="'" keepend
syntax match simplStringEscape "%%\|%[0-9]*[dsuludluxXlxlXc]\|\\[abfnrtvxX]\|\\\\|\\[0-9a-fA-F]\{2\}" contained

" -------------------------------------------------------------------------
" Highlight group links
" -------------------------------------------------------------------------
highlight link simplLineComment     Comment
highlight link simplBlockComment    Comment
highlight link simplPreproc         PreProc
highlight link simplPreprocHelp     Comment
highlight link simplPreprocDesc     Comment
highlight link simplStorageModifier StorageClass
highlight link simplIOType          Type
highlight link simplParamType       Type
highlight link simplType            Type
highlight link simplFunctionType    Type
highlight link simplFunctionModifier StorageClass
highlight link simplEvent           Keyword
highlight link simplControl         Conditional
highlight link simplParamModifier   StorageClass
highlight link simplConstant        Constant
highlight link simplBuiltinVar      Identifier
highlight link simplFunction        Function
highlight link simplVoidFunction    Function
highlight link simplOperator        Operator
highlight link simplNumber          Number
highlight link simplString          String
highlight link simplChar            Character
highlight link simplStringEscape    SpecialChar

let b:current_syntax = "simpl-plus"
