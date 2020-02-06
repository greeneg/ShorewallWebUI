package System::Errors;

use strict;
use warnings;
use English;
use utf8;

use boolean;

BEGIN {
    use Exporter ();
    our ($VERSION, @ISA, @EXPORT);

    $VERSION     = '0.1';
    @ISA         = qw(Exporter);
    @EXPORT      = qw(
        %_errors
    );
}

our %_errors = (
    'EOK'   => {
        'code'  => '0',
        'msg'   => 'Success'
    },
    'EPERM' => {
        'code'  => '1',
        'msg'   => 'Operation not permitted'
   
    },
    'ENOENT' => {
        'code' => '2',
        'msg'  => 'No such file or directory'
    },
    'ESRCH' => {
        'code' => '3',
        'msg'  => 'No such process'
    },
    'EINTR' => {
        'code' => '4',
        'msg' => 'Interrupted system call'
    },
    'EIO' => {
        'code' => '5',
        'msg' => 'I/O error'
    },
    'ENXIO' => {
        'code' => '6',
        'msg' => 'No such device or address'
    },
    'E2BIG' => {
        'code' => '7',
        'msg' => 'Argument list too long'
    },
    'ENOEXEC' => {
        'code' => '8',
        'msg' => 'Exec format error'
    },
    'EBADF' => {
        'code' => '9',
        'msg' => 'Bad file number'
    },
    'ECHILD' => {
        'code' => '10',
        'msg' => 'No child processes'
    },
    'EAGAIN' => {
        'code' => '11',
        'msg' => 'Try again'
    },
    'EWOULDBLOCK' => {
        'code' => '11',
        'msg'  => 'Try again' 
    },
    'ENOMEM' => {
        'code' => '12',
        'msg' => 'Out of memory'
    },
    'EACCES' => {
        'code' => '13',
        'msg' => 'Permission denied'
    },
    'EFAULT' => {
        'code' => '14',
        'msg' => 'Bad address'
    },
    'ENOTBLK' => {
        'code' => '15',
        'msg' => 'Block device required'
    },
    'EBUSY' => {
        'code' => '16',
        'msg' => 'Device or resource busy'
    },
    'EEXIST' => {
        'code' => '17',
        'msg' => 'File exists'
    },
    'EXDEV' => {
        'code' => '18',
        'msg' => 'Cross-device link'
    },
    'ENODEV' => {
        'code' => '19',
        'msg' => 'No such device'
    },
    'ENOTDIR' => {
        'code' => '20',
        'msg' => 'Not a directory'
    },
    'EISDIR' => {
        'code' => '21',
        'msg' => 'Is a directory'
    },
    'EINVAL' => {
        'code' => '22',
        'msg' => 'Invalid argument'
    },
    'ENFILE' => {
        'code' => '23',
        'msg' => 'File table overflow'
    },
    'EMFILE' => {
        'code' => '24',
        'msg' => 'Too many open files'
    },
    'ENOTTY' => {
        'code' => '25',
        'msg' => 'Not a typewriter'
    },
    'ETXTBSY' => {
        'code' => '26',
        'msg' => 'Text file busy'
    },
    'EFBIG' => {
        'code' => '27',
        'msg' => 'File too large'
    },
    'ENOSPC' => {
        'code' => '28',
        'msg' => 'No space left on device'
    },
    'ESPIPE' => {
        'code' => '29',
        'msg' => 'Illegal seek'
    },
    'EROFS' => {
        'code' => '30',
        'msg' => 'Read-only file system'
    },
    'EMLINK' => {
        'code' => '31',
        'msg' => 'Too many links'
    },
    'EPIPE' => {
        'code' => '32',
        'msg' => 'Broken pipe'
    },
    'EDOM' => {
        'code' => '33',
        'msg' => 'Math argument out of domain of func'
    },
    'ERANGE' => {
        'code' => '34',
        'msg' => 'Math result not representable'
    },
    'EDEADLK' => {
        'code' => '35',
        'msg' => 'Resource deadlock would occur'
    },
    'EDEADLOCK' => {
        'code' => '35',
        'msg' => 'Resource deadlock would occur'
    },
    'ENAMETOOLONG' => {
        'code' => '36',
        'msg' => 'File name too long'
    },
    'ENOLCK' => {
        'code' => '37',
        'msg' => 'No record locks available'
    },
    'ENOSYS' => {
        'code' => '38',
        'msg' => 'Invalid system call number'
    },
    'ENOTEMPTY' => {
        'code' => '39',
        'msg' => 'Directory not empty'
    },
    'ELOOP' => {
        'code' => '40',
        'msg' => 'Too many symbolic links encountered'
    },
    'ENOMSG' => {
        'code' => '42',
        'msg' => 'No message of desired type'
    },
    'EIDRM' => {
        'code' => '43',
        'msg' => 'Identifier removed'
    },
    'ECHRNG' => {
        'code' => '44',
        'msg' => 'Channel number out of range'
    },
    'EL2NSYNC' => {
        'code' => '45',
        'msg' => 'Level 2 not synchronized'
    },
    'EL3HLT' => {
        'code' => '46',
        'msg' => 'Level 3 halted'
    },
    'EL3RST' => {
        'code' => '47',
        'msg' => 'Level 3 reset'
    },
    'ELNRNG' => {
        'code' => '48',
        'msg' => 'Link number out of range'
    },
    'EUNATCH' => {
        'code' => '49',
        'msg' => 'Protocol driver not attached'
    },
    'ENOCSI' => {
        'code' => '50',
        'msg' => 'No CSI structure available'
    },
    'EL2HLT' => {
        'code' => '51',
        'msg' => 'Level 2 halted'
    },
    'EBADE' => {
        'code' => '52',
        'msg' => 'Invalid exchange'
    },
    'EBADR' => {
        'code' => '53',
        'msg' => 'Invalid request descriptor'
    },
    'EXFULL' => {
        'code' => '54',
        'msg' => 'Exchange full'
    },
    'ENOANO' => {
        'code' => '55',
        'msg' => 'No anode'
    },
    'EBADRQC' => {
        'code' => '56',
        'msg' => 'Invalid request code'
    },
    'EBADSLT' => {
        'code' => '57',
        'msg' => 'Invalid slot'
    },
    'EBFONT' => {
        'code' => '59',
        'msg' => 'Bad font file format'
    },
    'ENOSTR' => {
        'code' => '60',
        'msg' => 'Device not a stream'
    },
    'ENODATA' => {
        'code' => '61',
        'msg' => 'No data available'
    },
    'ETIME' => {
        'code' => '62',
        'msg' => 'Timer expired'
    },
    'ENOSR' => {
        'code' => '63',
        'msg' => 'Out of streams resources'
    },
    'ENONET' => {
        'code' => '64',
        'msg' => 'Machine is not on the network'
    },
    'ENOPKG' => {
        'code' => '65',
        'msg' => 'Package not installed'
    },
    'EREMOTE' => {
        'code' => '66',
        'msg' => 'Object is remote'
    },
    'ENOLINK' => {
        'code' => '67',
        'msg' => 'Link has been severed'
    },
    'EADV' => {
        'code' => '68',
        'msg' => 'Advertise error'
    },
    'ESRMNT' => {
        'code' => '69',
        'msg' => 'Srmount error'
    },
    'ECOMM' => {
        'code' => '70',
        'msg' => 'Communication error on send'
    },
    'EPROTO' => {
        'code' => '71',
        'msg' => 'Protocol error'
    },
    'EMULTIHOP' => {
        'code' => '72',
        'msg' => 'Multihop attempted'
    },
    'EDOTDOT' => {
        'code' => '73',
        'msg' => 'RFS specific error'
    },
    'EBADMSG' => {
        'code' => '74',
        'msg' => 'Not a data message'
    },
    'EOVERFLOW' => {
        'code' => '75',
        'msg' => 'Value too large for defined data type'
    },
    'ENOTUNIQ' => {
        'code' => '76',
        'msg' => 'Name not unique on network'
    },
    'EBADFD' => {
        'code' => '77',
        'msg' => 'File descriptor in bad state'
    },
    'EREMCHG' => {
        'code' => '78',
        'msg' => 'Remote address changed'
    },
    'ELIBACC' => {
        'code' => '79',
        'msg' => 'Can not access a needed shared library'
    },
    'ELIBBAD' => {
        'code' => '80',
        'msg' => 'Accessing a corrupted shared library'
    },
    'ELIBSCN' => {
        'code' => '81',
        'msg' => '.lib section in a.out corrupted'
    },
    'ELIBMAX' => {
        'code' => '82',
        'msg' => 'Attempting to link in too many shared libraries'
    },
    'ELIBEXEC' => {
        'code' => '83',
        'msg' => 'Cannot exec a shared library directly'
    },
    'EILSEQ' => {
        'code' => '84',
        'msg' => 'Illegal byte sequence'
    },
    'ERESTART' => {
        'code' => '85',
        'msg' => 'Interrupted system call should be restarted'
    },
    'ESTRPIPE' => {
        'code' => '86',
        'msg' => 'Streams pipe error'
    },
    'EUSERS' => {
        'code' => '87',
        'msg' => 'Too many users'
    },
    'ENOTSOCK' => {
        'code' => '88',
        'msg' => 'Socket operation on non-socket'
    },
    'EDESTADDRREQ' => {
        'code' => '89',
        'msg' => 'Destination address required'
    },
    'EMSGSIZE' => {
        'code' => '90',
        'msg' => 'Message too long'
    },
    'EPROTOTYPE' => {
        'code' => '91',
        'msg' => 'Protocol wrong type for socket'
    },
    'ENOPROTOOPT' => {
        'code' => '92',
        'msg' => 'Protocol not available'
    },
    'EPROTONOSUPPORT' => {
        'code' => '93',
        'msg' => 'Protocol not supported'
    },
    'ESOCKTNOSUPPORT' => {
        'code' => '94',
        'msg' => 'Socket type not supported'
    },
    'EOPNOTSUPP' => {
        'code' => '95',
        'msg' => 'Operation not supported on transport endpoint'
    },
    'EPFNOSUPPORT' => {
        'code' => '96',
        'msg' => 'Protocol family not supported'
    },
    'EAFNOSUPPORT' => {
        'code' => '97',
        'msg' => 'Address family not supported by protocol'
    },
    'EADDRINUSE' => {
        'code' => '98',
        'msg' => 'Address already in use'
    },
    'EADDRNOTAVAIL' => {
        'code' => '99',
        'msg' => 'Cannot assign requested address'
    },
    'ENETDOWN' => {
        'code' => '100',
        'msg' => 'Network is down'
    },
    'ENETUNREACH' => {
        'code' => '101',
        'msg' => 'Network is unreachable'
    },
    'ENETRESET' => {
        'code' => '102',
        'msg' => 'Network dropped connection because of reset'
    },
    'ECONNABORTED' => {
        'code' => '103',
        'msg' => 'Software caused connection abort'
    },
    'ECONNRESET' => {
        'code' => '104',
        'msg' => 'Connection reset by peer'
    },
    'ENOBUFS' => {
        'code' => '105',
        'msg' => 'No buffer space available'
    },
    'EISCONN' => {
        'code' => '106',
        'msg' => 'Transport endpoint is already connected'
    },
    'ENOTCONN' => {
        'code' => '107',
        'msg' => 'Transport endpoint is not connected'
    },
    'ESHUTDOWN' => {
        'code' => '108',
        'msg' => 'Cannot send after transport endpoint shutdown'
    },
    'ETOOMANYREFS' => {
        'code' => '109',
        'msg' => 'Too many references: cannot splice'
    },
    'ETIMEDOUT' => {
        'code' => '110',
        'msg' => 'Connection timed out'
    },
    'ECONNREFUSED' => {
        'code' => '111',
        'msg' => 'Connection refused'
    },
    'EHOSTDOWN' => {
        'code' => '112',
        'msg' => 'Host is down'
    },
    'EHOSTUNREACH' => {
        'code' => '113',
        'msg' => 'No route to host'
    },
    'EALREADY' => {
        'code' => '114',
        'msg' => 'Operation already in progress'
    },
    'EINPROGRESS' => {
        'code' => '115',
        'msg' => 'Operation now in progress'
    },
    'ESTALE' => {
        'code' => '116',
        'msg' => 'Stale file handle'
    },
    'EUCLEAN' => {
        'code' => '117',
        'msg' => 'Structure needs cleaning'
    },
    'ENOTNAM' => {
        'code' => '118',
        'msg' => 'Not a XENIX named type file'
    },
    'ENAVAIL' => {
        'code' => '119',
        'msg' => 'No XENIX semaphores available'
    },
    'EISNAM' => {
        'code' => '120',
        'msg' => 'Is a named type file'
    },
    'EREMOTEIO' => {
        'code' => '121',
        'msg' => 'Remote I/O error'
    },
    'EDQUOT' => {
        'code' => '122',
        'msg' => 'Quota exceeded'
    },
    'ENOMEDIUM' => {
        'code' => '123',
        'msg' => 'No medium found'
    },
    'EMEDIUMTYPE' => {
        'code' => '124',
        'msg' => 'Wrong medium type'
    },
    'ECANCELED' => {
        'code' => '125',
        'msg' => 'Operation Canceled'
    },
    'ENOKEY' => {
        'code' => '126',
        'msg' => 'Required key not available'
    },
    'EKEYEXPIRED' => {
        'code' => '127',
        'msg' => 'Key has expired'
    },
    'EKEYREVOKED' => {
        'code' => '128',
        'msg' => 'Key has been revoked'
    },
    'EKEYREJECTED' => {
        'code' => '129',
        'msg' => 'Key was rejected by service'
    },
    'EOWNERDEAD' => {
        'code' => '130',
        'msg' => 'Owner died'
    },
    'ENOTRECOVERABLE' => {
        'code' => '131',
        'msg' => 'State not recoverable'
    },
    'ERFKILL' => {
        'code' => '132',
        'msg' => 'Operation not possible due to RF-kill'
    },
    'EHWPOISON' => {
        'code' => '133',
        'msg' => 'Memory page has hardware error'
    },
    'EWRONGPKGTYPE' => {
        'code' => '200',
        'msg' => 'Invalide package type'
    }
);

true;
