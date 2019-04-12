<?php

namespace Dvi\Acl\Model;

use Dvi\Support\Model\ModelAdianti;

/**
 *  UserActionTypes
 *
 * @package
 * @subpackage
 * @author     Davi Menezes
 * @copyright  Copyright (c) 2018. (davimenezes.dev@gmail.com)
 * @see https://github.com/DaviMenezes
 * @property string $id
 * @property string $name
 */
class ActionTypes extends ModelAdianti
{
    public const TABLENAME = 'acl_action_types';

    protected $fillable = ['id', 'name'];
}
