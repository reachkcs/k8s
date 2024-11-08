export FILEN=ingress-controller-iam-policy.json
cat <<EOF > ${FILEN}
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "elasticloadbalancing:*",
                "ec2:Describe*",
                "ec2:ModifyInstanceAttribute",
                "ec2:DescribeInstanceStatus",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcs",
                "iam:ListAttachedRolePolicies",
                "iam:ListRoles",
                "iam:ListPolicyVersions",
                "iam:ListAttachedUserPolicies",
                "iam:ListUserPolicies",
                "iam:GetPolicy",
                "iam:GetPolicyVersion",
                "iam:GetUser",
                "iam:ListAttachedGroupPolicies",
                "iam:GetGroup",
                "iam:ListGroupPolicies",
                "iam:GetPolicyVersion",
                "iam:ListRolePolicies",
                "iam:GetRole",
                "iam:ListRoleTags",
                "iam:GetRolePolicy",
                "iam:ListUserTags",
                "iam:GetUserPolicy",
                "iam:ListUserPolicies",
                "iam:ListRoleTags",
                "iam:ListGroupTags",
                "iam:ListRolePolicies"
            ],
            "Resource": "*"
        }
    ]
}

EOF
set -x
aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://${FILEN}

