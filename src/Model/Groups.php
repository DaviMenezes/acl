<?php

namespace Dvi\Acl\Model;

use Dvi\Support\Model\ModelAdianti;

/**
 *  RuleGroups
 *
 * @package
 * @subpackage
 * @author     Davi Menezes
 * @copyright  Copyright (c) 2018. (davimenezes.dev@gmail.com)
 * @see https://github.com/DaviMenezes
 * @property string $id
 * @property string $name
 */
class Groups extends ModelAdianti
{
    public const TABLENAME = 'acl_groups';

    protected $fillable = ['id','name'];
}
