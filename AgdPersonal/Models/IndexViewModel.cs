﻿using AgdPersonal.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AgdPersonal.Models
{
    public class IndexViewModel
    {
        public About About { get; set; }

        public IEnumerable<Skill> Skills { get; set; }

        public IEnumerable<Service> Services { get; set; }

        public Slogan ServiceSlogan { get; set; }
        public Slogan SkillSlogan { get; set; }
    }
}