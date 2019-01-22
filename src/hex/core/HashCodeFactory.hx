package hex.core;

using hex.error.Error;

/**
 * ...
 * @author Francis Bourre
 */
@:final 
class HashCodeFactory
{
    /** @private */
    function new()
    {
        throw new PrivateConstructorException();
    }

    static var _nKEY    : Int               = 0;
    static var _M       = new Map<{}, Int>();

    public static function getNextKEY() : Int
    {
        return HashCodeFactory._nKEY++;
    }

    public static function getNextName() : String
    {
        return "" + HashCodeFactory._nKEY;
    }

    public static function getKey( o : Dynamic ) : Int
    {
        if ( !HashCodeFactory._M.exists( o ) )
        {
            HashCodeFactory._M.set( o, HashCodeFactory.getNextKEY() );
        }

        return HashCodeFactory._M.get( o );
    }

    public static function previewNextKey() : Int
    {
        return HashCodeFactory._nKEY;
    }
}
