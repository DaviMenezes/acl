<?php

namespace Dvi\Acl\Model;

use Dvi\Support\Model\ModelAdianti;

/**
 *  Modules
 *
 * @package
 * @subpackage
 * @author     Davi Menezes
 * @copyright  Copyright (c) 2018. (davimenezes.dev@gmail.com)
 * @see https://github.com/DaviMenezes
 * @property string $id
 * @property string $name
 * @property string $description
 */
class Modules extends ModelAdianti
{
    public const TABLENAME = 'acl_modules';

    protected $fillable = ['id', 'name', 'description'];
}
